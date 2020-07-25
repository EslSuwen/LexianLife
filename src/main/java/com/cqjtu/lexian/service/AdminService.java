package com.cqjtu.lexian.service;

import com.cqjtu.lexian.domain.Admin;
import org.springframework.data.domain.Page;

/**
 * AdminService
 *
 * @author suwen
 */
public interface AdminService {

  Admin login(String username, String password);

  Admin addAdmin(Admin admin);

  Boolean hasAdmin(String username);

  Page<Admin> getAdmins(int page);

  Admin getAdmin(int id);

  void updateAdmin(Admin admin);

  void deleteAdmin(int id);
}
