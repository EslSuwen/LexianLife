package com.cqjtu.lexian.service.impl;

import com.cqjtu.lexian.domain.*;
import com.cqjtu.lexian.persistence.GoodsRepository;
import com.cqjtu.lexian.persistence.OrderItemRepository;
import com.cqjtu.lexian.persistence.OrderRepository;
import com.cqjtu.lexian.persistence.PayWayRepository;
import com.cqjtu.lexian.service.OrderService;
import com.google.common.collect.Lists;
import org.apache.commons.collections.IteratorUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * OrderServiceImpl
 *
 * @author suwen
 */
@Service
public class OrderServiceImpl implements OrderService {
  @Autowired private OrderRepository orderRepository;
  @Autowired private OrderItemRepository orderItemRepository;
  @Autowired private PayWayRepository payWayRepository;
  @Autowired private GoodsRepository goodsRepository;

  @Override
  public Order getOrder(int orderId) {
    return orderRepository.findOne(orderId);
  }

  @Override
  public OrderItem getOrderItem(int orderItemId) {
    return orderItemRepository.findOne(orderItemId);
  }

  /**
   * 提交订单
   *
   * @param order
   * @return
   */
  @Override
  public Order submitOrder(Order order) {
    order.setStatus(OrderStatus.NOTPAY);
    order.setCreateTime(new Date());
    order.setOrderNum(createOrderNum(order));
    for (int i = 0; i < order.getOrderItems().size(); i++) {
      Goods goods = order.getOrderItems().get(i).getGoods();
      goods.setSaleCount(goods.getSaleCount() + order.getOrderItems().get(i).getNum()); // 修改商品的总销量
      goodsRepository.save(goods);
    }
    return orderRepository.save(order);
  }

  @Override
  public List<PayWay> getPayways() {
    return IteratorUtils.toList(payWayRepository.findAll().iterator());
  }

  @Override
  public Order payOrder(Order order) {
    order.setStatus(OrderStatus.PAYED);
    order.setPayTime(new Date());
    return orderRepository.save(order);
  }

  @Override
  public int getOrderCountByStatus(Customer customer, int status) {
    return orderRepository.countByCustomerAndStatus(customer, status);
  }

  @Override
  public int getNotCommentCount(Customer customer) {
    int count = 0;
    List<Order> orders = orderRepository.findAllByStatusAndCustomer(OrderStatus.FINISH, customer);
    for (int i = 0; i < orders.size(); i++) {
      for (int j = 0; j < orders.get(i).getOrderItems().size(); j++) {
        if (orders.get(i).getOrderItems().get(j).getCommented() == 0) count++;
      }
    }
    return count;
  }

  @Override
  public List<Order> getOrderByStatus(Customer customer, int status) {
    return orderRepository.findAllByStatusAndCustomer(status, customer);
  }

  @Override
  public List<Order> getNotCommentOrder(Customer customer) {
    List<Order> orders = orderRepository.findAllByStatusAndCustomer(OrderStatus.FINISH, customer);
    List<Order> notCommentOrders = new ArrayList();
    for (int i = 0; i < orders.size(); i++) {
      boolean commented = true;
      for (int j = 0; j < orders.get(i).getOrderItems().size(); j++) {
        if (orders.get(i).getOrderItems().get(j).getCommented() == 0) {
          commented = false;
          break;
        }
      }
      if (!commented) notCommentOrders.add(orders.get(i));
    }
    return notCommentOrders;
  }

  @Override
  public void deleteOrder(int orderId) {
    Order order = orderRepository.findOne(orderId);
    order.setStatus(OrderStatus.DELETE);
    orderRepository.save(order);
  }

  @Override
  public void recOrder(int orderId) {
    Order order = orderRepository.findOne(orderId);
    order.setStatus(OrderStatus.FINISH);
    orderRepository.save(order);
  }

  @Override
  public void commentOrderItem(OrderItem orderItem) {
    orderItem.setCommented(1);
    orderItemRepository.save(orderItem);
  }

  /**
   * 生成订单号
   *
   * @param order
   * @return
   */
  private String createOrderNum(Order order) {
    String hasCode = order.hashCode() + "";
    String time = System.currentTimeMillis() + "";
    return "LX" + hasCode + time.substring(time.length() - 3);
  }

  @Override
  public List<Order> getAllOrder() {
    return Lists.newArrayList(orderRepository.findAll());
  }

  @Override
  public void updateOrder(Order order) {
    orderRepository.save(order);
  }
}
