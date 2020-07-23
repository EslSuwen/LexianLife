package com.lexian_life.persistence;

import com.lexian_life.domain.Admin;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/** @author coderWu Created in 下午4:12 17-9-20 */
public interface AdminRepository
    extends CrudRepository<Admin, Integer>, PagingAndSortingRepository<Admin, Integer> {

  Admin findAdminByUsernameAndPassword(String username, String password);

  Admin findAdminByUsername(String username);
}
