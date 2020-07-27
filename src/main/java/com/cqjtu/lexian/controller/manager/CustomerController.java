package com.cqjtu.lexian.controller.manager;

import com.cqjtu.lexian.domain.BrowseRecord;
import com.cqjtu.lexian.service.impl.CustomerServiceImpl;
import com.cqjtu.lexian.aop.AdminControllerLog;
import com.cqjtu.lexian.domain.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * CustomerController 用户管理控制器
 * 
 * @author suwen
 */
@Controller
@RequestMapping("/admin/customer")
public class CustomerController {

  @Autowired
  CustomerServiceImpl customerService;

  /** 获取用户列表 */
  @RequestMapping("/customer_list")
  public String list(ModelMap model) {
    model.put("users", customerService.getAllCustomers());
    return "manager/customer/user_list";
  }

  /** 获取用户操作记录 */
  @RequestMapping("/log")
  public String log(ModelMap model) {
    model.put("users", customerService.getAllCustomers());
    return "manager/customer/integration";
  }

  /** 修改用户状态 */
  @RequestMapping("/change_status")
  @ResponseBody
  @AdminControllerLog(description = "修改用户状态")
  public Map<String, Object> changeStatus(Integer id, Boolean status) throws Exception {
    boolean success = false;
    Map<String, Object> result = new HashMap<>();
    if (id != null && status != null) {
      Customer customer = customerService.getCustomer(id);
      if (customer != null) {
        customer.setStatus(status ? 1 : 0);
        customerService.updateCustomer(customer);
        success = true;
      }
    }
    result.put("status", success);
    return result;
  }

  /** 删除用户 */
  @RequestMapping("/delete_customer")
  @ResponseBody
  @AdminControllerLog(description = "删除用户")
  public Map<String, Object> deleteGoods(Integer id) {
    Map<String, Object> result = new HashMap<>();
    if (id != null) {
      customerService.deleteCustomer(id);
    }
    result.put("status", true);
    return result;
  }

  /** 查看用户浏览记录 */
  @RequestMapping("/record")
  @ResponseBody
  @AdminControllerLog(description = "查看用户浏览记录")
  public Map<String, Object> records(Integer id) {
    Map<String, Object> result = new HashMap<>();
    result.put("status", true);
    List<BrowseRecord> records = customerService.getBrowserRecordsByCustomerId(id);
    List<Map<String, Object>> newRecords = new ArrayList<>();
    for (BrowseRecord record : records) {
      Map<String, Object> newRecord = new HashMap<>();
      newRecord.put("用户", record.getCustomer().getUsername());
      newRecord.put("产品名称", record.getGoods().getName());
      newRecord.put("价格(元)", record.getGoods().getUnitPrice());
      newRecord.put("加入时间", record.getTime().toString());
      newRecords.add(newRecord);
    }
    result.put("msg", newRecords);
    return result;
  }
}
