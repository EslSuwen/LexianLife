package com.lexian_life.service;

import com.lexian_life.domain.Catalog;

/** @author coderWu Created in 下午3:06 17-9-22 */
public interface CatalogService {
  Iterable<Catalog> getAllCatalogs();
}
