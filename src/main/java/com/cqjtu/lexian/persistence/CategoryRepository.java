package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.Catalog;
import com.cqjtu.lexian.domain.Category;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * CategoryRepository
 *
 * @author suwen
 */
public interface CategoryRepository extends CrudRepository<Category, Integer> {
  List<Category> findAllByCatalogAndNameLike(Catalog catalog, String name);

  List<Category> findAllByNameLike(String name);

  List<Category> getAllByCatalog(Catalog catalog);
}
