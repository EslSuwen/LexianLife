package com.lexian_life.domain;

/** Created by dengxiaobing on 2017/9/22. */
public class OrderStatus {
  public static final int NOTPAY = 0; // 未付款
  public static final int PAYED = 1; // 已支付
  public static final int READY = 2; // 待发货
  public static final int SENDED = 3; // 配送中
  public static final int NOTRECEIVE = 4; // 待收货
  public static final int FINISH = 5; // 已完成
  public static final int DELETE = 6; // 被删除
}
