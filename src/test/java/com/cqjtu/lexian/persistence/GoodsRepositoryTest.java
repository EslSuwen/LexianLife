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

import java.util.Date;

/** Created by dengxiaobing on 2017/9/18. */
/** 声明用的是Spring的测试类 * */
@RunWith(SpringJUnit4ClassRunner.class)

/** 声明spring主配置文件位置，注意：以当前测试类的位置为基准,有多个配置文件以字符数组声明 * */
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})

/** 声明使用事务，不声明spring会使用默认事务管理 * */
@Transactional

/** 声明事务回滚，要不测试一个方法数据就没有了岂不很杯具，注意：插入数据时可注掉，不让事务回滚 * */
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
