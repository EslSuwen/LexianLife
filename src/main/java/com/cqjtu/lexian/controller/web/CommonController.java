package com.cqjtu.lexian.controller.web;

import com.cqjtu.lexian.domain.Catalog;
import com.cqjtu.lexian.domain.Category;
import com.cqjtu.lexian.domain.Customer;
import com.cqjtu.lexian.domain.Goods;
import com.cqjtu.lexian.exception.CustomerServiceException;
import com.cqjtu.lexian.service.CustomerService;
import com.cqjtu.lexian.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

/**
 * CommonController 通用控制器
 *
 * @author suwen
 */
@Controller
public class CommonController {
  @Autowired private GoodsService goodsService;
  @Autowired private CustomerService customerService;

  @GetMapping("/")
  public String index() {
    return "index";
  }

  public void enter(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // 获取保存在cookie中的用户名和密码
    Cookie[] cookies = request.getCookies();
    if (cookies == null) {
      return;
    }
    Cookie autoLoginCookie = null;
    Cookie remPswCoookie = null;
    Cookie usernameCookie = null;
    Cookie passwordCookie = null;
    for (Cookie cookie : cookies) {
      if ("autoLogin".equals(cookie.getName())) {
        autoLoginCookie = cookie;
      }
      if ("remPsw".equals(cookie.getName())) {
        remPswCoookie = cookie;
      }
      if ("username".equals(cookie.getName())) {
        usernameCookie = cookie;
      }
      if ("password".equals(cookie.getName())) {
        passwordCookie = cookie;
      }
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

  /**
   * 主页数据导入
   *
   * @param refresh 是否强制刷新缓存
   */
  @RequestMapping(
      value = "/main",
      method = {RequestMethod.GET, RequestMethod.POST})
  public String requestMain(
      @RequestParam(required = false, defaultValue = "false") boolean refresh,
      HttpServletRequest request,
      HttpServletResponse response)
      throws ServletException, IOException, ClassNotFoundException {
    enter(request, response);
    List<Catalog> catalogs;
    if (refresh) {
      catalogs = saveCacheFile();
      request.getSession().setAttribute("catalogs", catalogs);
      return "foreground/Main";
    }
    if (request.getSession().getAttribute("catalogs") != null) {
      return "foreground/Main";
    }
    // 从文件中读取
    catalogs = loadCacheFile();
    // 文件为空时，默认给每个Category查询20个Goods,存在文件中
    if (catalogs == null || catalogs.isEmpty()) {
      catalogs = saveCacheFile();
    }
    request.getSession().setAttribute("catalogs", catalogs);
    return "foreground/Main";
  }

  /**
   * 模拟请求转发 主要是a标签是重定向，把重定向变成请求转发
   *
   * @param path 请求路径
   * @return path
   */
  @RequestMapping(
      value = "forward",
      method = {RequestMethod.GET, RequestMethod.POST})
  public String forward(String path) {
    return path;
  }

  private List<Catalog> saveCacheFile() throws IOException {
    List<Catalog> catalogs = goodsService.displayCatalogs();
    for (Catalog catalog : catalogs) {
      for (int j = 0; j < catalog.getCategories().size(); j++) {
        Category category = catalog.getCategories().get(j);
        Page<Goods> goodsPage = goodsService.getGoods(category.getCategoryId(), 0, 16, 0);
        category.setGoods(goodsPage.getContent());
      }
    }
    FileOutputStream fileOutputStream = new FileOutputStream(new File("role.txt"));
    ObjectOutputStream stream = new ObjectOutputStream(fileOutputStream);
    stream.writeObject(catalogs);
    stream.close();
    return catalogs;
  }

  private List<Catalog> loadCacheFile() throws IOException, ClassNotFoundException {
    try {
      FileInputStream fileInputStream = new FileInputStream(new File("role.txt"));
      ObjectInputStream objectInputStream = new ObjectInputStream(fileInputStream);
      return (List<Catalog>) objectInputStream.readObject();
    } catch (FileNotFoundException e) {
      return null;
    }
  }
}
