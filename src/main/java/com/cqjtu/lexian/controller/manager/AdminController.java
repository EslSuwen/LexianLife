package com.cqjtu.lexian.controller.manager;

import com.cqjtu.lexian.aop.AdminControllerLog;
import com.cqjtu.lexian.domain.Admin;
import com.cqjtu.lexian.service.AdminLogService;
import com.cqjtu.lexian.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/** @author coderWu Created in 上午10:07 17-9-19 */
@Controller
@RequestMapping("/admin")
public class AdminController {

  @Autowired AdminService adminService;

  @Autowired AdminLogService adminLogService;

  @RequestMapping(
      value = "/index",
      method = {RequestMethod.GET})
  public String admin(HttpSession session) {
    if (session.getAttribute("admin") != null) {
      return "manager/index";
    } else {
      return "manager/admin/login";
    }
  }

  @RequestMapping("/admin_list")
  public String adminList(ModelMap model, Integer page) {
    page = page == null ? 0 : page;
    Page<Admin> result = adminService.getAdmins(page);
    model.put("list", result.getContent());
    model.put("total", result.getTotalElements());
    model.put("page", result.getTotalPages());
    return "manager/admin/administrator";
  }

  @RequestMapping("/admin_info")
  public String adminInfo(ModelMap model, HttpSession session) {
    Admin admin = (Admin) session.getAttribute("admin");
    model.put("admin", admin);

    model.put("log", adminLogService.getLog(admin.getAdminId()));
    return "manager/admin/admin_info";
  }

  /**
   * @param session HttpSession
   * @param username string
   * @param password string
   * @param verifyCode string
   * @return { "status" : "0:成功，1：验证码错误，2：用户名或密码错误，或账户已被冻结"， "msg" : "错误信息" }
   */
  @RequestMapping(value = "/login", method = RequestMethod.POST)
  @ResponseBody
  @AdminControllerLog(description = "登录")
  public Map<String, Object> login(
      HttpSession session, String username, String password, String verifyCode) {
    HashMap<String, Object> result = new HashMap<>(2);
    if (!session.getAttribute("imageCode").equals(verifyCode)) {
      result.put("status", 1);
      result.put("msg", "验证码错误");
      return result;
    }
    Admin admin = adminService.login(username, password);
    if (admin != null && admin.getStatus() != 0) {
      result.put("status", 0);
      result.put("msg", "登录成功");
      session.setAttribute("admin", admin);
    } else {
      result.put("status", 2);
      result.put("msg", "用户名或密码错误，或账户已被冻结");
    }
    return result;
  }

  @RequestMapping("/logout")
  @AdminControllerLog(description = "登出")
  public String logout(HttpSession session) {
    session.removeAttribute("admin");
    return "manager/index";
  }

  @RequestMapping(
      value = "add_admin",
      method = {RequestMethod.POST})
  @ResponseBody
  @AdminControllerLog(description = "添加管理员")
  public Map<String, Object> addAdmin(Admin admin, HttpSession session) {
    HashMap<String, Object> result = new HashMap<>(2);
    if (admin.getAdminId() != 0) {
      Admin admin1 = adminService.getAdmin(admin.getAdminId());
      admin.setPassword(admin1.getPassword());
      admin.setStatus(1);
      adminService.addAdmin(admin);
      session.setAttribute("admin", admin);
      result.put("status", true);
      return result;
    }
    if (adminService.hasAdmin(admin.getUsername())) {
      result.put("status", false);
      result.put("msg", "登录名已存在");
    } else {
      admin.setStatus(1);
      result.put("status", adminService.addAdmin(admin) != null);
      result.put("msg", "添加用户名失败");
    }
    return result;
  }

  @RequestMapping("/change_status")
  @ResponseBody
  @AdminControllerLog(description = "改变管理员状态")
  public Map<String, Object> changeStatus(Integer id, Boolean status) {
    Boolean success = false;
    Map<String, Object> result = new HashMap();
    if (id != null && status != null) {
      Admin admin = adminService.getAdmin(id);
      if (admin != null) {
        admin.setStatus(status ? 1 : 0);
        adminService.updateAdmin(admin);
        success = true;
      }
    }
    result.put("status", success);
    return result;
  }

  @RequestMapping("/delete_admin")
  @ResponseBody
  @AdminControllerLog(description = "删除管理员")
  public Map<String, Object> deleteGoods(Integer id) {
    Map<String, Object> result = new HashMap();
    if (id != null) {
      adminService.deleteAdmin(id);
    }
    result.put("status", true);
    return result;
  }

  @RequestMapping("/change_pwd")
  @ResponseBody
  @AdminControllerLog(description = "修改密码")
  public Map<String, Object> changePwd(Integer id, String pwd, String newpwd) {
    Map<String, Object> result = new HashMap();
    result.put("status", false);
    result.put("msg", "修改失败");
    if (id != null && pwd != null && newpwd != null && !"".equals(newpwd)) {
      Admin admin = adminService.getAdmin(id);
      if (admin != null && admin.getPassword().equals(pwd)) {
        admin.setPassword(newpwd);
        adminService.updateAdmin(admin);
        result.put("status", true);
      } else {
        result.put("status", false);
        result.put("msg", "原密码错误");
      }
    }
    return result;
  }
}
