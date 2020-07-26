package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.Order;
import com.cqjtu.lexian.domain.OrderItem;
import org.springframework.data.repository.CrudRepository;

import java.util.Date;

/**
 * OrderItemRepository
 *
 * @author suwen
 */
public interface OrderItemRepository extends CrudRepository<OrderItem, Integer> {
  int countByCommentedAndOrder(int commented, Order order);

  int countByOrderPayTimeAfterAndGoodsGoodsId(Date date, int goodsId);
}
