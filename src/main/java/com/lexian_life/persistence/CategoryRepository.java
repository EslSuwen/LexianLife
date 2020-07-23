package com.lexian_life.persistence;

import com.lexian_life.domain.Catalog;
import com.lexian_life.domain.Category;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/** Created by dengxiaobing on 2017/9/18. */
public interface CategoryRepository extends CrudRepository<Category, Integer> {
  List<Category> findAllByCatalogAndNameLike(Catalog catalog, String name);

  List<Category> findAllByNameLike(String name);

  List<Category> getAllByCatalog(Catalog catalog);
}
