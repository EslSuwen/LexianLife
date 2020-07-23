package com.cqjtu.lexian.service;

import com.cqjtu.lexian.domain.RecAddr;
import com.cqjtu.lexian.domain.Customer;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import javax.transaction.Transactional;

/** Created by xiaoxiaobing on 17-9-21. */
/** 声明用的是Spring的测试类 * */
@RunWith(SpringJUnit4ClassRunner.class)

/** 声明spring主配置文件位置，注意：以当前测试类的位置为基准,有多个配置文件以字符数组声明 * */
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})

/** 声明使用事务，不声明spring会使用默认事务管理 * */
@Transactional

/** 声明事务回滚，要不测试一个方法数据就没有了岂不很杯具，注意：插入数据时可注掉，不让事务回滚 * */
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class CustomerServiceTest {
  @Autowired private CustomerService customerService;

  @Test
  public void register() throws Exception {}

  @Test
  public void login() throws Exception {}

  @Test
  public void updateCustomer() throws Exception {}

  @Test
  public void sendUpdatePswEmail() throws Exception {}

  @Test
  public void sendUpdateEmailEmail() throws Exception {}

  @Test
  public void listRecAddr() throws Exception {}

  @Test
  public void addRecAddress() throws Exception {
    Customer customer = new Customer();
    customer.setUsername("xiaoming");
    customer.setPassword("123456");
    Customer getCustomer = customerService.login(customer);
    RecAddr recAddr = new RecAddr();
    recAddr.setCusId(getCustomer.getCusId());
    recAddr.setAddr("a");
    recAddr.setDistrict("b");
    recAddr.setProvince("c");
    recAddr.setCity("d");
    recAddr.setPostcode("3");
    recAddr.setPhone("123");
    recAddr.setRecName("xiaobing");
    customerService.addRecAddress(recAddr);
  }

  @Test
  public void updateRecAddr() throws Exception {}

  @Test
  public void delRecAddr() throws Exception {}
}
