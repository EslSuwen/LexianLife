package com.cqjtu.lexian.service.impl;

import com.cqjtu.lexian.domain.Category;
import com.cqjtu.lexian.service.GoodsService;
import com.cqjtu.lexian.domain.Goods;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/** Created by dengxiaobing on 2017/9/18. */
/** 声明用的是Spring的测试类 * */
@RunWith(SpringJUnit4ClassRunner.class)

/** 声明spring主配置文件位置，注意：以当前测试类的位置为基准,有多个配置文件以字符数组声明 * */
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class GoodsServiceImplTest {
  @Autowired private GoodsService goodsService;

  @Test
  public void displayCatalogs() throws Exception {}

  @Test
  public void blurryTypeSearch() throws Exception {}

  @Test
  public void blurryGoodsSearch() throws Exception {
    String goodsName = "%%";
    Page<Goods> page = goodsService.blurryGoodsSearch(goodsName, 2, 0);
    List<Goods> list = page.getContent();
    System.out.println(list);
  }

  @Test
  public void getGoods() {
    Page<Goods> page = goodsService.getGoods(1, 0, 16, 0);
    System.out.println(page.getTotalPages());
    System.out.println(page.getSize());
  }

  @Test
  public void testGetCurSaleCount() {
    for (int i = 0; i < 100; i++) {
      System.out.println(goodsService.getCurMonthSaleCount(i + 1));
    }
  }

  @Test
  public void testGetCategory() {
    Category category = goodsService.getCategory(1);
    System.out.println();
  }
}
