package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.Catalog;
import com.cqjtu.lexian.domain.Category;
import com.cqjtu.lexian.domain.Goods;
import com.cqjtu.lexian.service.GoodsService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.transaction.Transactional;
import java.io.*;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@Rollback
public class fileTest {
  @Autowired private GoodsService goodsService;
  @Autowired private GoodsRepository goodsRepository;
  @Autowired private CategoryRepository typeRepository;

  @Test
  public void testFile() throws IOException {

    List<Catalog> catalogs = goodsService.displayCatalogs();
    // 默认给每个Category查询20个Goods
    for (Catalog catalog : catalogs) {
      for (int j = 0; j < catalog.getCategories().size(); j++) {
        Category category = catalog.getCategories().get(j);
        Page<Goods> goodsPage = goodsService.getGoods(category.getCategoryId(), 0, 16, 0);
        category.setGoods(goodsPage.getContent());
      }
    }
    System.out.println(catalogs);
    FileOutputStream fileInputStream = new FileOutputStream(new File("role.txt"));
    System.out.println("file");
    ObjectOutputStream stream = new ObjectOutputStream(fileInputStream);
    stream.writeObject(catalogs);
    stream.close();
  }

  @Test
  public void loadCatalogFromFile() throws IOException, ClassNotFoundException {
    FileInputStream fileInputStream = new FileInputStream(new File("role.txt"));
    ObjectInputStream objectInputStream = new ObjectInputStream(fileInputStream);
    List<Catalog> catalogs = (List<Catalog>) objectInputStream.readObject();
    System.out.println(catalogs);
  }
}
