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

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
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
