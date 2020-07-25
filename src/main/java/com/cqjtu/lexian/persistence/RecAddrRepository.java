package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.RecAddr;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * RecAddrRepository
 *
 * @author suwen
 */
public interface RecAddrRepository extends CrudRepository<RecAddr, Integer> {
  /**
   * 根据顾客id查询收货人地址
   *
   * @param cusId
   * @return
   */
  List<RecAddr> findAllByCusId(int cusId);
}
