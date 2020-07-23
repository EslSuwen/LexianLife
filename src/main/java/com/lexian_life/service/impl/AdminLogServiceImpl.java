package com.lexian_life.service.impl;

import com.lexian_life.domain.Admin;
import com.lexian_life.domain.AdminLog;
import com.lexian_life.persistence.AdminLogRepository;
import com.lexian_life.service.AdminLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/** @author coderWu Created in 下午3:34 17-9-26 */
@Service
public class AdminLogServiceImpl implements AdminLogService {

  @Autowired AdminLogRepository adminLogRepository;

  @Override
  public void save(AdminLog adminLog) {
    adminLogRepository.save(adminLog);
  }

  @Override
  public List<AdminLog> getLog(int id) {
    return adminLogRepository.findAllByAdminId(id);
  }
}
