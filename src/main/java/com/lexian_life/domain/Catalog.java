package com.lexian_life.domain;

import javax.persistence.*;
import java.util.List;

/** Created by 匆匆 on 2017/9/13. */
@Entity
@Table(name = "catalog")
public class Catalog {
  @Column(name = "catalog_id")
  @Id
  @GeneratedValue
  private int catalog_id;

  @Column(name = "name")
  private String name;

  @Column(name = "des")
  private String des;

  @Column(name = "img")
  private String img;

  @Column(name = "status")
  private int status;

  @OneToMany(
      mappedBy = "catalog",
      cascade = {CascadeType.ALL},
      fetch = FetchType.EAGER)
  private List<Category> categories;

  public int getCatalog_id() {
    return catalog_id;
  }

  public void setCatalog_id(int catalog_id) {
    this.catalog_id = catalog_id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getDes() {
    return des;
  }

  public void setDes(String des) {
    this.des = des;
  }

  public String getImg() {
    return img;
  }

  public void setImg(String img) {
    this.img = img;
  }

  public List<Category> getCategories() {
    return categories;
  }

  public void setCategories(List<Category> catagories) {
    this.categories = catagories;
  }

  public int getStatus() {
    return status;
  }

  public void setStatus(int status) {
    this.status = status;
  }
}
