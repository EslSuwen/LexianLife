package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.Cart;
import com.cqjtu.lexian.domain.Customer;
import org.springframework.data.repository.CrudRepository;

/**
 * CartRepository
 *
 * @author suwen
 */
public interface CartRepository extends CrudRepository<Cart, Integer> {
  /**
   * 购物车信息
   *
   * @param customer 顾客信息
   */
  Cart findByCustomer(Customer customer);
}
