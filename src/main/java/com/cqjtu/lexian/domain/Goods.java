package com.cqjtu.lexian.domain;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Goods 商品实体
 *
 * @author suwen
 */
@Entity
@Table(name = "goods")
public class Goods implements Serializable {
  private static final long serialVersionUID = 1L;

  @Column(name = "goods_id")
  @Id
  @GeneratedValue
  private int goodsId;

  @Column(name = "name")
  private String name;

  @Column(name = "img")
  private String img;

  @Column(name = "unit_price")
  private double unitPrice;

  @Column(name = "unit")
  private String unit;

  @Column(name = "status")
  private int status;

  @Column(name = "weight")
  private double weight;

  @Column(name = "onsale_time")
  private Date onsaleTime;

  @Column(name = "inventory")
  private double inventory;

  @Column(name = "sale_count")
  private int saleCount;

  @ManyToOne
  @JoinColumn(name = "category_id")
  private Category category;

  @OneToMany(
      mappedBy = "goods",
      cascade = {CascadeType.MERGE, CascadeType.REFRESH, CascadeType.DETACH},
      fetch = FetchType.EAGER)
  private List<GoodsAttr> goodsAttrs;

  public int getGoodsId() {
    return goodsId;
  }

  public void setGoodsId(int goodsId) {
    this.goodsId = goodsId;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public double getUnitPrice() {
    return unitPrice;
  }

  public void setUnitPrice(double unitPrice) {
    this.unitPrice = unitPrice;
  }

  public String getUnit() {
    return unit;
  }

  public void setUnit(String unit) {
    this.unit = unit;
  }

  public int getStatus() {
    return status;
  }

  public void setStatus(int status) {
    this.status = status;
  }

  public double getWeight() {
    return weight;
  }

  public void setWeight(double weight) {
    this.weight = weight;
  }

  public Date getOnsaleTime() {
    return onsaleTime;
  }

  public void setOnsaleTime(Date onsaleTime) {
    this.onsaleTime = onsaleTime;
  }

  public double getInventory() {
    return inventory;
  }

  public void setInventory(double inventory) {
    this.inventory = inventory;
  }

  public Category getCategory() {
    return category;
  }

  public void setCategory(Category category) {
    this.category = category;
  }

  public String getImg() {
    return img;
  }

  public void setImg(String img) {
    this.img = img;
  }

  public int getSaleCount() {
    return saleCount;
  }

  public void setSaleCount(int saleCount) {
    this.saleCount = saleCount;
  }

  public List<GoodsAttr> getGoodsAttrs() {
    return goodsAttrs;
  }

  public void setGoodsAttrs(List<GoodsAttr> goodsAttrs) {
    this.goodsAttrs = goodsAttrs;
  }

  @Override
  public String toString() {
    return "Goods{"
        + "goodsId="
        + goodsId
        + ", name='"
        + name
        + '\''
        + ", img='"
        + img
        + '\''
        + ", unitPrice="
        + unitPrice
        + ", unit='"
        + unit
        + '\''
        + ", status="
        + status
        + ", weight="
        + weight
        + ", onsaleTime="
        + onsaleTime
        + ", inventory="
        + inventory
        + ", saleCount="
        + saleCount
        + ", category="
        + category
        + ", goodsAttrs="
        + goodsAttrs
        + '}';
  }
}
