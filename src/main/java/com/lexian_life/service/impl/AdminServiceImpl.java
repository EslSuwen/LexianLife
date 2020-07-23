package com.lexian_life.service.impl;

import com.lexian_life.domain.Admin;
import com.lexian_life.persistence.AdminRepository;
import com.lexian_life.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

/** @author coderWu Created in 下午4:08 17-9-20 */
@Service
public class AdminServiceImpl implements AdminService {

  @Autowired private AdminRepository adminRepository;

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
