package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.Catalog;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * CatalogRepository
 *
 * @author suwen
 */
public interface CatalogRepository extends CrudRepository<Catalog, Integer> {
  List<Catalog> findAllByStatus(int status);
}
