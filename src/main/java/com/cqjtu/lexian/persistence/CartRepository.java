package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.Cart;
import com.cqjtu.lexian.domain.Customer;
import org.springframework.data.repository.CrudRepository;

/** Created by dengxiaobing on 2017/9/21. */
public interface CartRepository extends CrudRepository<Cart, Integer> {
  /**
   * @param customer
   * @return
   */
  Cart findByCustomer(Customer customer);
}
