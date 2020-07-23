package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.Attention;
import com.cqjtu.lexian.domain.Customer;
import com.cqjtu.lexian.domain.Goods;
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
