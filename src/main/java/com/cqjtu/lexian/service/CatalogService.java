package com.cqjtu.lexian.service;

import com.cqjtu.lexian.domain.Catalog;

/** @author coderWu Created in 下午3:06 17-9-22 */
public interface CatalogService {
  Iterable<Catalog> getAllCatalogs();
}
