package com.cqjtu.lexian.domain;

import javax.persistence.*;

/** Created by dengxiaobing on 2017/9/22. */
@Entity
@Table(name = "payway")
public class PayWay {
  @Column(name = "payway_id")
  @Id
  @GeneratedValue
  private int paywayId;

  @Column(name = "name")
  private String name;

  @Column(name = "img")
  private String img;

  public int getPaywayId() {
    return paywayId;
  }

  public void setPaywayId(int paywayId) {
    this.paywayId = paywayId;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getImg() {
    return img;
  }

  public void setImg(String img) {
    this.img = img;
  }
}
