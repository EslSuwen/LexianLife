package com.lexian_life.service;

import com.lexian_life.domain.Catalog;
import com.lexian_life.domain.Category;

import java.util.List;

/** @author coderWu Created in 下午3:01 17-9-22 */
public interface CategoryService {

  List<Category> getAllByCatalog(Catalog catalog);

  void addCategory(Category category);

  void deleteCategory(int id);
}
