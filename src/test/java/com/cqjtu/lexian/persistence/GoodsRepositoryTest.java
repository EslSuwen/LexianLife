package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.Goods;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import javax.transaction.Transactional;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class GoodsRepositoryTest {
  @Autowired private GoodsRepository goodsRepository;
  @Autowired private CategoryRepository typeRepository;

  @Test
  public void findAllByNameLike() throws Exception {}

  @Test
  public void save() throws Exception {
    for (int i = 0; i < 32; i++) {
      Goods goods = new Goods();
      goods.setName("" + (i + 1));
      goods.setUnitPrice(1.0);
      goods.setUnit("kg");
      goods.setWeight(1.0);
      goods.setStatus(1);
      goods.setOnsaleTime(new Date());
      goods.setInventory(1000);
      goodsRepository.save(goods);
    }
  }

  @Test
  public void testFindAll() {
    PageRequest pr = new PageRequest(0, 16);
    Page<Goods> page = goodsRepository.findAll(pr);
    System.out.println(page);
  }
}
