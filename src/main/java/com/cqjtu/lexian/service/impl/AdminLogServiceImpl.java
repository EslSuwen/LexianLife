package com.cqjtu.lexian.service.impl;

import com.cqjtu.lexian.persistence.AdminLogRepository;
import com.cqjtu.lexian.domain.AdminLog;
import com.cqjtu.lexian.service.AdminLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * AdminLogServiceImpl
 *
 * @author suwen
 */
@Service
public class AdminLogServiceImpl implements AdminLogService {

  @Autowired
  AdminLogRepository adminLogRepository;

  @Override
  public void save(AdminLog adminLog) {
    adminLogRepository.save(adminLog);
  }

  @Override
  public List<AdminLog> getLog(int id) {
    return adminLogRepository.findAllByAdminId(id);
  }
}
