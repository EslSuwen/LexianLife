package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.Catalog;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.transaction.Transactional;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@Rollback
public class CatalogRepositoryTest {
  @Autowired private CatalogRepository catalogRepository;

  @Test
  public void testFindAll() {
    List<Catalog> list = (List<Catalog>) catalogRepository.findAll();
    for (Catalog catalog : list) {
      System.out.println("catalog name:" + catalog.getName());
      for (int j = 0; j < catalog.getCategories().size(); j++)
        System.out.println("category name:" + catalog.getCategories().get(j).getName());
    }
  }
}
