package com.lexian_life.service.impl;

import com.lexian_life.domain.Catalog;
import com.lexian_life.domain.Category;
import com.lexian_life.persistence.CategoryRepository;
import com.lexian_life.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/** @author coderWu Created in 下午3:02 17-9-22 */
@Service
public class CategoryServiceImpl implements CategoryService {

  @Autowired CategoryRepository categoryRepository;

  @Override
  public List<Category> getAllByCatalog(Catalog catalog) {
    return categoryRepository.getAllByCatalog(catalog);
  }

  @Override
  public void addCategory(Category ca) {
    categoryRepository.save(ca);
  }

  @Override
  public void deleteCategory(int id) {
    categoryRepository.delete(id);
  }
}
