package com.cqjtu.lexian.controller;

import com.cqjtu.lexian.domain.BrowseRecord;
import com.cqjtu.lexian.service.CustomerService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class CustomerControllerTest {

  @Autowired private CustomerService customerService;

  @Test
  public void recordTest() {
    Map<String, Object> result = new HashMap<>();
    result.put("status", true);
    List<BrowseRecord> records = customerService.getBrowserRecordsByCustomerId(2);
    for (BrowseRecord each : records) {
      System.out.println(each.toString());
    }
    List<Map<String, Object>> newRecords = new ArrayList<>();
    for (BrowseRecord record : records) {
      Map<String, Object> newRecord = new HashMap<>();
      newRecord.put("用户", record.getCustomer().getUsername());
      newRecord.put("产品名称", record.getGoods().getName());
      newRecord.put("价格(元)", record.getGoods().getUnitPrice());
      newRecord.put("加入时间", record.getTime().toString());
      newRecords.add(newRecord);
    }
    result.put("msg", newRecords);
    System.out.println(result);
  }
}
