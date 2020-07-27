package com.cqjtu.lexian.service;

import com.cqjtu.lexian.domain.AdminLog;

import java.util.List;

/**
 * AdminLogService
 *
 * @author suwen
 */
public interface AdminLogService {

  /**
   * 保存管理员日志
   *
   * @param adminLog 管理员日志
   */
  void save(AdminLog adminLog);

  /**
   * 根据日志编号获取管理员日志
   *
   * @param id 日志编号
   */
  List<AdminLog> getLog(int id);
}
