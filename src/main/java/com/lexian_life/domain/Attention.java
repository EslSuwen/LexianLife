package com.lexian_life.domain;

import javax.persistence.*;

/** Created by dengxiaobing on 2017/9/21. */
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
