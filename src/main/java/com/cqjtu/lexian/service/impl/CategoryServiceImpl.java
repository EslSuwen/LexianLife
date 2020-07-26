package com.cqjtu.lexian.service.impl;

import com.cqjtu.lexian.domain.Category;
import com.cqjtu.lexian.service.CategoryService;
import com.cqjtu.lexian.domain.Catalog;
import com.cqjtu.lexian.persistence.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * CategoryServiceImpl
 *
 * @author suwen
 */
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
