package com.cqjtu.lexian.service;

import com.cqjtu.lexian.domain.AdminLog;

import java.util.List;

/**
 * AdminLogService
 *
 * @author suwen
 */
public interface AdminLogService {

  void save(AdminLog adminLog);

  List<AdminLog> getLog(int id);
}
