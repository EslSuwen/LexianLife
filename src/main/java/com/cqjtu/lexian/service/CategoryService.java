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

  /**
   * 根据目录获取所有分类
   *
   * @param catalog 目录
   * @return 分类信息列表
   */
  List<Category> getAllByCatalog(Catalog catalog);

  /**
   * 增加分类
   *
   * @param category 分类信息
   */
  void addCategory(Category category);

  /**
   * 删除分类
   *
   * @param id 分类编号
   */
  void deleteCategory(int id);
}
