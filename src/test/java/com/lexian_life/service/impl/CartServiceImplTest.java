package com.lexian_life.service.impl;

import com.lexian_life.domain.Cart;
import com.lexian_life.domain.CartItem;
import com.lexian_life.domain.Customer;
import com.lexian_life.persistence.CartItemRepository;
import com.lexian_life.persistence.CustomerRepository;
import com.lexian_life.service.CartService;
import com.lexian_life.service.CustomerService;
import com.lexian_life.service.GoodsService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import javax.transaction.Transactional;

import static org.junit.Assert.*;

/** Created by dengxiaobing on 2017/9/21. */
@RunWith(SpringJUnit4ClassRunner.class)

/** 声明spring主配置文件位置，注意：以当前测试类的位置为基准,有多个配置文件以字符数组声明 * */
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})

/** 声明使用事务，不声明spring会使用默认事务管理 * */
@Transactional

/** 声明事务回滚，要不测试一个方法数据就没有了岂不很杯具，注意：插入数据时可注掉，不让事务回滚 */
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
