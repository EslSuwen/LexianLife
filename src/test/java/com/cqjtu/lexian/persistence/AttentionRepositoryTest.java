package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.Goods;
import com.cqjtu.lexian.domain.Attention;
import com.cqjtu.lexian.domain.Customer;
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
public class AttentionRepositoryTest {
  @Autowired private AttentionRepository attentionRepository;
  @Autowired private CustomerRepository customerRepository;
  @Autowired private GoodsRepository goodsRepository;

  @Test
  public void testSave() {
    Customer customer = customerRepository.findOne(2);
    Goods goods = goodsRepository.findOne(1);
    Attention attention = new Attention();
    attention.setCustomer(customer);
    attention.setGoods(goods);
    attentionRepository.save(attention);
  }

  public void testFind() {}
}
