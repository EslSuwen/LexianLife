package com.lexian_life.service.impl;

import com.lexian_life.domain.Catalog;
import com.lexian_life.persistence.CatalogRepository;
import com.lexian_life.service.CatalogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/** @author coderWu Created in 下午3:06 17-9-22 */
@Service
public class CatalogServiceImpl implements CatalogService {

  @Autowired CatalogRepository catalogRepository;

  @Override
  public Iterable<Catalog> getAllCatalogs() {
    return catalogRepository.findAll();
  }
}
