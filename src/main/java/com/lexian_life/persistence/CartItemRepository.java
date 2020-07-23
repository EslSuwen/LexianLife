package com.lexian_life.persistence;

import com.lexian_life.domain.CartItem;
import org.springframework.data.repository.CrudRepository;

/** Created by dengxiaobing on 2017/9/21. */
public interface CartItemRepository extends CrudRepository<CartItem, Integer> {}
