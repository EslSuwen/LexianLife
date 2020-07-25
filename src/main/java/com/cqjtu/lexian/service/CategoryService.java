package com.cqjtu.lexian.service;

import com.cqjtu.lexian.domain.Catalog;
import com.cqjtu.lexian.domain.Category;

import java.util.List;

/**
 * CategoryService
 *
 * @author suwen
 */
public interface CategoryService {

  List<Category> getAllByCatalog(Catalog catalog);

  void addCategory(Category category);

  void deleteCategory(int id);
}
