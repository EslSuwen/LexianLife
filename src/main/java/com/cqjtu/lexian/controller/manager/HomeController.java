package com.cqjtu.lexian.controller.manager;

import com.cqjtu.lexian.domain.OrderStatus;
import com.cqjtu.lexian.persistence.CustomerRepository;
import com.cqjtu.lexian.persistence.GoodsRepository;
import com.cqjtu.lexian.persistence.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/** @author coderWu Created in 下午2:28 17-9-24 */
@Controller
@RequestMapping("/admin/home")
public class HomeController {

  @Autowired CustomerRepository customerRepository;
  @Autowired OrderRepository orderRepository;
  @Autowired GoodsRepository goodsRepository;

  @RequestMapping("/index")
  public String index(ModelMap model) {
    model.put("userCount", customerRepository.count());
    model.put("orderCount", orderRepository.count());
    // 交易总金额
    model.put("orderAmount", orderRepository.sumAmount());
    // 待发货
    model.put("nosend", orderRepository.countByStatus(OrderStatus.READY));
    // 已付款
    model.put("payed", orderRepository.countByStatus(OrderStatus.PAYED));
    // 已完成
    model.put("finished", orderRepository.countByStatus(OrderStatus.FINISH));
    // 上架商品数
    int onsale = goodsRepository.countByStatus(0);
    // 下架商品数
    int offsale = goodsRepository.countByStatus(1);
    // 已付款
    model.put("onsale", onsale);
    // 已完成
    model.put("offsale", offsale);
    return "manager/home";
  }
}
