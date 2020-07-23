package com.cqjtu.lexian.service.impl;

import com.cqjtu.lexian.domain.Cart;
import com.cqjtu.lexian.domain.CartItem;
import com.cqjtu.lexian.domain.Customer;
import com.cqjtu.lexian.persistence.CartItemRepository;
import com.cqjtu.lexian.persistence.CartRepository;
import com.cqjtu.lexian.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/** Created by dengxiaobing on 2017/9/21. */
@Service
public class CartServiceImpl implements CartService {
  @Autowired private CartRepository cartRepository;
  @Autowired private CartItemRepository cartItemRepository;

  public Cart getCart(Customer customer) {
    return cartRepository.findByCustomer(customer);
  }

  public Cart saveCart(Cart cart) {
    return cartRepository.save(cart);
  }

  public void removeCartItem(int cartItemId) {
    cartItemRepository.delete(cartItemId);
  }

  public void selectedCartItem(int cartItemId, int selected) {
    CartItem item = cartItemRepository.findOne(cartItemId);
    item.setSelected(selected);
    cartItemRepository.save(item);
  }
}
