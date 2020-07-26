package com.cqjtu.lexian.service.impl;

import com.cqjtu.lexian.persistence.CatalogRepository;
import com.cqjtu.lexian.domain.Catalog;
import com.cqjtu.lexian.service.CatalogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * CatalogServiceImpl
 *
 * @author suwen
 */
@Service
public class CatalogServiceImpl implements CatalogService {

  @Autowired
  CatalogRepository catalogRepository;

  @Override
  public Iterable<Catalog> getAllCatalogs() {
    return catalogRepository.findAll();
  }
}
