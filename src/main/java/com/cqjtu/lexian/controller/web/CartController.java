package com.cqjtu.lexian.controller.web;

import com.cqjtu.lexian.domain.*;
import com.cqjtu.lexian.exception.CustomerServiceException;
import com.cqjtu.lexian.service.CartService;
import com.cqjtu.lexian.service.CustomerService;
import com.cqjtu.lexian.service.GoodsService;
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
import java.util.Objects;

/**
 * CartController 购物车控制器
 *
 * @author suwen
 */
@Controller
public class CartController {
  @Autowired private CartService cartService;
  @Autowired private GoodsService goodsService;
  @Autowired private CustomerService customerService;

  /**
   * 通过商品编号获取购物车中 item
   *
   * @param cart 购物车信息
   * @return 购物车中 item 信息
   */
  private CartItem getCartItemByGoodsIdFromCart(Cart cart, int goodsId) {
    for (CartItem each : cart.getCartItems()) {
      if (each.getGoods().getGoodsId() == goodsId) {
        return each;
      }
    }
    return null;
  }

  /**
   * 查看购物车
   *
   * @param session HttpSession
   * @return 查看购物车页面
   */
  @RequestMapping(
      value = "/viewCart",
      method = {RequestMethod.GET})
  public String viewCart(HttpSession session) {
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null) {
      Customer customer = (Customer) session.getAttribute("customer");
      // 顾客未登录，跳转到登录页面
      if (customer == null) {
        return "/foreground/user/Login";
      } else {
        cart = cartService.getCart(customer);
        // 数据库中还没有购物车
        if (cart == null) {
          cart = new Cart();
          cart.setCustomer(customer);
          cart.setCartItems(new ArrayList<>());
        }
      }
    }
    session.setAttribute("cart", cart);
    return "/foreground/cart/ViewCart";
  }

  /**
   * 把商品添加到购物车
   *
   * @param goodsId 商品编号
   */
  @RequestMapping(
      value = "/addToCart",
      method = {RequestMethod.GET})
  public void addToCart(
      @RequestParam(name = "goods_id") Integer goodsId,
      @RequestParam(required = false, defaultValue = "1") Integer num,
      HttpSession session,
      HttpServletResponse response) {
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null) {
      Customer customer = (Customer) session.getAttribute("customer");
      // 顾客未登录，跳转到登录页面
      if (customer == null) {
        try {
          response.sendRedirect("/page/foreground/user/Login.jsp");
          return;
        } catch (IOException e) {
          e.printStackTrace();
        }
      } else {
        cart = cartService.getCart(customer);
        // 数据库中还没有购物车
        if (cart == null) {
          cart = new Cart();
          cart.setCustomer(customer);
          cart.setCartItems(new ArrayList<>());
          cartService.saveCart(cart);
        }
      }
    }
    cart = cartService.getCart(Objects.requireNonNull(cart).getCustomer());
    CartItem cartItem = getCartItemByGoodsIdFromCart(cart, goodsId);
    // 购物车中还没有此商品
    if (cartItem == null) {
      cartItem = new CartItem();
      cartItem.setSelected(1);
      cartItem.setNum(num);
      cartItem.setGoods(goodsService.findGoodsById(goodsId));
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
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  /** 修改购物车项的商品数量 */
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
    if (cartItem != null) {
      cartItem.setNum(num);
    }
    cartService.saveCart(cart);
    JSONObject jsonObject = new JSONObject();
    outPutJsonObject(response, jsonObject);
  }

  /**
   * 设置购物车商品项是否为被选中
   *
   * @param cartItemId 购物车商品项
   * @param selected 选中
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
    outPutJsonObject(response, jsonObject);
  }

  /**
   * 移除购物车商品项
   *
   * @param cartItemId 购物车商品项
   * @return 购物车页面
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
   * @param goodsId 商品编号
   * @param num 商品数量
   * @return 确认订单页面
   */
  @RequestMapping(
      value = "/buyNow",
      method = {RequestMethod.GET})
  public String buyNow(
      @RequestParam(name = "goods_id") Integer goodsId, int num, HttpSession session) {
    Customer customer = (Customer) session.getAttribute("customer");
    if (customer == null) {
      return "/foreground/user/Login";
    }
    try {
      List<RecAddr> recAddrList = customerService.listRecAddr(customer);
      session.setAttribute("recAddrs", recAddrList);
      Order order = new Order();
      order.setCustomer(customer);
      List<OrderItem> orderItems = new ArrayList<>();
      OrderItem orderItem = new OrderItem();
      Goods goods = goodsService.getGoodsById(goodsId);
      orderItem.setGoods(goods);
      orderItem.setNum(num);
      orderItems.add(orderItem);
      orderItem.setOrder(order);

      order.setOrderItems(orderItems);
      order.setServiceFee(order.getOrderItems().size());
      order.setLogisticsFee(order.getOrderItems().size() * 10);
      order.setAmount(goods.getUnitPrice() * num);
      session.setAttribute("order", order);
    } catch (CustomerServiceException e) {
      e.printStackTrace();
    }
    return "/foreground/cart/SettleAccount";
  }

  /**
   * 确定订单
   *
   * @return 确定订单页面
   */
  @RequestMapping(
      value = "/toSettleAccount",
      method = {RequestMethod.GET, RequestMethod.POST})
  public String toSettleAccount(HttpSession session) {
    Customer customer = (Customer) session.getAttribute("customer");
    try {
      List<RecAddr> recAddrList = customerService.listRecAddr(customer);
      session.setAttribute("recAddrs", recAddrList);
      Order order = new Order();
      order.setCustomer(customer);
      Cart cart = (Cart) session.getAttribute("cart");
      List<OrderItem> orderItems = new ArrayList<>();
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
      order.setServiceFee(order.getOrderItems().size());
      order.setLogisticsFee(order.getOrderItems().size() * 10);
      order.setAmount(cart.getTotalPrice());
      session.setAttribute("order", order);
    } catch (CustomerServiceException e) {
      e.printStackTrace();
    }
    return "/foreground/cart/SettleAccount";
  }

  /**
   * 增加地址
   *
   * @param getRecAddr 地址信息
   */
  @RequestMapping(
      value = "/addAddressWidthAccount",
      method = {RequestMethod.POST})
  public void addAddressWithAccount(
      RecAddr getRecAddr, HttpServletRequest request, HttpServletResponse response) {
    try {
      Customer customer = (Customer) request.getSession().getAttribute("customer");
      getRecAddr.setCusId(customer.getCusId());
      customerService.addRecAddress(getRecAddr);
    } catch (CustomerServiceException ignored) {
    }
    try {
      response.sendRedirect("/toSettleAccount.do");
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  /**
   * 选择收货人地址ajax
   *
   * @param recaddrId 地址编号
   */
  @RequestMapping(
      value = "/selectAddressWidthAccount",
      method = {RequestMethod.GET})
  public void selectAddressWidthAccount(
      int recaddrId, HttpSession session, HttpServletResponse response) {

    List<RecAddr> recAddrList = (List<RecAddr>) session.getAttribute("recAddrs");
    RecAddr recAddr =
        recAddrList.stream().filter(o -> o.getRecaddrId() == recaddrId).findFirst().orElse(null);
    String encoding = "utf-8";
    response.setContentType("text/plain;charset=" + encoding);
    response.setCharacterEncoding(encoding);
    PrintWriter pw;
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
    } catch (IOException | JSONException e) {
      e.printStackTrace();
    }
  }

  private void outPutJsonObject(HttpServletResponse response, JSONObject jsonObject) {
    String encoding = "utf-8";
    response.setContentType("text/plain;charset=" + encoding);
    response.setCharacterEncoding(encoding);
    PrintWriter pw;
    try {
      jsonObject.put("result", true);
      pw = response.getWriter();
      pw.println(jsonObject.toString());
      pw.flush();
      pw.close();
    } catch (JSONException | IOException e) {
      e.printStackTrace();
    }
  }
}
