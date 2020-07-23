package com.cqjtu.lexian.domain;

import javax.persistence.*;
import java.util.Date;

/** Created by 匆匆 on 2017/9/13. */
@Entity
@Table(name = "customer")
public class Customer {
  @Column(name = "cus_id")
  @Id
  @GeneratedValue
  private int cusId;

  @Column(name = "headimg")
  private String headImg;

  @Column(name = "username")
  private String username;

  @Column(name = "nickname")
  private String nickname;

  @Column(name = "realname")
  private String realname;

  @Column(name = "sex")
  private int sex;

  @Column(name = "birth")
  private Date birth;

  @Column(name = "phone")
  private String phone;

  @Column(name = "email")
  private String email;

  @Column(name = "password")
  private String password;

  @Column(name = "status")
  private int status;

  public int getCusId() {
    return cusId;
  }

  public void setCusId(int cusId) {
    this.cusId = cusId;
  }

  public String getHeadImg() {
    return headImg;
  }

  public void setHeadImg(String headImg) {
    this.headImg = headImg;
  }

  public String getUsername() {
    return username;
  }

  public String getNickname() {
    return nickname;
  }

  public void setNickname(String nickname) {
    this.nickname = nickname;
  }

  public String getRealname() {
    return realname;
  }

  public void setRealname(String realname) {
    this.realname = realname;
  }

  public int getSex() {
    return sex;
  }

  public void setSex(int sex) {
    this.sex = sex;
  }

  public Date getBirth() {
    return birth;
  }

  public void setBirth(Date birth) {
    this.birth = birth;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public int getStatus() {
    return status;
  }

  public void setStatus(int status) {
    this.status = status;
  }
}
