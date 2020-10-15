package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.Attention;
import com.cqjtu.lexian.domain.Customer;
import com.cqjtu.lexian.domain.Goods;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.transaction.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@Rollback
public class AttentionRepositoryTest {
  @Autowired private AttentionRepository attentionRepository;
  @Autowired private CustomerRepository customerRepository;
  @Autowired private GoodsRepository goodsRepository;

  @Test
  public void testSave() {
    Customer customer = customerRepository.findById(2).orElseThrow(RuntimeException::new);
    Goods goods = goodsRepository.findById(1).orElseThrow(RuntimeException::new);
    Attention attention = new Attention();
    attention.setCustomer(customer);
    attention.setGoods(goods);
    attentionRepository.save(attention);
  }

  public void testFind() {}
}
