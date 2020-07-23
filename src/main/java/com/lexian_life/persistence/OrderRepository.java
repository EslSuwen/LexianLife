package com.lexian_life.persistence;

import com.lexian_life.domain.Customer;
import com.lexian_life.domain.Order;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.Date;
import java.util.List;

/** Created by dengxiaobing on 2017/9/22. */
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
