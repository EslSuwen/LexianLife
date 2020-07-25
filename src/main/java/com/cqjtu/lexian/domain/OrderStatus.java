package com.cqjtu.lexian.domain;

/**
 * OrderStatus 订单状态
 *
 * @author suwen
 */
public class OrderStatus {
  /** 未付款 */
  public static final int NOTPAY = 0;
  /** 已支付 */
  public static final int PAYED = 1;
  /** 待发货 */
  public static final int READY = 2;
  /** 配送中 */
  public static final int SENDED = 3;
  /** 待收货 */
  public static final int NOTRECEIVE = 4;
  /** 已完成 */
  public static final int FINISH = 5;
  /** 被删除 */
  public static final int DELETE = 6;
}
