package com.cqjtu.lexian.service;

import com.cqjtu.lexian.domain.Catalog;

/**
 * CatalogService
 *
 * @author suwen
 */
public interface CatalogService {

  /**
   * 获取所有目录
   *
   * @return Iterable 所有目录
   */
  Iterable<Catalog> getAllCatalogs();
}
