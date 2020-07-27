package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.Cart;
import com.cqjtu.lexian.domain.CartItem;
import com.cqjtu.lexian.domain.Customer;
import com.cqjtu.lexian.domain.Goods;
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
public class CartRepositoryTest {
  @Autowired private CartRepository cartRepository;
  @Autowired private CustomerRepository customerRepository;
  @Autowired private GoodsRepository goodsRepository;

  @Test
  public void findByCustomer() throws Exception {
    Customer customer = customerRepository.findOne(2);
    Cart cart = cartRepository.findByCustomer(customer);
    CartItem item = new CartItem();
    Goods goods = goodsRepository.findOne(2);
    item.setCart(cart);
    item.setGoods(goods);
    item.setNum(1);
    item.setSelected(0);
    cart.getCartItems().add(item);
    cartRepository.save(cart);
    //        System.out.println(cart);
  }
}
