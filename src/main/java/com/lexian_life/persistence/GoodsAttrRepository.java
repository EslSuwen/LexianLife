package com.lexian_life.persistence;

import com.lexian_life.domain.Goods;
import com.lexian_life.domain.GoodsAttr;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

/** @author coderWu Created in 下午7:57 17-9-24 */
public interface GoodsAttrRepository extends JpaRepository<GoodsAttr, Integer> {

  void deleteAllByGoods(Goods goods);

  GoodsAttr findByNameAndValue(String name, String value);
}
