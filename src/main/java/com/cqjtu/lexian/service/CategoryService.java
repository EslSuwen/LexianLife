package com.cqjtu.lexian.service;

import com.cqjtu.lexian.domain.Catalog;
import com.cqjtu.lexian.domain.Category;

import java.util.List;

/** @author coderWu Created in 下午3:01 17-9-22 */
public interface CategoryService {

  List<Category> getAllByCatalog(Catalog catalog);

  void addCategory(Category category);

  void deleteCategory(int id);
}
