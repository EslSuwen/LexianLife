package com.cqjtu.lexian.domain;

import javax.persistence.*;

/**
 * OrderItem 订单实体
 *
 * @author suwen
 */
@Entity
@Table(name = "orderitem")
public class OrderItem {
  @Column(name = "orderitem_id")
  @Id
  @GeneratedValue
  private int orderItemId;

  @ManyToOne
  @JoinColumn(name = "goods_id")
  private Goods goods;

  @ManyToOne
  @JoinColumn(name = "order_id")
  private Order order;

  @Column(name = "num")
  private int num;

  @Column(name = "commented")
  private int commented;

  public int getOrderItemId() {
    return orderItemId;
  }

  public void setOrderItemId(int orderItemId) {
    this.orderItemId = orderItemId;
  }

  public Goods getGoods() {
    return goods;
  }

  public void setGoods(Goods goods) {
    this.goods = goods;
  }

  public Order getOrder() {
    return order;
  }

  public void setOrder(Order order) {
    this.order = order;
  }

  public int getNum() {
    return num;
  }

  public void setNum(int num) {
    this.num = num;
  }

  public int getCommented() {
    return commented;
  }

  public void setCommented(int commented) {
    this.commented = commented;
  }
}
