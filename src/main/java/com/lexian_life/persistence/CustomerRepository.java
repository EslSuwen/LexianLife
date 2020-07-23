package com.lexian_life.persistence;

import com.lexian_life.domain.Customer;
import org.springframework.data.repository.CrudRepository;

/** Created by 匆匆 on 2017/9/13. */
public interface CustomerRepository extends CrudRepository<Customer, Integer> {
  Customer findByUsername(String username);
}
