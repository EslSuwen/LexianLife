package com.cqjtu.lexian.domain;

import javax.persistence.*;
import java.util.List;

/** Created by 匆匆 on 2017/9/13. */
@Entity
@Table(name = "category")
public class Category {
  @Column(name = "category_id")
  @Id
  @GeneratedValue
  private int categoryId;

  @ManyToOne(
      targetEntity = Catalog.class,
      cascade = {CascadeType.MERGE},
      optional = false,
      fetch = FetchType.LAZY)
  @JoinColumn(name = "catalog_id")
  private Catalog catalog;

  @Column(name = "name")
  private String name;

  @OneToMany(fetch = FetchType.LAZY, mappedBy = "category")
  private List<Goods> goods;

  public int getCategoryId() {
    return categoryId;
  }

  public void setCategoryId(int categoryId) {
    this.categoryId = categoryId;
  }

  public Catalog getCatalog() {
    return catalog;
  }

  public void setCatalog(Catalog catalog) {
    this.catalog = catalog;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public List<Goods> getGoods() {
    return goods;
  }

  public void setGoods(List<Goods> goods) {
    this.goods = goods;
  }
}
