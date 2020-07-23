package com.cqjtu.lexian.domain;

import javax.persistence.*;
import java.util.Date;

/** Created by dengxiaobing on 2017/9/22. */
@Entity
@Table(name = "comment")
public class Comment {
  @Column(name = "comment_id")
  @Id
  @GeneratedValue
  private int commentId;

  @Column(name = "cus_id")
  private int cusId;

  @Column(name = "goods_id")
  private int goodsId;

  @Column(name = "content")
  private String content;

  @Column(name = "score")
  private int score;

  @Column(name = "time")
  private Date time;

  public int getCommentId() {
    return commentId;
  }

  public void setCommentId(int commentId) {
    this.commentId = commentId;
  }

  public int getCusId() {
    return cusId;
  }

  public void setCusId(int cusId) {
    this.cusId = cusId;
  }

  public int getGoodsId() {
    return goodsId;
  }

  public void setGoodsId(int goodsId) {
    this.goodsId = goodsId;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public int getScore() {
    return score;
  }

  public void setScore(int score) {
    this.score = score;
  }

  public Date getTime() {
    return time;
  }

  public void setTime(Date time) {
    this.time = time;
  }
}
