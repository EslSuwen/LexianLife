package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.BrowseRecord;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.transaction.Transactional;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@Rollback
public class BrowseRecordRespositoryTest {
  @Autowired private BrowseRecordRespository browseRecordRespository;
  @Autowired private CustomerRepository customerRepository;

  @Test
  public void findAllByCustomer() throws Exception {
    PageRequest request = PageRequest.of(0, 20, Sort.Direction.DESC, "time");
    //        Page<BrowseRecord> page =
    // browseRecordRespository.findAllByCustomer(customerRepository.findOne(3),request);
    Page<BrowseRecord> page =
        browseRecordRespository.list(
            customerRepository.findById(3).orElseThrow(RuntimeException::new), request);
    List<BrowseRecord> browseRecords = page.getContent();
    for (BrowseRecord browseRecord : browseRecords) {
      System.out.println(browseRecord.getClass());
    }
    System.out.println();
  }
}
