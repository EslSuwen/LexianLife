package com.cqjtu.lexian.service.impl;

import com.cqjtu.lexian.domain.*;
import com.cqjtu.lexian.exception.CustomerServiceException;
import com.cqjtu.lexian.persistence.*;
import com.cqjtu.lexian.service.CustomerService;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Random;

/** Created by xiaoxiaobing on 17-8-3. */
@Service
public class CustomerServiceImpl implements CustomerService {
  @Autowired private CustomerRepository customerRepository;
  @Autowired private RecAddrRepository recAddrRepository;
  @Autowired private AttentionRepository attentionRepository;
  @Autowired private BrowseRecordRespository browseRecordRespository;
  @Autowired private CommentRepository commentRepository;

  @Override
  public Customer getCustomer(int id) {
    return customerRepository.findOne(id);
  }

  @Override
  public Customer getCustomerByUsername(String username) {
    return customerRepository.findByUsername(username);
  }

  /**
   * 用户注册
   *
   * @param customer 注册用户信息
   * @throws CustomerServiceException errorCode=0该邮箱已被注册,errorCode=1数据持久化错误,errorCode=2其他错误
   */
  @Override
  public void register(Customer customer) throws CustomerServiceException {
    if (!verifyEmail(customer.getEmail())) {
      throw new CustomerServiceException("email not exist", 0);
    }
    try {
      if (customerRepository.findByUsername(customer.getUsername()) == null) {
        Customer getCustomer = customerRepository.save(customer);
        getCustomer.setNickname("lx" + getCustomer.getCusId());
        // 默认设置顾客状态为启用
        customer.setStatus(1);
        customerRepository.save(getCustomer);
      } else {
        throw new CustomerServiceException("this username has been registered", 1);
      }
    } catch (RuntimeException re) {
      throw new CustomerServiceException(re, 2);
    }
  }

  /**
   * 验证邮件正确性
   *
   * @param email
   * @return
   */
  private boolean verifyEmail(String email) {
    return true;
  }

  /**
   * 用户登录
   *
   * @param Customer 用户登录信息
   * @return 持久化用户信息
   * @throws CustomerServiceException CustomerServiceException
   *     errorCode=0用户名不存在,errorCode=1密码错误,errorCode=2顾客帐号已被禁用,errorCode=3数据持久层访问错误
   */
  @Override
  public Customer login(Customer Customer) throws CustomerServiceException {
    try {
      Customer getCustomer = customerRepository.findByUsername(Customer.getUsername());
      if (getCustomer == null) {
        throw new CustomerServiceException("this email has not been registered", 0);
      }
      if (!getCustomer.getPassword().equals(Customer.getPassword())) {
        throw new CustomerServiceException(1);
      }
      if (getCustomer.getStatus() == 0) {
        throw new CustomerServiceException(2);
      }
      return getCustomer;
    } catch (RuntimeException re) {
      throw new CustomerServiceException(re, 3);
    }
  }

  @Override
  public void sendPasswordToEmail(Customer customer) {
    JavaMailSenderImpl sender = new JavaMailSenderImpl();
    sender.setHost(
        "smtp." + customer.getEmail().substring(customer.getEmail().lastIndexOf("@") + 1));
    sender.setPort(465);
    sender.setUsername("1455813736@qq.com");
    sender.setPassword("akpuxiljdcrubabh");
    Properties properties = new Properties();
    properties.put("mail.smtp.auth", "true");
    properties.put("mail.smtp.ssl.enable", true);
    properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    properties.put("mail.smtp.timeout", 20000);
    sender.setJavaMailProperties(properties);
    SimpleMailMessage mailMessage = new SimpleMailMessage();
    mailMessage.setTo(customer.getEmail());
    mailMessage.setFrom("1455813736@qq.com");
    mailMessage.setSubject("乐鲜生活商城顾客密码");
    mailMessage.setText("尊敬的顾客" + customer.getNickname() + ":您的密码为:" + customer.getPassword());
    sender.send(mailMessage);
  }

  /**
   * 用户信息修改
   *
   * @param customer 更新的用户信息
   * @throws CustomerServiceException errorCode=0用户不存在,errorCode=1数据持久化失败
   */
  @Override
  public void updateCustomer(Customer customer) throws CustomerServiceException {
    try {
      if (customerRepository.findByUsername(customer.getUsername()) == null) {
        throw new CustomerServiceException("this username has not been registered");
      }
      customerRepository.save(customer);
    } catch (RuntimeException re) {
      throw new CustomerServiceException(re, 1);
    }
  }

  /**
   * 发送修改顾客信息验证邮件
   *
   * @param customer
   * @throws CustomerServiceException errorCode=0邮件不存在,errorCode=1发送邮件失败
   */
  @Override
  public String sendUpdatePswEmail(Customer customer) throws CustomerServiceException {
    JavaMailSenderImpl sender = new JavaMailSenderImpl();
    sender.setHost(
        "smtp." + customer.getEmail().substring(customer.getEmail().lastIndexOf("@") + 1));
    sender.setPort(465);
    sender.setUsername("1455813736@qq.com");
    sender.setPassword("akpuxiljdcrubabh");
    Properties properties = new Properties();
    properties.put("mail.smtp.auth", "true");
    properties.put("mail.smtp.ssl.enable", true);
    properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    properties.put("mail.smtp.timeout", 20000);
    sender.setJavaMailProperties(properties);
    SimpleMailMessage mailMessage = new SimpleMailMessage();
    mailMessage.setTo(customer.getEmail());
    mailMessage.setFrom("1455813736@qq.com");
    mailMessage.setSubject("乐鲜生活商城修改密码验证");
    String code = createVerifyCode(customer.getUsername());
    mailMessage.setText(
        "尊敬的顾客" + customer.getNickname() + ":您的修改密码验证码为:" + code + "\n" + "此验证码将在10分钟后失效");
    sender.send(mailMessage);
    return code;
  }

  /**
   * 发送修改顾客密码验证邮件
   *
   * @param customer
   * @return 生成的验证码
   * @throws CustomerServiceException errorCode=0邮件不存在,errorCode=1发送邮件失败
   */
  @Override
  public String sendUpdateEmailEmail(Customer customer) throws CustomerServiceException {
    JavaMailSenderImpl sender = new JavaMailSenderImpl();
    sender.setHost(
        "smtp." + customer.getEmail().substring(customer.getEmail().lastIndexOf("@") + 1));
    sender.setPort(465);
    sender.setUsername("1455813736@qq.com");
    sender.setPassword("akpuxiljdcrubabh");
    Properties properties = new Properties();
    properties.put("mail.smtp.auth", "true");
    properties.put("mail.smtp.ssl.enable", true);
    properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    properties.put("mail.smtp.timeout", 20000);
    sender.setJavaMailProperties(properties);
    SimpleMailMessage mailMessage = new SimpleMailMessage();
    mailMessage.setTo(customer.getEmail());
    mailMessage.setFrom("1455813736@qq.com");
    mailMessage.setSubject("乐鲜生活商城修改绑定邮箱验证");
    String code = createVerifyCode(customer.getUsername());
    mailMessage.setText(
        "尊敬的顾客" + customer.getNickname() + ":您的修改绑定邮箱验证码为:" + code + "\n" + "此验证码将在10分钟后失效");
    sender.send(mailMessage);
    return code;
  }

  /**
   * 获取顾客的收货人地址
   *
   * @param customer
   * @return
   * @throws CustomerServiceException errorCode=0数据访问错误
   */
  @Override
  public List<RecAddr> listRecAddr(Customer customer) throws CustomerServiceException {
    try {
      return recAddrRepository.findAllByCusId(customer.getCusId());
    } catch (RuntimeException re) {
      throw new CustomerServiceException(re, 0);
    }
  }

  /**
   * 添加收货人地址
   *
   * @param recAddr
   * @throws CustomerServiceException errorCode=0顾客还未登录,errorCode=1数据持久化异常
   */
  @Override
  public void addRecAddress(RecAddr recAddr) throws CustomerServiceException {
    try {
      if (customerRepository.findOne(recAddr.getCusId()) == null) {
        throw new CustomerServiceException("customer has not registered", 0);
      }
      recAddrRepository.save(recAddr);
    } catch (RuntimeException re) {
      throw new CustomerServiceException(re, 1);
    }
  }

  /**
   * 更新收货人信息
   *
   * @param recAddr
   * @throws CustomerServiceException errorCode=0数据持久化异常
   */
  @Override
  public void updateRecAddr(RecAddr recAddr) throws CustomerServiceException {
    try {
      recAddrRepository.save(recAddr);
    } catch (RuntimeException re) {
      throw new CustomerServiceException(re, 0);
    }
  }

  /**
   * 删除收货人地址
   *
   * @param recAddr
   * @throws CustomerServiceException errorCode=0数据访问错误
   */
  @Override
  public void delRecAddr(RecAddr recAddr) throws CustomerServiceException {
    try {
      recAddrRepository.delete(recAddr);
    } catch (RuntimeException re) {
      throw new CustomerServiceException(re, 0);
    }
  }

  @Override
  public List<Attention> getAttentions(Customer customer, int pageIndex) {
    PageRequest request = new PageRequest(pageIndex - 1, 12, Sort.Direction.DESC, "attId");
    Page<Attention> attentions = attentionRepository.findAllByCustomer(customer, request);
    return attentions.getContent();
  }

  @Override
  public void browseGoods(Customer customer, Goods goods, Date time) {
    BrowseRecord browseRecord = new BrowseRecord();
    browseRecord.setCustomer(customer);
    browseRecord.setGoods(goods);
    browseRecord.setTime(new Date());
    browseRecordRespository.save(browseRecord);
  }

  @Override
  public List<BrowseRecord> getBrowserRecords(int pageIndex, Customer customer) {
    Page<BrowseRecord> page =
        browseRecordRespository.list(
            customer, new PageRequest(pageIndex - 1, 20, Sort.Direction.DESC, "time"));
    return page.getContent();
  }

  @Override
  public void commentGoods(Comment comment) {
    comment.setTime(new Date());
    commentRepository.save(comment);
  }

  private String createVerifyCode(String username) {
    // 这里不能直接用当前时间作为种子，在高并发的情况下会验证码重复，所以可以加上用户名的hash值，因为同一个用户不会
    Random random = new Random(System.currentTimeMillis() + username.hashCode());
    final int codeLen = 6;
    StringBuilder sb = new StringBuilder();
    for (int i = 0; i < codeLen; i++) {
      sb.append(random.nextInt(10));
    }
    return sb.toString();
  }

  @Override
  public List<Customer> getAllCustomers() {
    return Lists.newArrayList(customerRepository.findAll());
  }

  @Override
  public void deleteCustomer(int id) {
    customerRepository.delete(id);
  }

  @Override
  public List<BrowseRecord> getBrowserRecordsByCustomerId(int id) {
    return browseRecordRespository.findAllByCustomer_CusId(id);
  }
}
