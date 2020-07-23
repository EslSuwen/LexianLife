package com.lexian_life.persistence;

import com.lexian_life.domain.Catalog;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/** Created by 匆匆 on 2017/9/13. */
public interface CatalogRepository extends CrudRepository<Catalog, Integer> {
  List<Catalog> findAllByStatus(int status);
}
