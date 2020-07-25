package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.CartItem;
import org.springframework.data.repository.CrudRepository;

/**
 * CartItemRepository
 *
 * @author suwen
 */
public interface CartItemRepository extends CrudRepository<CartItem, Integer> {}
