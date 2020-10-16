package com.cqjtu.lexian.domain;

import javax.persistence.*;
import java.util.Date;

/**
 * BrowseRecord 用户浏览记录实体
 *
 * @author suwen
 */
@Entity
@Table(name = "browserecord")
public class BrowseRecord {
  @Column(name = "record_id")
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private int recordId;

  @ManyToOne
  @JoinColumn(name = "cus_id")
  private Customer customer;

  @ManyToOne
  @JoinColumn(name = "goods_id")
  private Goods goods;

  @Column(name = "time")
  private Date time;

  public int getRecordId() {
    return recordId;
  }

  public void setRecordId(int recordId) {
    this.recordId = recordId;
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

  public Date getTime() {
    return time;
  }

  public void setTime(Date time) {
    this.time = time;
  }

  @Override
  public String toString() {
    return "BrowseRecord{"
        + "recordId="
        + recordId
        + ", customer="
        + customer
        + ", goods="
        + goods
        + ", time="
        + time
        + '}';
  }
}
