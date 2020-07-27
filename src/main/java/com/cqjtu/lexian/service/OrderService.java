package com.cqjtu.lexian.service;

import com.cqjtu.lexian.domain.Customer;
import com.cqjtu.lexian.domain.Order;
import com.cqjtu.lexian.domain.OrderItem;
import com.cqjtu.lexian.domain.PayWay;

import java.util.List;

/**
 * OrderService
 *
 * @author suwen
 */
public interface OrderService {
  /**
   * 根据一个订单id查询一个订单
   *
   * @param orderId 订单id
   * @return 订单
   */
  Order getOrder(int orderId);

  /**
   * 通过orderItemId获取orderItem对象
   *
   * @param orderItemId 订单项编号
   * @return 订单商品项
   */
  OrderItem getOrderItem(int orderItemId);
  /**
   * 提交订单
   *
   * @param order 订单
   * @return 订单
   */
  Order submitOrder(Order order);

  /**
   * 获取支付方式
   *
   * @return 支付方式列表
   */
  List<PayWay> getPayways();

  /**
   * 更新订单
   *
   * @param order 订单
   * @return 订单
   */
  Order payOrder(Order order);

  /**
   * 根据订单状态查询顾客的订单个数
   *
   * @param customer 顾客信息
   * @param status 状态
   * @return 订单个数
   */
  int getOrderCountByStatus(Customer customer, int status);

  /**
   * 获取未评论的订单项数
   *
   * @param customer 顾客信息
   * @return 未评论的订单项数
   */
  int getNotCommentCount(Customer customer);

  /**
   * 获得顾客的所有未删除的订单
   *
   * @param customer 顾客信息
   * @return 所有未删除的订单
   */
  List<Order> getOrderByStatus(Customer customer, int status);

  /**
   * 获取订单中有未评论的订单
   *
   * @param customer 顾客信息
   * @return 未评论的订单
   */
  List<Order> getNotCommentOrder(Customer customer);

  /**
   * 删除订单，实际是把订单的status更新为OrderStatus.DELETE
   *
   * @param orderId 订单编号
   */
  void deleteOrder(int orderId);

  /**
   * 确认收货，把Order的status更新为FINISH
   *
   * @param orderId 订单编号
   */
  void recOrder(int orderId);

  /**
   * 评论商品项，订单商品项的commented修改为1
   *
   * @param orderItem 订单编号
   */
  void commentOrderItem(OrderItem orderItem);

  /**
   * 获取所有订单
   *
   * @return 订单列表
   */
  List<Order> getAllOrder();

  /**
   * 更新订单
   *
   * @param order 订单
   */
  void updateOrder(Order order);
}
