package com.lexian_life.persistence;

import com.lexian_life.domain.Cart;
import com.lexian_life.domain.Customer;
import org.springframework.data.repository.CrudRepository;

/** Created by dengxiaobing on 2017/9/21. */
public interface CartRepository extends CrudRepository<Cart, Integer> {
  /**
   * @param customer
   * @return
   */
  Cart findByCustomer(Customer customer);
}
