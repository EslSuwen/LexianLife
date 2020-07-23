package com.cqjtu.lexian.controller.manager;

import com.cqjtu.lexian.domain.Order;
import com.cqjtu.lexian.service.impl.OrderServiceImpl;
import com.cqjtu.lexian.aop.AdminControllerLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/** @author coderWu Created in 下午10:06 17-9-25 */
@Controller
@RequestMapping("/manager/order")
public class OrderManagerController {

  @Autowired
  OrderServiceImpl orderService;

  @RequestMapping("/order_handling")
  public String orderHandling(ModelMap model) {
    model.put("orders", orderService.getAllOrder());
    return "manager/order/Order_handling";
  }

  @RequestMapping("/order_detailed")
  @AdminControllerLog(description = "查看订单详情")
  public String orderDetail(ModelMap model, Integer id) {
    if (id == null) {
      model.put("orders", orderService.getAllOrder());
      return "manager/order/Order_handling";
    } else {
      model.put("order", orderService.getOrder(id));
      return "manager/order/order_detailed";
    }
  }

  @RequestMapping("/refund")
  public String refund(ModelMap model) {
    return "manager/order/refund";
  }

  @RequestMapping("/change_status")
  @ResponseBody
  @AdminControllerLog(description = "修改订单状态")
  public Map<String, Object> changeStatus(Integer id, Integer status) {
    Boolean success = false;
    Map<String, Object> result = new HashMap();
    if (id != null && status != null) {
      Order order = orderService.getOrder(id);
      if (order != null) {
        order.setStatus(status);
        orderService.updateOrder(order);
        success = true;
      }
    }
    result.put("status", success);
    return result;
  }
}
