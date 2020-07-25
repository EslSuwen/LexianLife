package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.Goods;
import com.cqjtu.lexian.domain.GoodsAttr;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * GoodsAttrRepository
 *
 * @author suwen
 */
public interface GoodsAttrRepository extends JpaRepository<GoodsAttr, Integer> {

  void deleteAllByGoods(Goods goods);

  GoodsAttr findByNameAndValue(String name, String value);
}
