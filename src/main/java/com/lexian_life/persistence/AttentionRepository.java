package com.lexian_life.persistence;

import com.lexian_life.domain.Attention;
import com.lexian_life.domain.Customer;
import com.lexian_life.domain.Goods;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/** Created by dengxiaobing on 2017/9/21. */
public interface AttentionRepository extends CrudRepository<Attention, Integer> {
  Attention findByCustomerAndGoods(Customer customer, Goods goods);

  List<Attention> findAllByCustomer(Customer customer);

  List<Attention> findAllByGoods(Goods goods);

  long countAllByGoods(Goods goods);

  Page<Attention> findAllByCustomer(Customer customer, Pageable pageable);
}
