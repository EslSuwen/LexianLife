package com.cqjtu.lexian.domain;

import javax.persistence.*;
import java.util.Date;

/**
 * AdminLog 管理员记录实体
 *
 * @author suwen
 */
@Entity
@Table(name = "adminlog")
public class AdminLog {

  @Column(name = "adminlog_id")
  @Id
  @GeneratedValue
  private int adminLogId;

  @Column(name = "admin_id")
  private int adminId;

  @Column(name = "operate")
  private String operate;

  @Column(name = "content")
  private String content;

  @Column(name = "time")
  private Date time;

  public int getAdminLogId() {
    return adminLogId;
  }

  public void setAdminLogId(int adminLogId) {
    this.adminLogId = adminLogId;
  }

  public int getAdminId() {
    return adminId;
  }

  public void setAdminId(int adminId) {
    this.adminId = adminId;
  }

  public String getOperate() {
    return operate;
  }

  public void setOperate(String operate) {
    this.operate = operate;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public Date getTime() {
    return time;
  }

  public void setTime(Date time) {
    this.time = time;
  }
}
