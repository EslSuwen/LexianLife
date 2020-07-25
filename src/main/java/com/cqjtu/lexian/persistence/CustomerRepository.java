package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.Customer;
import org.springframework.data.repository.CrudRepository;

/**
 * CustomerRepository
 *
 * @author suwen
 */
public interface CustomerRepository extends CrudRepository<Customer, Integer> {
  Customer findByUsername(String username);
}
