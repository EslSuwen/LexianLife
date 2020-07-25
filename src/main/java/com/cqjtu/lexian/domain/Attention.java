package com.cqjtu.lexian.domain;

import javax.persistence.*;

/**
 * Attention 用户关注商品实体
 *
 * @author suwen
 */
@Entity
@Table(name = "attention")
public class Attention {
  @Column(name = "att_id")
  @Id
  @GeneratedValue
  private int attId;

  @ManyToOne()
  @JoinColumn(name = "cus_id")
  private Customer customer;

  @ManyToOne()
  @JoinColumn(name = "goods_id")
  private Goods goods;

  public int getAttId() {
    return attId;
  }

  public void setAttId(int attId) {
    this.attId = attId;
  }

  public Customer getCustomer() {
    return customer;
  }

  public void setCustomer(Customer customer) {
    this.customer = customer;
  }

  public Goods getGoods() {
    return goods;
  }

  public void setGoods(Goods goods) {
    this.goods = goods;
  }
}
