package com.lexian_life.persistence;

import com.lexian_life.domain.Order;
import com.lexian_life.domain.OrderItem;
import org.springframework.data.repository.CrudRepository;

import java.util.Date;

/** Created by dengxiaobing on 2017/9/22. */
public interface OrderItemRepository extends CrudRepository<OrderItem, Integer> {
  int countByCommentedAndOrder(int commented, Order order);

  int countByOrder_PayTimeAfterAndGoods_GoodsId(Date date, int goods_id);
}
