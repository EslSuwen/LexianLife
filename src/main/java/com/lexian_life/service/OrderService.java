package com.lexian_life.service;

import com.lexian_life.domain.*;

import java.util.List;

/** Created by dengxiaobing on 2017/9/23. */
public interface OrderService {
  /**
   * 根据一个订单id查询一个订单
   *
   * @param orderId
   * @return
   */
  Order getOrder(int orderId);

  /**
   * 通过orderItemId获取orderItem对象
   *
   * @param orderItemId
   * @return
   */
  OrderItem getOrderItem(int orderItemId);
  /**
   * 提交订单
   *
   * @param order
   * @return
   */
  Order submitOrder(Order order);

  /**
   * 获取支付方式
   *
   * @return
   */
  List<PayWay> getPayways();

  /**
   * 更新订单
   *
   * @param order
   * @return
   */
  Order payOrder(Order order);

  /**
   * 根据订单状态查询顾客的订单个数
   *
   * @param customer
   * @param status
   * @return
   */
  int getOrderCountByStatus(Customer customer, int status);

  /**
   * 获取未评论的订单项数
   *
   * @param customer
   * @return
   */
  int getNotCommentCount(Customer customer);

  /**
   * 获得顾客的所有未删除的订单
   *
   * @param customer
   * @return
   */
  List<Order> getOrderByStatus(Customer customer, int status);

  /**
   * 获取订单中有未评论的订单
   *
   * @param customer
   * @return
   */
  List<Order> getNotCommentOrder(Customer customer);

  /**
   * 删除订单，实际是把订单的status更新为OrderStatus.DELETE
   *
   * @param orderId
   */
  void deleteOrder(int orderId);

  /**
   * 确认收货，把Order的status更新为FINISH
   *
   * @param orderId
   */
  void recOrder(int orderId);

  /**
   * 评论商品项，rdcn商品项的commented修改为1
   *
   * @param orderItem
   */
  void commentOrderItem(OrderItem orderItem);

  List<Order> getAllOrder();

  void updateOrder(Order order);
}
