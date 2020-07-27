package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.BrowseRecord;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import javax.transaction.Transactional;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class BrowseRecordRespositoryTest {
  @Autowired private BrowseRecordRespository browseRecordRespository;
  @Autowired private CustomerRepository customerRepository;

  @Test
  public void findAllByCustomer() throws Exception {
    PageRequest request = new PageRequest(0, 20, Sort.Direction.DESC, "time");
    //        Page<BrowseRecord> page =
    // browseRecordRespository.findAllByCustomer(customerRepository.findOne(3),request);
    Page<BrowseRecord> page = browseRecordRespository.list(customerRepository.findOne(3), request);
    List<BrowseRecord> browseRecords = page.getContent();
    for (int i = 0; i < browseRecords.size(); i++) {
      System.out.println(browseRecords.get(i).getClass());
    }
    System.out.println();
  }
}
