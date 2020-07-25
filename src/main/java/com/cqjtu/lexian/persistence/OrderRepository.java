package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.Customer;
import com.cqjtu.lexian.domain.Order;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.Date;
import java.util.List;

/**
 * OrderRepository
 *
 * @author suwen
 */
public interface OrderRepository
    extends CrudRepository<Order, Integer>, PagingAndSortingRepository<Order, Integer> {
  List<Order> findAllByCreateTimeAfter(Date date);

  int countByCustomerAndStatus(Customer customer, int status);

  List<Order> findAllByStatusAndCustomer(int status, Customer customer);

  List<Order> findAllByStatusNotAndCustomer(int status, Customer customer);

  @Query(value = "select sum(o.amount) from Order o")
  int sumAmount();

  int countByStatus(int status);
}
