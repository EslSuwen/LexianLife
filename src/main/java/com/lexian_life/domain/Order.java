package com.lexian_life.domain;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/** Created by dengxiaobing on 2017/9/22. */
@Entity
@Table(name = "orderform")
public class Order {
  @Column(name = "order_id")
  @Id
  @GeneratedValue
  private int orderId;

  @ManyToOne
  @JoinColumn(name = "cus_id")
  private Customer customer;

  @ManyToOne
  @JoinColumn(name = "recaddr_id")
  private RecAddr recAddr;

  @ManyToOne
  @JoinColumn(name = "payway_id")
  private PayWay payWay;

  @Column(name = "order_num")
  private String orderNum;

  @Column(name = "create_time")
  private Date createTime;

  @Column(name = "status")
  private int status;

  @Column(name = "amount")
  private double amount;

  @Column(name = "logistics_fee")
  private double logisticsFee;

  @Column(name = "logistics_num")
  private String logisticsNum;

  @Column(name = "service_fee")
  private double serviceFee;

  @Column(name = "pay_time")
  private Date payTime;

  @OneToMany(
      mappedBy = "order",
      cascade = {CascadeType.ALL},
      fetch = FetchType.EAGER)
  private List<OrderItem> orderItems;

  public int getOrderId() {
    return orderId;
  }

  public void setOrderId(int orderId) {
    this.orderId = orderId;
  }

  public Customer getCustomer() {
    return customer;
  }

  public void setCustomer(Customer customer) {
    this.customer = customer;
  }

  public RecAddr getRecAddr() {
    return recAddr;
  }

  public void setRecAddr(RecAddr recAddr) {
    this.recAddr = recAddr;
  }

  public PayWay getPayWay() {
    return payWay;
  }

  public void setPayWay(PayWay payWay) {
    this.payWay = payWay;
  }

  public String getOrderNum() {
    return orderNum;
  }

  public void setOrderNum(String orderNum) {
    this.orderNum = orderNum;
  }

  public Date getCreateTime() {
    return createTime;
  }

  public void setCreateTime(Date createTime) {
    this.createTime = createTime;
  }

  public int getStatus() {
    return status;
  }

  public void setStatus(int status) {
    this.status = status;
  }

  public double getAmount() {
    return amount;
  }

  public void setAmount(double amount) {
    this.amount = amount;
  }

  public double getLogisticsFee() {
    return logisticsFee;
  }

  public void setLogisticsFee(double logisticsFee) {
    this.logisticsFee = logisticsFee;
  }

  public String getLogisticsNum() {
    return logisticsNum;
  }

  public void setLogisticsNum(String logisticsNum) {
    this.logisticsNum = logisticsNum;
  }

  public double getServiceFee() {
    return serviceFee;
  }

  public void setServiceFee(double serviceFee) {
    this.serviceFee = serviceFee;
  }

  public Date getPayTime() {
    return payTime;
  }

  public void setPayTime(Date payTime) {
    this.payTime = payTime;
  }

  public List<OrderItem> getOrderItems() {
    return orderItems;
  }

  public void setOrderItems(List<OrderItem> orderItems) {
    this.orderItems = orderItems;
  }
}
