package com.lexian_life.controller.web;

import com.lexian_life.domain.*;
import com.lexian_life.exception.CustomerServiceException;
import com.lexian_life.service.CartService;
import com.lexian_life.service.CustomerService;
import com.lexian_life.service.GoodsService;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/** Created by dengxiaobing on 2017/9/21. */
@Controller
public class CartController {
  @Autowired private CartService cartService;
  @Autowired private GoodsService goodsService;
  @Autowired private CustomerService customerService;

  private CartItem getCartItemByGoodsIdFromCart(Cart cart, int goodsId) {
    for (int i = 0; i < cart.getCartItems().size(); i++) {
      if (cart.getCartItems().get(i).getGoods().getGoodsId() == goodsId) {
        return cart.getCartItems().get(i);
      }
    }
    return null;
  }

  @RequestMapping(
      value = "/viewCart",
      method = {RequestMethod.GET})
  public String viewCart(HttpSession session) {
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null) {
      Customer customer = (Customer) session.getAttribute("customer");
      if (customer == null) {
        return "/foreground/user/Login";
      } else {
        cart = cartService.getCart(customer);
        if (cart == null) {
          cart = new Cart();
          cart.setCustomer(customer);
          cart.setCartItems(new ArrayList<CartItem>());
        }
      }
    }
    session.setAttribute("cart", cart);
    return "/foreground/cart/ViewCart";
  }

  /**
   * 把商品添加到购物车
   *
   * @param goods_id
   * @param session
   * @return
   */
  @RequestMapping(
      value = "/addToCart",
      method = {RequestMethod.GET})
  public void addToCart(
      int goods_id,
      @RequestParam(required = false) Integer num,
      HttpSession session,
      HttpServletResponse response) {
    if (num == null) num = 1;
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null) {
      Customer customer = (Customer) session.getAttribute("customer");
      if (customer == null) { // 顾客未登录，跳转到登录页面
        try {
          response.sendRedirect("/page/foreground/user/Login.jsp");
          return;
        } catch (IOException e) {
          e.printStackTrace();
        }
      } else {
        cart = cartService.getCart(customer);
        if (cart == null) { // 数据库中还没有购物车
          cart = new Cart();
          cart.setCustomer(customer);
          cart.setCartItems(new ArrayList<CartItem>());
          cartService.saveCart(cart);
        }
      }
    }
    cart = cartService.getCart(cart.getCustomer());
    CartItem cartItem = getCartItemByGoodsIdFromCart(cart, goods_id);
    if (cartItem == null) { // 购物车中还没有此商品
      cartItem = new CartItem();
      cartItem.setSelected(1);
      cartItem.setNum(num);
      cartItem.setGoods(goodsService.findGoodsById(goods_id));
      cartItem.setCart(cart);
      cart.getCartItems().add(cartItem);
    } else {
      cartItem.setNum(cartItem.getNum() + num);
      cartItem.setSelected(1);
    }
    cart = cartService.saveCart(cart);
    session.setAttribute("cart", cart);
    try {
      response.sendRedirect("/page/foreground/cart/ViewCart.jsp");
      return;
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  /**
   * 修改购物车项的商品数量
   *
   * @param response
   */
  @RequestMapping(
      value = "/updateCartItemNum",
      method = {RequestMethod.GET})
  public void updateCartItemNum(
      int cartItemId, int num, HttpSession session, HttpServletResponse response) {
    Cart cart = (Cart) session.getAttribute("cart");
    CartItem cartItem = null;
    for (int i = 0; i < cart.getCartItems().size(); i++) {
      if (cart.getCartItems().get(i).getCartItemId() == cartItemId) {
        cartItem = cart.getCartItems().get(i);
        break;
      }
    }
    cartItem.setNum(num);
    cartService.saveCart(cart);
    JSONObject jsonObject = new JSONObject();
    String encoding = "utf-8";
    response.setContentType("text/plain;charset=" + encoding);
    response.setCharacterEncoding(encoding);
    PrintWriter pw = null;
    try {
      jsonObject.put("result", true);
      pw = response.getWriter();
    } catch (JSONException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
    pw.println(jsonObject.toString());
    pw.flush();
    pw.close();
  }

  /**
   * 设置购物车商品项是否为被选中
   *
   * @param cartItemId
   * @param selected
   * @param session
   * @param response
   */
  @RequestMapping(
      value = "/selectCartItem",
      method = {RequestMethod.GET})
  public void selectCartItem(
      int cartItemId, int selected, HttpSession session, HttpServletResponse response) {
    JSONObject jsonObject = new JSONObject();
    Cart cart = (Cart) session.getAttribute("cart");
    for (int i = 0; i < cart.getCartItems().size(); i++) {
      if (cart.getCartItems().get(i).getCartItemId() == cartItemId) {
        cart.getCartItems().get(i).setSelected(selected);
        cartService.selectedCartItem(cartItemId, selected);
        break;
      }
    }
    String encoding = "utf-8";
    response.setContentType("text/plain;charset=" + encoding);
    response.setCharacterEncoding(encoding);
    PrintWriter pw = null;
    try {
      jsonObject.put("result", true);
      pw = response.getWriter();
      pw.println(jsonObject.toString());
    } catch (JSONException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
    pw.flush();
    pw.close();
  }

  /**
   * 移除购物车商品项
   *
   * @param cartItemId
   * @param session
   */
  @RequestMapping(
      value = "/removeCartItem",
      method = {RequestMethod.GET})
  public String removeCartItem(int cartItemId, HttpSession session) {
    Cart cart = (Cart) session.getAttribute("cart");
    for (int i = 0; i < cart.getCartItems().size(); i++) {
      if (cart.getCartItems().get(i).getCartItemId() == cartItemId) {
        cart.getCartItems().remove(cart.getCartItems().get(i));
        break;
      }
    }
    cartService.removeCartItem(cartItemId);
    return "/foreground/cart/ViewCart";
  }

  /**
   * 立即购买
   *
   * @param goods_id
   * @param session
   * @return
   */
  @RequestMapping(
      value = "/buyNow",
      method = {RequestMethod.GET})
  public String buyNow(int goods_id, int num, HttpSession session) {
    Customer customer = (Customer) session.getAttribute("customer");
    try {
      List<RecAddr> recAddrs = customerService.listRecAddr(customer);
      session.setAttribute("recAddrs", recAddrs);
      Order order = new Order();
      order.setCustomer(customer);
      List<OrderItem> orderItems = new ArrayList<OrderItem>();
      OrderItem orderItem = new OrderItem();
      Goods goods = goodsService.getGoodsById(goods_id);
      orderItem.setGoods(goods);
      orderItem.setNum(num);
      orderItems.add(orderItem);
      orderItem.setOrder(order);

      order.setOrderItems(orderItems);
      order.setServiceFee(order.getOrderItems().size() * 1);
      order.setLogisticsFee(order.getOrderItems().size() * 10);
      order.setAmount(goods.getUnitPrice() * num);
      session.setAttribute("order", order);
    } catch (CustomerServiceException e) {
      e.printStackTrace();
    }
    return "/foreground/cart/SettleAccount";
  }

  @RequestMapping(
      value = "/toSettleAccount",
      method = {RequestMethod.GET, RequestMethod.POST})
  public String toSettleAccount(HttpSession session) {
    Customer customer = (Customer) session.getAttribute("customer");
    try {
      List<RecAddr> recAddrs = customerService.listRecAddr(customer);
      session.setAttribute("recAddrs", recAddrs);
      Order order = new Order();
      order.setCustomer(customer);
      Cart cart = (Cart) session.getAttribute("cart");
      List<OrderItem> orderItems = new ArrayList<OrderItem>();
      for (int i = 0; i < cart.getCartItems().size(); i++) {
        CartItem item = cart.getCartItems().get(i);
        if (item.getSelected() == 1) {
          OrderItem orderItem = new OrderItem();
          orderItem.setGoods(item.getGoods());
          orderItem.setNum(item.getNum());
          orderItems.add(orderItem);
          orderItem.setOrder(order);
        }
      }
      order.setOrderItems(orderItems);
      order.setServiceFee(order.getOrderItems().size() * 1);
      order.setLogisticsFee(order.getOrderItems().size() * 10);
      order.setAmount(cart.getTotalPrice());
      session.setAttribute("order", order);
    } catch (CustomerServiceException e) {
      e.printStackTrace();
    }
    return "/foreground/cart/SettleAccount";
  }

  @RequestMapping(
      value = "/addAddressWidthAccount",
      method = {RequestMethod.POST})
  public void addAddressWithAccount(
      RecAddr getRecAddr, HttpServletRequest request, HttpServletResponse response) {
    try {
      Customer customer = (Customer) request.getSession().getAttribute("customer");
      getRecAddr.setCusId(customer.getCusId());
      customerService.addRecAddress(getRecAddr);
    } catch (CustomerServiceException e) {
    }
    try {
      response.sendRedirect("/toSettleAccount.do");
      return;
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  private RecAddr getRecAddrByAddrId(List<RecAddr> recAddrs, int recaddrId) {
    for (int i = 0; i < recAddrs.size(); i++) {
      if (recAddrs.get(i).getRecaddrId() == recaddrId) return recAddrs.get(i);
    }
    return null;
  }

  /**
   * 选择收货人地址ajax
   *
   * @param recaddrId
   * @param session
   * @param response
   */
  @RequestMapping(
      value = "/selectAddressWidthAccount",
      method = {RequestMethod.GET})
  public void selectAddressWidthAccount(
      int recaddrId, HttpSession session, HttpServletResponse response) {
    List<RecAddr> recAddrs = (List<RecAddr>) session.getAttribute("recAddrs");
    RecAddr recAddr = getRecAddrByAddrId(recAddrs, recaddrId);
    String encoding = "utf-8";
    response.setContentType("text/plain;charset=" + encoding);
    response.setCharacterEncoding(encoding);
    PrintWriter pw = null;
    JSONObject jsonObject = new JSONObject();
    try {
      if (recAddr == null) {
        jsonObject.put("result", false);
        jsonObject.put("msg", "此收货人地址不存在");
      } else {
        jsonObject.put("result", true);
        Order order = (Order) session.getAttribute("order");
        order.setRecAddr(recAddr);
      }
      pw = response.getWriter();
      pw.println(jsonObject.toString());
      pw.flush();
      pw.close();
    } catch (IOException e) {
      e.printStackTrace();
    } catch (JSONException e) {
      e.printStackTrace();
    }
  }
}
