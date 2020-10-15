package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.OrderItem;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.transaction.Transactional;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@Rollback
public class OrderItemRepositoryTest {
  @Autowired private OrderItemRepository orderItemRepository;

  @Test
  public void countByCommentedAndOrder() throws Exception {}

  @Test
  public void countByOrder_PayTimeAfterAndGoods_Goods_id() throws Exception {
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
    Calendar calendar = Calendar.getInstance();
    Date now = null;
    try {
      now =
          format.parse("" + calendar.get(Calendar.YEAR) + "-" + (calendar.get(Calendar.MONTH) + 1));
    } catch (ParseException e) {
      e.printStackTrace();
    }
    System.out.println(orderItemRepository.countByOrderPayTimeAfterAndGoodsGoodsId(now, 1));
  }

  @Test
  public void upateOrderItem() {
    OrderItem orderItem = orderItemRepository.findById(21).orElseThrow(RuntimeException::new);
    orderItem.setCommented(1);
    orderItemRepository.save(orderItem);
  }
}
