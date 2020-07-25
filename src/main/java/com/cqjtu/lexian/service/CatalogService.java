package com.cqjtu.lexian.service;

import com.cqjtu.lexian.domain.Catalog;

/**
 * CatalogService
 *
 * @author suwen
 */
public interface CatalogService {
  Iterable<Catalog> getAllCatalogs();
}
