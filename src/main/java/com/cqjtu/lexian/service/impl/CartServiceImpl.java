package com.cqjtu.lexian.service.impl;

import com.cqjtu.lexian.domain.Cart;
import com.cqjtu.lexian.domain.CartItem;
import com.cqjtu.lexian.domain.Customer;
import com.cqjtu.lexian.persistence.CartItemRepository;
import com.cqjtu.lexian.persistence.CartRepository;
import com.cqjtu.lexian.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * CartServiceImpl
 *
 * @author suwen
 */
@Service
public class CartServiceImpl implements CartService {
  @Autowired private CartRepository cartRepository;
  @Autowired private CartItemRepository cartItemRepository;

  @Override
  public Cart getCart(Customer customer) {
    return cartRepository.findByCustomer(customer);
  }

  @Override
  public Cart saveCart(Cart cart) {
    return cartRepository.save(cart);
  }

  @Override
  public void removeCartItem(int cartItemId) {
    cartItemRepository.deleteById(cartItemId);
  }

  @Override
  public void selectedCartItem(int cartItemId, int selected) {
    CartItem item = cartItemRepository.findById(cartItemId).orElseThrow(RuntimeException::new);
    item.setSelected(selected);
    cartItemRepository.save(item);
  }
}
