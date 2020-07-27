package com.cqjtu.lexian.persistence;

/** Created by 匆匆 on 2017/9/13. */
import com.cqjtu.lexian.domain.Customer;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import javax.transaction.Transactional;
import java.util.Properties;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = true)
public class CustomerRepositoryTest {
  @Autowired private CustomerRepository customerRepository;

  @Test
  public void findByUsername() throws Exception {
    System.out.println(customerRepository.findByUsername("suwen"));
  }

  @Test
  public void sendPasswordToEmail() {
    Customer customer = new Customer();
    customer.setEmail("577014284@qq.com");
    JavaMailSenderImpl sender = new JavaMailSenderImpl();
    sender.setHost(
        "smtp." + customer.getEmail().substring(customer.getEmail().lastIndexOf("@") + 1));
    sender.setPort(465);
    sender.setUsername("hfl_356@163.com");
    sender.setPassword("hfl1998929");
    Properties properties = new Properties();
    properties.put("mail.smtp.auth", "true");
    properties.put("mail.smtp.ssl.enable", true);
    properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    properties.put("mail.smtp.timeout", 20000);
    sender.setJavaMailProperties(properties);
    SimpleMailMessage mailMessage = new SimpleMailMessage();
    mailMessage.setTo(customer.getEmail());
    mailMessage.setFrom("hfl_356@163.com");
    mailMessage.setSubject("乐鲜生活商城顾客密码");
    mailMessage.setText("尊敬的顾客" + customer.getNickname() + ":您的密码为:" + customer.getPassword());
    sender.send(mailMessage);
  }
}
