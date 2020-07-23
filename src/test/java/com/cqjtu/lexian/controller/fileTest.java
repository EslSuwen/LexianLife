package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.Catalog;
import com.cqjtu.lexian.domain.Category;
import com.cqjtu.lexian.domain.Goods;
import com.cqjtu.lexian.service.GoodsService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import javax.transaction.Transactional;
import java.io.*;
import java.util.List;

/** 声明用的是Spring的测试类 * */
@RunWith(SpringJUnit4ClassRunner.class)

/** 声明spring主配置文件位置，注意：以当前测试类的位置为基准,有多个配置文件以字符数组声明 * */
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})

/** 声明使用事务，不声明spring会使用默认事务管理 * */
@Transactional

/** 声明事务回滚，要不测试一个方法数据就没有了岂不很杯具，注意：插入数据时可注掉，不让事务回滚 * */
/**
 * fileTest 文件测试
 *
 * @author suwen
 */
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
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
