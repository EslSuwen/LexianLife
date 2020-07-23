package com.cqjtu.lexian.controller.web;

import com.cqjtu.lexian.exception.CustomerServiceException;
import com.cqjtu.lexian.service.CustomerService;
import com.cqjtu.lexian.service.GoodsService;
import com.cqjtu.lexian.domain.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/** Created by xiaoxiaobing on 17-8-27. */
@Controller
public class CommonController {
  @Autowired private GoodsService goodsService;
  @Autowired private CustomerService customerService;

  public void enter(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // 获取保存在cookie中的用户名和密码
    Cookie[] cookies = request.getCookies();
    if (cookies == null) return;
    Cookie autoLoginCookie = null;
    Cookie remPswCoookie = null;
    Cookie usernameCookie = null;
    Cookie passwordCookie = null;
    for (int i = 0; i < cookies.length; i++) {
      if ("autoLogin".equals(cookies[i].getName())) autoLoginCookie = cookies[i];
      if ("remPsw".equals(cookies[i].getName())) remPswCoookie = cookies[i];
      if ("username".equals(cookies[i].getName())) usernameCookie = cookies[i];
      if ("password".equals(cookies[i].getName())) passwordCookie = cookies[i];
    }
    // 自动登录
    if (autoLoginCookie != null && usernameCookie != null && passwordCookie != null) {
      if ("true".equals(autoLoginCookie.getValue())) {
        String username = usernameCookie.getValue();
        String password = passwordCookie.getValue();
        try {
          Customer customer = new Customer();
          customer.setUsername(username);
          customer.setPassword(password);
          Customer getCustomer = customerService.login(customer);
          request.getSession().setAttribute("customer", getCustomer);
          request.getSession().setAttribute("autoLogin", "true");
        } catch (CustomerServiceException ce) {
          switch (ce.getErrorCode()) {
            case 0: // 用户不存在
              request.setAttribute("usernameWrong", "此用户名不存在");
              request
                  .getRequestDispatcher("/page/foreground/user/Login.jsp")
                  .forward(request, response);
              return;
            case 1: // 密码错误
              request.setAttribute("passwordWrong", "密码错误");
              request
                  .getRequestDispatcher("/page/foreground/user/Login.jsp")
                  .forward(request, response);
              return;
            case 2: // 顾客帐号被禁用
              request.setAttribute("loginFail", "您的帐号已被禁用");
              request
                  .getRequestDispatcher("/page/foreground/user/Login.jsp")
                  .forward(request, response);
              return;
            case 3: // 数据访问错误
            case 4: // 其他异常
              request.setAttribute("loginFail", "服务器内部错误");
              request
                  .getRequestDispatcher("/page/foreground/user/Login.jsp")
                  .forward(request, response);
              return;
            default:
              break;
          }
        }
      }
    }
    // 记住密码
    if (remPswCoookie != null && usernameCookie != null && passwordCookie != null) {
      if ("true".equals(remPswCoookie.getValue())) {
        String username = usernameCookie.getValue();
        String password = passwordCookie.getValue();
        request.getSession().setAttribute("username", username);
        request.getSession().setAttribute("password", password);
        request.getSession().setAttribute("remPsw", "true");
      }
    }
  }

  @RequestMapping(
      value = "/main",
      method = {RequestMethod.GET, RequestMethod.POST})
  public String requestMain(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    enter(request, response);
    /*    if (request.getSession().getAttribute("catalogs") == null) {
      List<Catalog> catalogs = goodsService.displayCatalogs();
      // 默认给每个Category查询20个Goods
      for (Catalog catalog : catalogs) {
        for (int j = 0; j < catalog.getCategories().size(); j++) {
          Category category = catalog.getCategories().get(j);
          Page<Goods> goodsPage = goodsService.getGoods(category.getCategory_id(), 0, 16, 0);
          category.setGoods(goodsPage.getContent());
        }
      }
      request.getSession().setAttribute("catalogs", catalogs);
    }*/
    return "foreground/Main";
  }

  /**
   * 模拟请求转发 主要是a标签是重定向，把重定向变成请求转发
   *
   * @param path
   * @return
   */
  @RequestMapping(
      value = "forward",
      method = {RequestMethod.GET, RequestMethod.POST})
  public String forware(String path) {
    return path;
  }
}
