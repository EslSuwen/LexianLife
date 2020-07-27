package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.Catalog;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import javax.transaction.Transactional;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = true)
public class CatalogRepositoryTest {
  @Autowired private CatalogRepository catalogRepository;

  @Test
  public void testFindAll() {
    List<Catalog> list = (List<Catalog>) catalogRepository.findAll();
    for (int i = 0; i < list.size(); i++) {
      System.out.println("catalog name:" + list.get(i).getName());
      for (int j = 0; j < list.get(i).getCategories().size(); j++)
        System.out.println("category name:" + list.get(i).getCategories().get(j).getName());
    }
  }
}
