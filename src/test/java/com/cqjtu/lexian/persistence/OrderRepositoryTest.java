package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.Customer;
import com.cqjtu.lexian.domain.Order;
import com.cqjtu.lexian.domain.OrderItem;
import com.cqjtu.lexian.domain.OrderStatus;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class OrderRepositoryTest {
  @Autowired private OrderRepository orderRepository;
  @Autowired private CustomerRepository customerRepository;
  @Autowired private GoodsRepository goodsRepository;
  @Autowired private PayWayRepository payWayRepository;
  @Autowired private RecAddrRepository recAddrRepository;
  @Autowired private OrderItemRepository orderItemRepository;

  @Test
  public void testSaveOrder() {
    Order order = new Order();
    order.setCreateTime(new Date());
    order.setCustomer(customerRepository.findOne(2));
    order.setLogisticsFee(20);
    order.setLogisticsNum("5544332211");
    order.setOrderNum("1122334455");
    order.setPayWay(payWayRepository.findOne(1));
    order.setServiceFee(10);
    order.setAmount(100);
    order.setRecAddr(recAddrRepository.findOne(1));
    order.setStatus(0);
    List<OrderItem> orderItems = new ArrayList<OrderItem>();
    //        Order order = orderRepository.findOne(1);
    OrderItem orderItem = new OrderItem();
    orderItem.setNum(10);
    orderItem.setOrder(order);
    orderItem.setGoods(goodsRepository.findOne(1));
    orderItems.add(orderItem);
    order.setOrderItems(orderItems);
    orderRepository.save(order);
  }

  @Test
  public void deleteOrderItem() {
    orderRepository.delete(1);
  }

  @Test
  public void countTest() {
    Customer customer = customerRepository.findOne(3);
    System.out.println(orderRepository.countByCustomerAndStatus(customer, OrderStatus.PAYED));
  }

  @Test
  public void countByStatus() {
    Customer customer = customerRepository.findOne(3);
    orderRepository.countByCustomerAndStatus(customer, OrderStatus.PAYED);
  }

  @Test
  public void testCountNotComm() {
    //        System.out.println(orderItemRepository.countByCommentedAndOrder());
  }
}
