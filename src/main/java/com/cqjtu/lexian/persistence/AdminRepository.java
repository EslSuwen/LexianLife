package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.Admin;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * AdminRepository
 *
 * @author suwen
 */
public interface AdminRepository
    extends CrudRepository<Admin, Integer>, PagingAndSortingRepository<Admin, Integer> {

  Admin findAdminByUsernameAndPassword(String username, String password);

  Admin findAdminByUsername(String username);
}
