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
