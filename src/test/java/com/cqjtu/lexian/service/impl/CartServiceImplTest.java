package com.cqjtu.lexian.service.impl;

import com.cqjtu.lexian.persistence.CartItemRepository;
import com.cqjtu.lexian.persistence.CustomerRepository;
import com.cqjtu.lexian.service.CartService;
import com.cqjtu.lexian.service.GoodsService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import javax.transaction.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class CartServiceImplTest {
  @Autowired private CartService cartService;
  @Autowired private CartItemRepository cartItemRepository;
  @Autowired private GoodsService goodsService;
  @Autowired private CustomerRepository customerRepository;

  @Test
  public void getCart() throws Exception {}

  @Test
  public void saveCart() throws Exception {}

  @Test
  public void removeCartItem() throws Exception {
    //        cartService.removeCartItem(2);
    //        System.out.println("abc");
    //        Cart cart = cartService.getCart(customerRepository.findOne(2));
    //        cart.getCartItems().remove(1);
    cartItemRepository.delete(29);
    //        CartItem item = new CartItem();
    //        item.setSelected(1);
    //        item.setNum(1);
    //        item.setGoods(goodsService.findGoodsById(3));
    //        item.setCart(cart);
    //        cart.getCartItems().add(item);
    //        cartService.saveCart(cart);
  }

  @Test
  public void testSelectCartItem() {
    cartService.selectedCartItem(34, 0);
  }
}
