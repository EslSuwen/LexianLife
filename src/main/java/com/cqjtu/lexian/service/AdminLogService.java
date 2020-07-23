package com.cqjtu.lexian.service;

import com.cqjtu.lexian.domain.AdminLog;

import java.util.List;

/** @author coderWu Created in 下午3:33 17-9-26 */
public interface AdminLogService {

  void save(AdminLog adminLog);

  List<AdminLog> getLog(int id);
}
