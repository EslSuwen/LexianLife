package com.cqjtu.lexian.service;

import com.cqjtu.lexian.domain.Cart;
import com.cqjtu.lexian.domain.Customer;

/** Created by dengxiaobing on 2017/9/21. */
public interface CartService {
  /**
   * 获取顾客的购物车
   *
   * @param customer
   * @return
   */
  Cart getCart(Customer customer);

  /**
   * 保存或修改一个购物车到数据库
   *
   * @param cart
   * @return
   */
  Cart saveCart(Cart cart);

  /**
   * 移除购物车商品项
   *
   * @param cartItemId
   */
  void removeCartItem(int cartItemId);

  /**
   * 设置cartItem是否被选
   *
   * @param cartItemId
   * @param selected
   */
  void selectedCartItem(int cartItemId, int selected);
}
