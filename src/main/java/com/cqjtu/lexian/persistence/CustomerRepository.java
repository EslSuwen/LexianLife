package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.Customer;
import org.springframework.data.repository.CrudRepository;

/** Created by 匆匆 on 2017/9/13. */
public interface CustomerRepository extends CrudRepository<Customer, Integer> {
  Customer findByUsername(String username);
}
