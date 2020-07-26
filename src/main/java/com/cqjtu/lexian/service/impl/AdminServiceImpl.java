package com.cqjtu.lexian.service.impl;

import com.cqjtu.lexian.persistence.AdminRepository;
import com.cqjtu.lexian.domain.Admin;
import com.cqjtu.lexian.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

/**
 * AdminServiceImpl
 *
 * @author suwen
 */
@Service
public class AdminServiceImpl implements AdminService {

  @Autowired private AdminRepository adminRepository;

  @Override
  public Admin login(String username, String password) {
    return adminRepository.findAdminByUsernameAndPassword(username, password);
  }

  @Override
  public Admin addAdmin(Admin admin) {
    return adminRepository.save(admin);
  }

  @Override
  public Boolean hasAdmin(String username) {
    return adminRepository.findAdminByUsername(username) != null;
  }

  @Override
  public Page<Admin> getAdmins(int page) {
    return adminRepository.findAll(new PageRequest(page, 10));
  }

  @Override
  public Admin getAdmin(int id) {
    return adminRepository.findOne(id);
  }

  @Override
  public void updateAdmin(Admin admin) {
    adminRepository.save(admin);
  }

  @Override
  public void deleteAdmin(int id) {
    adminRepository.delete(id);
  }
}
