package com.lexian_life.persistence;

import com.lexian_life.domain.Cart;
import com.lexian_life.domain.CartItem;
import com.lexian_life.domain.Customer;
import com.lexian_life.domain.Goods;
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

/** 声明事务回滚，要不测试一个方法数据就没有了岂不很杯具，注意：插入数据时可注掉，不让事务回滚 * */
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
