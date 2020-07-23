package com.lexian_life.domain;

import javax.persistence.*;

/** Created by dengxiaobing on 2017/9/22. */
@Entity
@Table(name = "goodsattr")
public class GoodsAttr {
  @Column(name = "goodsattr_id")
  @Id
  @GeneratedValue
  private int goodsAttrId;

  @ManyToOne
  @JoinColumn(name = "goods_id")
  private Goods goods;

  @Column(name = "name")
  private String name;

  @Column(name = "value")
  private String value;

  public int getGoodsAttrId() {
    return goodsAttrId;
  }

  public void setGoodsAttrId(int goodsAttrId) {
    this.goodsAttrId = goodsAttrId;
  }

  public Goods getGoods() {
    return goods;
  }

  public void setGoods(Goods goods) {
    this.goods = goods;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getValue() {
    return value;
  }

  public void setValue(String value) {
    this.value = value;
  }
}
