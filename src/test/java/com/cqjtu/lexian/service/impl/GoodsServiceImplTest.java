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

@RunWith(SpringJUnit4ClassRunner.class)
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
