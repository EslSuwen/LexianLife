package com.lexian_life.service;

import com.lexian_life.domain.Admin;
import com.lexian_life.domain.AdminLog;

import java.util.List;

/** @author coderWu Created in 下午3:33 17-9-26 */
public interface AdminLogService {

  void save(AdminLog adminLog);

  List<AdminLog> getLog(int id);
}
