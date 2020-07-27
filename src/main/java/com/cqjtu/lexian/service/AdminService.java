package com.cqjtu.lexian.service;

import com.cqjtu.lexian.domain.Admin;
import org.springframework.data.domain.Page;

/**
 * AdminService
 *
 * @author suwen
 */
public interface AdminService {

  /**
   * 管理员登录
   *
   * @param username 管理员用户名
   * @param password 管理员密码
   * @return 管理员信息
   */
  Admin login(String username, String password);

  /**
   * 增加管理员
   *
   * @param admin 管理员信息
   * @return 管理员信息
   */
  Admin addAdmin(Admin admin);

  /**
   * 根据用户名查询是否存在该管理员
   *
   * @param username 管理员用户名
   * @return boolean
   */
  Boolean hasAdmin(String username);

  /**
   * 管理员信息分页查询
   *
   * @param page 分页数
   * @return 管理员信息分页
   */
  Page<Admin> getAdmins(int page);

  /**
   * 根据管理员编号获取管理员信息
   *
   * @param id 管理员编号
   * @return 管理员信息
   */
  Admin getAdmin(int id);

  /**
   * 更新管理员信息
   *
   * @param admin 管理员信息
   */
  void updateAdmin(Admin admin);

  /**
   * 根据管理员编号删除管理员信息
   *
   * @param id 管理员编号
   */
  void deleteAdmin(int id);
}
