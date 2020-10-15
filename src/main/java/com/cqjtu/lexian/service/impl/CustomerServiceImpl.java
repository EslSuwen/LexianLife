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
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * CustomerServiceImpl
 *
 * @author suwen
 */
@Service
public class CustomerServiceImpl implements CustomerService {
  @Autowired private CustomerRepository customerRepository;
  @Autowired private RecAddrRepository recAddrRepository;
  @Autowired private AttentionRepository attentionRepository;
  @Autowired private BrowseRecordRespository browseRecordRespository;
  @Autowired private CommentRepository commentRepository;

  @Override
  public Customer getCustomer(int id) {
    return customerRepository.findById(id).orElseThrow(RuntimeException::new);
  }

  @Override
  public Customer getCustomerByUsername(String username) {
    return customerRepository.findByUsername(username);
  }

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

  private boolean verifyEmail(String email) {
    // TODO 邮箱验证
    return email.length() > 0;
  }

  @Override
  public Customer login(Customer customer) throws CustomerServiceException {
    try {
      Customer getCustomer = customerRepository.findByUsername(customer.getUsername());
      if (getCustomer == null) {
        throw new CustomerServiceException("this email has not been registered", 0);
      }
      if (!getCustomer.getPassword().equals(customer.getPassword())) {
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
    // TODO 将顾客的密码发送至顾客的邮箱
  }

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

  @Override
  public String sendUpdatePswEmail(Customer customer) {
    // TODO 将顾客的密码发送至顾客的邮箱
    return "code";
  }

  @Override
  public String sendUpdateEmailEmail(Customer customer) throws CustomerServiceException {
    // TODO 发送修改顾客密码验证邮件
    return "code";
  }

  @Override
  public List<RecAddr> listRecAddr(Customer customer) throws CustomerServiceException {
    try {
      return recAddrRepository.findAllByCusId(customer.getCusId());
    } catch (RuntimeException re) {
      throw new CustomerServiceException(re, 0);
    }
  }

  @Override
  public void addRecAddress(RecAddr recAddr) throws CustomerServiceException {
    try {
      customerRepository.findById(recAddr.getCusId()).orElseThrow(RuntimeException::new);
      recAddrRepository.save(recAddr);
    } catch (RuntimeException re) {
      throw new CustomerServiceException(re, 1);
    }
  }

  @Override
  public void updateRecAddr(RecAddr recAddr) throws CustomerServiceException {
    try {
      recAddrRepository.save(recAddr);
    } catch (RuntimeException re) {
      throw new CustomerServiceException(re, 0);
    }
  }

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
    PageRequest request = PageRequest.of(pageIndex - 1, 12, Sort.Direction.DESC, "attId");
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
            customer, PageRequest.of(pageIndex - 1, 20, Sort.Direction.DESC, "time"));
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
    customerRepository.deleteById(id);
  }

  @Override
  public List<BrowseRecord> getBrowserRecordsByCustomerId(int id) {
    return browseRecordRespository.findAllByCustomer_CusId(id);
  }
}
