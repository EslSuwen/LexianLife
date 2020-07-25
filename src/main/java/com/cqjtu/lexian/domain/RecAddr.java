package com.cqjtu.lexian.domain;

import javax.persistence.*;

/**
 * RecAddr 收货信息实体
 *
 * @author suwen
 */
@Entity
@Table(name = "recaddr")
public class RecAddr {
  @Column(name = "recaddr_id")
  @Id
  @GeneratedValue
  private int recaddrId;

  @Column(name = "cus_id")
  private int cusId;

  @Column(name = "rec_name")
  private String recName;

  @Column(name = "province")
  private String province;

  @Column(name = "city")
  private String city;

  @Column(name = "district")
  private String district;

  @Column(name = "addr")
  private String addr;

  @Column(name = "phone")
  private String phone;

  @Column(name = "postcode")
  private String postcode;

  public int getRecaddrId() {
    return recaddrId;
  }

  public void setRecaddrId(int recaddrId) {
    this.recaddrId = recaddrId;
  }

  public int getCusId() {
    return cusId;
  }

  public void setCusId(int cusId) {
    this.cusId = cusId;
  }

  public String getRecName() {
    return recName;
  }

  public void setRecName(String recName) {
    this.recName = recName;
  }

  public String getProvince() {
    return province;
  }

  public void setProvince(String province) {
    this.province = province;
  }

  public String getCity() {
    return city;
  }

  public void setCity(String city) {
    this.city = city;
  }

  public String getDistrict() {
    return district;
  }

  public void setDistrict(String district) {
    this.district = district;
  }

  public String getAddr() {
    return addr;
  }

  public void setAddr(String addr) {
    this.addr = addr;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public String getPostcode() {
    return postcode;
  }

  public void setPostcode(String postcode) {
    this.postcode = postcode;
  }
}
