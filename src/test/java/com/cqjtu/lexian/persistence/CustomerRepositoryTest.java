package com.cqjtu.lexian.persistence;

/** Created by 匆匆 on 2017/9/13. */
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import javax.transaction.Transactional;

/** 声明用的是Spring的测试类 * */
@RunWith(SpringJUnit4ClassRunner.class)

/** 声明spring主配置文件位置，注意：以当前测试类的位置为基准,有多个配置文件以字符数组声明 * */
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})

/** 声明使用事务，不声明spring会使用默认事务管理 * */
@Transactional

/** 声明事务回滚，要不测试一个方法数据就没有了岂不很杯具，注意：插入数据时可注掉，不让事务回滚 * */
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = true)
public class CustomerRepositoryTest {
  @Autowired private CustomerRepository customerRepository;

  @Test
  public void findByUsername() throws Exception {
    System.out.println(customerRepository.findByUsername("xiaobing"));
  }
}
