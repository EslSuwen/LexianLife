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

/** Created by dengxiaobing on 2017/9/25. */

/** 声明用的是Spring的测试类 * */
@RunWith(SpringJUnit4ClassRunner.class)

/** 声明spring主配置文件位置，注意：以当前测试类的位置为基准,有多个配置文件以字符数组声明 * */
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})

/** 声明使用事务，不声明spring会使用默认事务管理 * */
@Transactional

/** 声明事务回滚，要不测试一个方法数据就没有了岂不很杯具，注意：插入数据时可注掉，不让事务回滚 * */
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
