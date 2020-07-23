package com.cqjtu.lexian.controller.web;

import com.cqjtu.lexian.domain.*;
import com.cqjtu.lexian.service.OrderService;
import com.lexian_life.domain.*;
import com.cqjtu.lexian.service.CartService;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

/** Created by dengxiaobing on 2017/9/23. */
@Controller
public class OrderController {
  @Autowired private OrderService orderService;
  @Autowired private CartService cartService;
  /**
   * 提交订单
   *
   * @return
   */
  @RequestMapping(
      value = "/submitOrder",
      method = {RequestMethod.GET})
  public void submitOrder(HttpSession session, HttpServletResponse response) {
    try {
      Order order = (Order) session.getAttribute("order");
      if (order.getRecAddr() == null) {
        session.setAttribute("submitOrderFail", "请选择收货人地址");
        response.sendRedirect("/page/foreground/cart/SettleAccount.jsp");
        return;
      }
      Order submitedOrder = orderService.submitOrder(order);
      session.setAttribute("payways", orderService.getPayways());
      if (submitedOrder == null) {
        response.sendRedirect("/page/foreground/Error.jsp");
        return;
      } else { // 订单提交成功，把订单中的商品项从购物车中移除
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null) {
          removeItemFromCart(cart);
        }
        session.setAttribute("order", submitedOrder);
        response.sendRedirect("/page/foreground/cart/PayPage.jsp");
        return;
      }
    } catch (IOException ioe) {
      ioe.printStackTrace();
    }
  }

  private void removeItemFromCart(Cart cart) {
    Iterator<CartItem> itemIterator = cart.getCartItems().iterator();
    while (itemIterator.hasNext()) {
      CartItem item = itemIterator.next();
      if (item.getSelected() == 1) {
        cartService.removeCartItem(item.getCartItemId());
        itemIterator.remove();
      }
    }
  }

  private PayWay getPaywayById(List<PayWay> payWays, int paywayId) {
    for (int i = 0; i < payWays.size(); i++) {
      if (payWays.get(i).getPaywayId() == paywayId) return payWays.get(i);
    }
    return null;
  }

  /**
   * 选择支付方式 ajax
   *
   * @param paywayId
   * @param session
   * @param response
   */
  @RequestMapping(
      value = "/selectPayway",
      method = {RequestMethod.GET})
  public void selectPayway(int paywayId, HttpSession session, HttpServletResponse response) {
    Order order = (Order) session.getAttribute("order");
    List<PayWay> payWays = (List<PayWay>) session.getAttribute("payways");
    order.setPayWay(getPaywayById(payWays, paywayId));
    String encoding = "utf-8";
    response.setContentType("text/plain;charset=" + encoding);
    response.setCharacterEncoding(encoding);
    PrintWriter pw = null;
    JSONObject jsonObject = new JSONObject();
    try {
      pw = response.getWriter();
      jsonObject.put("result", true);
      pw.println(jsonObject.toString());
      pw.flush();
      pw.close();
    } catch (IOException e) {
      e.printStackTrace();
    } catch (JSONException e) {
      e.printStackTrace();
    }
  }

  /**
   * 支付
   *
   * @param session
   * @param response
   */
  @RequestMapping(
      value = "/pay",
      method = {RequestMethod.GET})
  public void pay(HttpSession session, HttpServletResponse response) {
    try {
      Order order = (Order) session.getAttribute("order");
      if (order.getPayWay() == null) {
        session.setAttribute("payFail", "请选择一种支付方式");
        response.sendRedirect("/page/foreground/cart/PayPage.jsp");
        return;
      }
      session.setAttribute("order", orderService.payOrder(order));
      response.sendRedirect("/page/foreground/cart/PaySuccess.jsp");
      return;
    } catch (IOException ioe) {
      ioe.printStackTrace();
    }
  }

  /**
   * 支付还未付款的订单
   *
   * @param orderId
   * @param session
   * @param response
   */
  @RequestMapping(
      value = "/payNotPayedOrder",
      method = {RequestMethod.GET})
  public void payNotPayedOrder(int orderId, HttpSession session, HttpServletResponse response) {
    try {
      Order order = orderService.getOrder(orderId);
      if (order == null) {
        session.setAttribute("errorMsg", "此订单不存在");
        response.sendRedirect("/page/foreground/Error.jsp");
        return;
      } else {
        response.sendRedirect("/page/foreground/cart/PayPage.jsp");
      }
      if (session.getAttribute("payways") == null) {
        session.setAttribute("payways", orderService.getPayways());
      }
      session.setAttribute("order", order);
    } catch (IOException ioe) {
      ioe.printStackTrace();
    }
  }
  /**
   * 查看订单
   *
   * @param request
   * @return
   */
  @RequestMapping(
      value = "/viewOrder",
      method = {RequestMethod.GET})
  public String ViewOrder(HttpServletRequest request) {
    Customer customer = (Customer) request.getSession().getAttribute("customer");
    if (customer == null) return "/foreground/user/Login";
    List<Order> finishedOrders = orderService.getOrderByStatus(customer, OrderStatus.FINISH);
    List<Order> waitPayOrders = orderService.getOrderByStatus(customer, OrderStatus.NOTPAY);
    List<Order> waitSendOrders = orderService.getOrderByStatus(customer, OrderStatus.PAYED);
    waitSendOrders.addAll(orderService.getOrderByStatus(customer, OrderStatus.READY));
    List<Order> waitRecOrders = orderService.getOrderByStatus(customer, OrderStatus.NOTRECEIVE);
    List<Order> notCommentOrders = orderService.getNotCommentOrder(customer);
    request.setAttribute("finishedOrders", finishedOrders);
    request.setAttribute("waitPayOrders", waitPayOrders);
    request.setAttribute("waitSendOrders", waitSendOrders);
    request.setAttribute("waitRecOrders", waitRecOrders);
    request.setAttribute("notCommentOrders", notCommentOrders);
    return "foreground/user/Order";
  }

  /**
   * 删除订单
   *
   * @param orderId
   * @param response
   */
  @RequestMapping(
      value = "/deleteOrder",
      method = {RequestMethod.GET})
  public void deleteOrder(int orderId, HttpServletResponse response) {
    boolean result = true;
    try {
      orderService.deleteOrder(orderId);
    } catch (RuntimeException re) {
      result = false;
    }
    String encoding = "utf-8";
    response.setContentType("text/plain;charset=" + encoding);
    response.setCharacterEncoding(encoding);
    PrintWriter pw = null;
    JSONObject jsonObject = new JSONObject();
    try {
      pw = response.getWriter();
      jsonObject.put("result", result);
      pw.println(jsonObject.toString());
      pw.flush();
      pw.close();
    } catch (IOException ioe) {

    } catch (JSONException e) {
      e.printStackTrace();
    }
  }

  /**
   * 确认收货
   *
   * @param orderId
   * @return
   */
  @RequestMapping(
      value = "/confiremRec",
      method = {RequestMethod.GET})
  public void confirmRec(int orderId, HttpServletRequest request, HttpServletResponse response) {
    orderService.recOrder(orderId);
    try {
      request.getRequestDispatcher("/viewOrder.do").forward(request, response);
    } catch (ServletException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  /**
   * 去评论商品
   *
   * @param orderId
   * @param request
   * @return
   */
  @RequestMapping(
      value = "/toComment",
      method = {RequestMethod.GET})
  public String toComment(int orderId, HttpServletRequest request) {
    Order order = orderService.getOrder(orderId);
    request.setAttribute("commentOrder", order);
    return "foreground/user/Comment";
  }
}
