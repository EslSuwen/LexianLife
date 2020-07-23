package com.lexian_life.service.impl;

import com.lexian_life.domain.Cart;
import com.lexian_life.domain.CartItem;
import com.lexian_life.domain.Customer;
import com.lexian_life.persistence.CartItemRepository;
import com.lexian_life.persistence.CartRepository;
import com.lexian_life.service.CartService;
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
