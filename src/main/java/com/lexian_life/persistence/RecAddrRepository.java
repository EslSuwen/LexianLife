package com.lexian_life.persistence;

import com.lexian_life.domain.RecAddr;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/** Created by dengxiaobing on 2017/9/20. */
public interface RecAddrRepository extends CrudRepository<RecAddr, Integer> {
  /**
   * 根据顾客id查询收货人地址
   *
   * @param cusId
   * @return
   */
  List<RecAddr> findAllByCusId(int cusId);
}
