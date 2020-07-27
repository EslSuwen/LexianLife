package com.cqjtu.lexian.service;

import com.cqjtu.lexian.domain.Cart;
import com.cqjtu.lexian.domain.Customer;

/**
 * CartService
 *
 * @author suwen
 */
public interface CartService {
  /**
   * 获取顾客的购物车
   *
   * @param customer 顾客信息
   * @return 购物车信息
   */
  Cart getCart(Customer customer);

  /**
   * 保存或修改一个购物车到数据库
   *
   * @param cart 购物车信息
   * @return 购物车信息
   */
  Cart saveCart(Cart cart);

  /**
   * 移除购物车商品项
   *
   * @param cartItemId 购物车商品项编号
   */
  void removeCartItem(int cartItemId);

  /**
   * 设置cartItem是否被选
   *
   * @param cartItemId 购物车商品项编号
   * @param selected 选中状态
   */
  void selectedCartItem(int cartItemId, int selected);
}
