package com.cqjtu.lexian.controller.web;

import com.cqjtu.lexian.domain.*;
import com.lexian_life.domain.*;
import com.cqjtu.lexian.exception.CustomerServiceException;
import com.cqjtu.lexian.service.CustomerService;
import com.cqjtu.lexian.service.GoodsService;
import com.cqjtu.lexian.service.OrderService;
import com.cqjtu.lexian.util.ImageUtil;
import com.cqjtu.lexian.util.ServletUitl;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/** Created by xiaoxiaobing on 17-8-25. */
@RestController
public class CustomerController {
  @Autowired private CustomerService customerService;
  @Autowired private OrderService orderService;
  @Autowired private GoodsService goodsService;
  private final int UPCOOKIELIFE = 60 * 60 * 24 * 3; // 记住密码自动登录的cookie最大生命时长
  private final int MODIFYPSWCOOKIELIFE = 60 * 10; // 修改密码验证码Cookie最大生命时长

  @InitBinder
  public void intDate(WebDataBinder dataBinder) {
    dataBinder.addCustomFormatter(new DateFormatter("yyyy-MM-dd"));
  }

  /**
   * 顾客注册
   *
   * @param customer
   * @return
   */
  @RequestMapping(
      value = "/customerRegister",
      method = {RequestMethod.POST})
  public void register(
          Customer customer, HttpServletRequest request, HttpServletResponse response) {
    try {
      try {
        customerService.register(customer);
      } catch (CustomerServiceException e) {
        switch (e.getErrorCode()) {
          case 0:
            request.setAttribute("registerFail", "邮箱不存在");
            request
                .getRequestDispatcher("/page/foreground/user/Register.jsp")
                .forward(request, response);
            return;
          case 1:
            request.setAttribute("registerFail", "此用户名已被注册");
            request
                .getRequestDispatcher("/page/foreground/user/Register.jsp")
                .forward(request, response);
            return;
          case 2:
            request.setAttribute("registerFail", "服务器内部错误");
            request
                .getRequestDispatcher("/page/foreground/user/Register.jsp")
                .forward(request, response);
          default:
            break;
        }
      }
      request.getRequestDispatcher("/page/foreground/user/Login.jsp").forward(request, response);
      return;
    } catch (IOException | ServletException e) {
      e.printStackTrace();
    }
  }

  /**
   * 顾客登录
   *
   * @param username 用户名
   * @param password 密码
   * @param rempsw 记住密码
   * @param autoLogin 自动登录
   * @return 登录成功返回个人中心页面，登录失败返回登录页面，并显示失败信息
   */
  @RequestMapping(
      value = "/customerLogin",
      method = {RequestMethod.GET, RequestMethod.POST})
  public void login(
      HttpSession session,
      HttpServletRequest request,
      HttpServletResponse response,
      String username,
      String password,
      String verification,
      String rempsw,
      String autoLogin)
      throws ServletException, IOException {
    Customer getCustomer = null;
    // 校验验证码
    Object verifyCode = request.getSession().getAttribute("imageCode");
    if (verification == null || !verification.equals(verifyCode)) {
      request.setAttribute("verifyWrong", "验证码错误");
      request.getRequestDispatcher("/page/foreground/user/Login.jsp").forward(request, response);
      return;
    }
    // 封装数据
    Customer customer = new Customer();
    customer.setUsername(username);
    customer.setPassword(password);
    try {
      // 登录事务
      getCustomer = customerService.login(customer);
      session.setAttribute("customer", getCustomer);
      Cookie remPswCookie = null;
      Cookie autoLoginCookie = null;
      if ("1".equals(rempsw)) { // 记住密码
        remPswCookie = new Cookie("remPsw", "true");
        remPswCookie.setMaxAge(UPCOOKIELIFE);
        response.addCookie(remPswCookie);
      } else { // 没有选择记住密码则把记住密码的Cookie删除
        Cookie cookie = ServletUitl.getCookieByName(request.getCookies(), "remPsw");
        if (cookie != null) {
          cookie.setMaxAge(0);
        }
      }
      if ("1".equals(autoLogin)) { // 自动登录
        autoLoginCookie = new Cookie("autoLogin", "true");
        autoLoginCookie.setMaxAge(UPCOOKIELIFE);
        response.addCookie(autoLoginCookie);
      } else { // 没有选择自动登录，则把自动登录的Cookie删除
        Cookie cookie = ServletUitl.getCookieByName(request.getCookies(), "autoLogin");
        if (cookie != null) {
          cookie.setMaxAge(0);
        }
      }
      if (remPswCookie != null || autoLoginCookie != null) {
        Cookie usernameCookie = new Cookie("username", username);
        Cookie passwordCookie = new Cookie("password", password);
        usernameCookie.setMaxAge(UPCOOKIELIFE);
        passwordCookie.setMaxAge(UPCOOKIELIFE);
        response.addCookie(usernameCookie);
        response.addCookie(passwordCookie);
      }
    } catch (CustomerServiceException cse) {
      switch (cse.getErrorCode()) {
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
    // 将存在Cookie中的浏览记录转储到数据库
    Cookie browsedGoodsCookie = ServletUitl.getCookieByName(request.getCookies(), "browsedGoods");
    if (browsedGoodsCookie != null) {
      try {
        JSONArray array = new JSONArray(browsedGoodsCookie.getValue());
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        for (int i = 0; i < array.length(); i++) {
          JSONObject obj = array.getJSONObject(i);
          int goods_id = obj.getInt("goods_id");
          Date time = format.parse(obj.getString("time"));
          Goods goods = goodsService.findGoodsById(goods_id);
          if (goods != null) {
            customerService.browseGoods(getCustomer, goods, time);
          }
        }
      } catch (JSONException e) {
        e.printStackTrace();
      } catch (ParseException e) {
        e.printStackTrace();
      }
      browsedGoodsCookie.setMaxAge(0); // 清除
    }
    response.sendRedirect("/page/foreground/user/UserCenter.jsp");
  }

  /**
   * 退出登录
   *
   * @param request
   * @param response
   */
  @RequestMapping(
      value = "/logout",
      method = {RequestMethod.GET})
  public void logout(HttpServletRequest request, HttpServletResponse response) {
    request.getSession().removeAttribute("customer");
    try {
      request.getRequestDispatcher("/page/foreground/user/Login.jsp").forward(request, response);
    } catch (ServletException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
  // 生成验证码图片
  @RequestMapping("/valicode") // 对应/user/valicode.do请求
  public void valicode(HttpServletResponse response, HttpSession session) throws Exception {
    // 利用图片工具生成图片
    // 第一个参数是生成的验证码，第二个参数是生成的图片
    Object[] objs = ImageUtil.createImage();
    // 将验证码存入Session
    session.setAttribute("imageCode", objs[0]);
    // 将图片输出给浏览器
    BufferedImage image = (BufferedImage) objs[1];
    response.setContentType("image/png");
    OutputStream os = response.getOutputStream();
    ImageIO.write(image, "png", os);
  }

  /**
   * 修改顾客个人信息
   *
   * @param getCustomer
   * @param headFile
   * @param request
   * @param response
   */
  @RequestMapping(
      value = "/customerModify",
      method = {RequestMethod.GET, RequestMethod.POST})
  public void customerModify(
      @RequestParam("headFile") MultipartFile headFile,
      Customer getCustomer,
      HttpServletRequest request,
      HttpServletResponse response,
      HttpSession session) {
    try {
      try {
        String path = request.getServletContext().getRealPath("/img/headImg");
        Customer customer = (Customer) request.getSession().getAttribute("customer");
        System.out.println(headFile.getOriginalFilename());
        if (!"".equals(headFile.getOriginalFilename())) { // 选择了新头像
          File file =
              new File(
                  path,
                  customer.getUsername()
                      + headFile
                          .getOriginalFilename()
                          .substring(headFile.getOriginalFilename().lastIndexOf(".")));
          headFile.transferTo(file);
          customer.setHeadImg("../../../img/headImg/" + file.getName());
        }
        customer.setBirth(new Date(getCustomer.getBirth().getTime()));
        customer.setNickname(getCustomer.getNickname());
        customer.setRealname(getCustomer.getRealname());
        customer.setSex(getCustomer.getSex());
        customer.setPhone(getCustomer.getPhone());
        customerService.updateCustomer(customer);
        session.setAttribute("result", "修改信息成功");
        response.sendRedirect("/page/foreground/user/UserInfo.jsp");
      } catch (IOException e) {
        Logger.getLogger(CustomerController.class).error(e.getMessage());
        session.setAttribute("result", "上传头像失败");
        response.sendRedirect("/page/foreground/user/UserInfo.jsp");
      } catch (CustomerServiceException e) {
        session.setAttribute("result", "修改信息失败");
        response.sendRedirect("/page/foreground/user/UserInfo.jsp");
      }
      //            response.sendRedirect("/page/foreground/user/UserInfo.jsp");
      //            return;

    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  /**
   * 顾客获取修改密码的邮件验证码，返回json数据结果
   *
   * @param session
   * @param response
   */
  @RequestMapping(
      value = "/sendModifyPswEmail",
      method = {RequestMethod.POST, RequestMethod.GET})
  public void sendModifyPswEmail(HttpSession session, HttpServletResponse response) {
    Customer customer = (Customer) session.getAttribute("customer");
    try {
      String encoding = "utf-8";
      response.setContentType("text/plain;charset=" + encoding);
      response.setCharacterEncoding(encoding);
      PrintWriter pw = response.getWriter();
      JSONObject resultJsonObj = new JSONObject();
      try {
        String code = customerService.sendUpdatePswEmail(customer);
        Cookie cookie = new Cookie("modifyPswCode", code);
        cookie.setMaxAge(MODIFYPSWCOOKIELIFE);
        response.addCookie(cookie);
        resultJsonObj.put("result", "success");
      } catch (CustomerServiceException e) {
        resultJsonObj.put("result", "fail");
      }
      pw.println(resultJsonObj.toString());
      pw.flush();
      pw.close();
    } catch (JSONException je) {
      je.printStackTrace();
    } catch (IOException ioe) {
      ioe.printStackTrace();
    }
  }

  /**
   * 修改密码
   *
   * @param password
   * @param getCode
   * @param request
   * @param response
   */
  @RequestMapping(
      value = "/modifyPassword",
      method = {RequestMethod.POST})
  public void modifyPassword(
      String password, String getCode, HttpServletRequest request, HttpServletResponse response) {
    try {
      Cookie cookie = ServletUitl.getCookieByName(request.getCookies(), "modifyPswCode");
      if (cookie != null) {
        String code = cookie.getValue();
        if (code.equals(getCode)) { // 验证码正确
          Customer customer = (Customer) request.getSession().getAttribute("customer");
          customer.setPassword(password);
          try {
            customerService.updateCustomer(customer);
            if (ServletUitl.getCookieByName(request.getCookies(), "autoLogin") != null
                || ServletUitl.getCookieByName(request.getCookies(), "remPsw") != null) {
              Cookie passwordCookie = ServletUitl.getCookieByName(request.getCookies(), "password");
              if (passwordCookie != null) passwordCookie.setValue(password);
            }
          } catch (CustomerServiceException cse) {
            if (cse.getErrorCode() == 0) {
              request.getSession().setAttribute("modifyPswFail", "该用户不存在");
            } else {
              request.getSession().setAttribute("modifyPswFail", "服务器内部错误");
            }
            response.sendRedirect("/page/foreground/user/ModifyPassword.jsp");
            return;
          }
          response.sendRedirect("/page/foreground/user/ModifyPasswordSuccess.jsp");
          return;
        } else { // 验证码错误
          request.getSession().setAttribute("modifyPswFail", "验证码错误");
          response.sendRedirect("/page/foreground/user/ModifyPassword.jsp");
          return;
        }
      } else { // 还没有验证码
        request.getSession().setAttribute("modifyPswFail", "您还未获取验证码");
        response.sendRedirect("/page/foreground/user/ModifyPassword.jsp");
        return;
      }
    } catch (IOException ioe) {
      ioe.printStackTrace();
    }
  }

  /**
   * 顾客获取修改密码的邮件验证码，返回json数据结果
   *
   * @param session
   * @param response
   */
  @RequestMapping(
      value = "/sendModifyEmailEmail",
      method = {RequestMethod.POST, RequestMethod.GET})
  public void sendModifyEmailEmail(HttpSession session, HttpServletResponse response) {
    Customer customer = (Customer) session.getAttribute("customer");
    try {
      String encoding = "utf-8";
      response.setContentType("text/plain;charset=" + encoding);
      response.setCharacterEncoding(encoding);
      PrintWriter pw = response.getWriter();
      JSONObject resultJsonObj = new JSONObject();
      try {
        String code = customerService.sendUpdateEmailEmail(customer);
        Cookie cookie = new Cookie("modifyEmailCode", code);
        cookie.setMaxAge(MODIFYPSWCOOKIELIFE);
        response.addCookie(cookie);
        resultJsonObj.put("result", "success");
      } catch (CustomerServiceException e) {
        resultJsonObj.put("result", "fail");
      }
      pw.println(resultJsonObj.toString());
      pw.flush();
      pw.close();
    } catch (JSONException je) {
      je.printStackTrace();
    } catch (IOException ioe) {
      ioe.printStackTrace();
    }
  }

  /**
   * 修改绑定邮箱
   *
   * @param email
   * @param getCode
   * @param request
   * @param response
   */
  @RequestMapping(
      value = "/modifyEmail",
      method = {RequestMethod.POST})
  public void modifyEmail(
      String email, String getCode, HttpServletRequest request, HttpServletResponse response) {
    try {
      Cookie cookie = ServletUitl.getCookieByName(request.getCookies(), "modifyEmailCode");
      if (cookie != null) {
        String code = cookie.getValue();
        if (code.equals(getCode)) { // 验证码正确
          Customer customer = (Customer) request.getSession().getAttribute("customer");
          customer.setEmail(email);
          try {
            customerService.updateCustomer(customer);
          } catch (CustomerServiceException cse) {
            if (cse.getErrorCode() == 0) {
              request.getSession().setAttribute("modifyEmailFail", "该用户不存在");
            } else {
              request.getSession().setAttribute("modifyEmailFail", "服务器内部错误");
            }
            response.sendRedirect("/page/foreground/user/ModifyEmail.jsp");
            return;
          }
          response.sendRedirect("/page/foreground/user/ModifyEmailSuccess.jsp");
          return;
        } else { // 验证码错误
          request.getSession().setAttribute("modifyEmailFail", "验证码错误");
          response.sendRedirect("/page/foreground/user/ModifyEmail.jsp");
          return;
        }
      } else { // 还没有验证码
        request.getSession().setAttribute("modifyEmailFail", "您还未获取验证码");
        response.sendRedirect("/page/foreground/user/ModifyEmail.jsp");
        return;
      }
    } catch (IOException ioe) {
      ioe.printStackTrace();
    }
  }

  /**
   * @param request
   * @return
   */
  @RequestMapping(
      value = "/manageAddress",
      method = {RequestMethod.GET})
  public void manageAddress(HttpServletRequest request, HttpServletResponse response) {
    try {
      Customer customer = (Customer) request.getSession().getAttribute("customer");
      if (customer == null) // 顾客还未登录，跳转到登录页面
      request.getRequestDispatcher("/page/foreground/user/Login.jsp").forward(request, response);
      try {
        List<RecAddr> recAddrs = customerService.listRecAddr(customer);
        request.getSession().setAttribute("recAddrs", recAddrs);
      } catch (CustomerServiceException e) {
        request.getRequestDispatcher("/page/foreground/Error.jsp").forward(request, response);
      }
      request.getRequestDispatcher("/page/foreground/user/Address.jsp").forward(request, response);
    } catch (IOException e) {
      e.printStackTrace();
    } catch (ServletException e) {
      e.printStackTrace();
    }
  }

  /**
   * 添加收货人信息
   *
   * @param getRecAddr
   * @param response
   */
  @RequestMapping(
      value = "/addAddress",
      method = {RequestMethod.POST})
  public void addAddress(RecAddr getRecAddr, HttpServletResponse response, HttpSession session) {
    try {
      try {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) { // 顾客未登录，则跳转到登录页面
          response.sendRedirect("/page/foreground/user/Login.jsp");
          return;
        }
        getRecAddr.setCusId(customer.getCusId());
        customerService.addRecAddress(getRecAddr);
        session.setAttribute("addressRsult", "新增地址成功");
        response.sendRedirect("/manageAddress.do");
        return;
      } catch (CustomerServiceException e) {
        session.setAttribute("addressRsult", "新增地址失败");
        response.sendRedirect("/page/foreground/user/Address.jsp");
        return;
      }
    } catch (IOException ioe) {
      ioe.printStackTrace();
    }
  }
  /**
   * 前往编辑收货人地址页面
   *
   * @param id
   * @param request
   * @return
   */
  @RequestMapping(
      value = "/toEditAddr",
      method = {RequestMethod.GET})
  public void toEditAddr(int id, HttpServletRequest request, HttpServletResponse response) {
    try {
      RecAddr recAddr = null;
      List<RecAddr> recAddrs = (List<RecAddr>) request.getSession().getAttribute("recAddrs");
      if (recAddrs == null) {
        request.getRequestDispatcher("page/foreground/Error.jsp").forward(request, response);
        return;
      }
      for (int i = 0; i < recAddrs.size(); i++) {
        if (recAddrs.get(i).getRecaddrId() == id) {
          recAddr = recAddrs.get(i);
          break;
        }
      }
      if (recAddr == null) {
        request.getRequestDispatcher("/page/foreground/Error.jsp").forward(request, response);
        return;
      }
      request.getSession().setAttribute("editingAddr", recAddr);
      request
          .getRequestDispatcher("/page/foreground/user/EditAddress.jsp")
          .forward(request, response);
      return;
    } catch (IOException | ServletException e) {
      e.printStackTrace();
    }
  }

  /**
   * 修改收货人信息
   *
   * @param getRecAddr
   * @param request
   * @param response
   */
  @RequestMapping(
      value = "/updateAddr",
      method = {RequestMethod.POST})
  public void updateAddr(
      RecAddr getRecAddr, HttpServletRequest request, HttpServletResponse response) {
    try {
      RecAddr recAddr = (RecAddr) request.getSession().getAttribute("editingAddr");
      if (recAddr == null) {
        request.getSession().setAttribute("updateAddrFail", "更新失败");
        response.sendRedirect("/page/foreground/user/EditAddress.jsp");
        return;
      }
      recAddr.setRecName(getRecAddr.getRecName());
      recAddr.setPhone(getRecAddr.getPhone());
      recAddr.setPostcode(getRecAddr.getPostcode());
      recAddr.setProvince(getRecAddr.getProvince());
      recAddr.setCity(getRecAddr.getCity());
      recAddr.setDistrict(getRecAddr.getDistrict());
      recAddr.setAddr(getRecAddr.getAddr());
      try {
        customerService.updateRecAddr(recAddr);
      } catch (CustomerServiceException cse) {
        request.getSession().setAttribute("updateAddrFail", "更新失败");
        response.sendRedirect("/page/foreground/user/EditAddress.jsp");
        return;
      }
      response.sendRedirect("/manageAddress.do");
      return;
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
  /**
   * 删除收货人地址
   *
   * @param id 收货人地址id
   * @param session
   * @param response
   * @return
   */
  @RequestMapping(
      value = "/delRecAddr",
      method = {RequestMethod.GET, RequestMethod.POST})
  public void delRecAddr(int id, HttpSession session, HttpServletResponse response) {
    List<RecAddr> recAddrs = (List<RecAddr>) session.getAttribute("recAddrs");
    String encoding = "utf-8";
    response.setContentType("text/plain;charset=" + encoding);
    response.setCharacterEncoding(encoding);
    try {
      PrintWriter pw = response.getWriter();
      JSONObject resultJsonObj = new JSONObject();
      if (recAddrs == null) { // 没有找到收货人地址列表
        resultJsonObj.put("result", "false");
        resultJsonObj.put("msg", "删除失败");
      } else {
        RecAddr recAddr = null;
        for (int i = 0; i < recAddrs.size(); i++) {
          if (id == recAddrs.get(i).getRecaddrId()) {
            recAddr = recAddrs.get(i);
            break;
          }
        }
        if (recAddr == null) { // 没有找到相应的收货人地址
          resultJsonObj.put("result", "false");
          resultJsonObj.put("msg", "删除失败");
        } else {
          try {
            customerService.delRecAddr(recAddr);
            resultJsonObj.put("result", "true");
            recAddrs.remove(recAddr);
          } catch (CustomerServiceException e) {
            resultJsonObj.put("result", "false");
            resultJsonObj.put("msg", "删除失败");
          }
        }
      }
      pw.println(resultJsonObj.toString());
      pw.flush();
      pw.close();
    } catch (IOException ioe) {
      ioe.printStackTrace();
    } catch (JSONException je) {
      je.printStackTrace();
    }
  }

  /**
   * 查询各状态订单的个数
   *
   * @param session
   * @param response
   */
  @RequestMapping(
      value = "/queryOrderCount",
      method = {RequestMethod.GET})
  public void queryOrderCountByStatus(HttpSession session, HttpServletResponse response) {
    String encoding = "utf-8";
    response.setContentType("text/plain;charset=" + encoding);
    response.setCharacterEncoding(encoding);
    PrintWriter printWriter = null;
    JSONObject jsonObject = new JSONObject();
    Customer customer = (Customer) session.getAttribute("customer");
    try {
      printWriter = response.getWriter();
      jsonObject.put(
          "waitpaynum", orderService.getOrderCountByStatus(customer, OrderStatus.NOTPAY));
      jsonObject.put(
          "waitsendnum",
          orderService.getOrderCountByStatus(customer, OrderStatus.PAYED)
              + orderService.getOrderCountByStatus(customer, OrderStatus.READY));
      jsonObject.put(
          "waitrecnum", orderService.getOrderCountByStatus(customer, OrderStatus.NOTRECEIVE));
      jsonObject.put("waitcommnum", orderService.getNotCommentCount(customer));
      printWriter.println(jsonObject.toString());
      printWriter.flush();
      printWriter.close();
    } catch (IOException e) {
      e.printStackTrace();
    } catch (JSONException e) {
      e.printStackTrace();
    }
  }

  /**
   * 获得关注的商品
   *
   * @param pageIndex
   * @param response
   */
  @RequestMapping(
      value = "/getAttentions",
      method = {RequestMethod.GET})
  public void getAttentions(int pageIndex, HttpSession session, HttpServletResponse response) {
    String encoding = "utf-8";
    response.setContentType("text/plain;charset=" + encoding);
    response.setCharacterEncoding(encoding);
    PrintWriter printWriter = null;
    JSONArray array = new JSONArray();
    Customer customer = (Customer) session.getAttribute("customer");
    List<Attention> attentions = customerService.getAttentions(customer, pageIndex);
    try {
      for (int i = 0; i < attentions.size(); i++) {
        Attention attention = attentions.get(i);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("goods_id", attention.getGoods().getGoodsId());
        jsonObject.put("img", attention.getGoods().getImg());
        jsonObject.put("unitPrice", attention.getGoods().getUnitPrice());
        jsonObject.put("name", attention.getGoods().getName());
        array.put(jsonObject);
      }
      printWriter = response.getWriter();
      printWriter.println(array.toString());
      printWriter.flush();
      printWriter.close();
    } catch (IOException e) {
      e.printStackTrace();
    } catch (JSONException e) {
      e.printStackTrace();
    }
  }

  /**
   * 分页查询用户的浏览记录
   *
   * @param pageIndex
   * @param request
   * @param response
   */
  @RequestMapping(
      value = "/getBrowsedGoods",
      method = {RequestMethod.GET})
  public void getBrowsedGoods(
      int pageIndex, HttpServletRequest request, HttpServletResponse response) {
    String encoding = "utf-8";
    response.setContentType("text/plain;charset=" + encoding);
    response.setCharacterEncoding(encoding);
    PrintWriter printWriter = null;
    JSONArray array = new JSONArray();
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    try {
      Customer customer = (Customer) request.getSession().getAttribute("customer");
      List<BrowseRecord> records = customerService.getBrowserRecords(pageIndex, customer);
      for (int i = 0; i < records.size(); i++) {
        JSONObject obj = new JSONObject();
        obj.put("time", format.format(records.get(i).getTime()));
        obj.put("img", records.get(i).getGoods().getImg());
        obj.put("goods_id", records.get(i).getGoods().getGoodsId());
        obj.put("status", records.get(i).getGoods().getStatus());
        obj.put("name", records.get(i).getGoods().getName());
        obj.put("unitPrice", records.get(i).getGoods().getUnitPrice());
        obj.put("category_id", records.get(i).getGoods().getCategory().getCategory_id());
        array.put(obj);
      }
      printWriter = response.getWriter();
      printWriter.println(array.toString());
      printWriter.flush();
      printWriter.close();
    } catch (IOException e) {
      e.printStackTrace();
    } catch (JSONException e) {
      e.printStackTrace();
    }
  }

  /**
   * 获取顾客收藏(即关注)
   *
   * @param pageIndex
   * @param session
   * @param response
   */
  @RequestMapping(
      value = "/getCollection",
      method = {RequestMethod.GET})
  public void getCollection(int pageIndex, HttpSession session, HttpServletResponse response) {
    String encoding = "utf-8";
    response.setContentType("text/plain;charset=" + encoding);
    response.setCharacterEncoding(encoding);
    PrintWriter printWriter = null;
    JSONArray array = new JSONArray();
    Customer customer = (Customer) session.getAttribute("customer");
    List<Attention> attentions = customerService.getAttentions(customer, pageIndex);
    DecimalFormat df = new DecimalFormat("#.00");
    try {
      for (int i = 0; i < attentions.size(); i++) {
        Attention attention = attentions.get(i);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("goods_id", attention.getGoods().getGoodsId());
        jsonObject.put("img", attention.getGoods().getImg());
        jsonObject.put("category_id", attention.getGoods().getCategory().getCategory_id());
        jsonObject.put("unitPrice", attention.getGoods().getUnitPrice());
        jsonObject.put("name", attention.getGoods().getName());
        int zero = goodsService.getCommentCountByScore(attention.getGoods().getGoodsId(), 0);
        int one = goodsService.getCommentCountByScore(attention.getGoods().getGoodsId(), 1);
        int two = goodsService.getCommentCountByScore(attention.getGoods().getGoodsId(), 2);
        int three = goodsService.getCommentCountByScore(attention.getGoods().getGoodsId(), 3);
        int four = goodsService.getCommentCountByScore(attention.getGoods().getGoodsId(), 4);
        int five = goodsService.getCommentCountByScore(attention.getGoods().getGoodsId(), 5);
        double good = 0;
        if (zero + one + three + four + five != 0)
          good = 1.0 * (four + five) / (zero + one + two + three + four + five);
        jsonObject.put("good", df.format(new BigDecimal(good * 100)));
        jsonObject.put(
            "monthSaleCount", goodsService.getCurMonthSaleCount(attention.getGoods().getGoodsId()));
        array.put(jsonObject);
      }
      printWriter = response.getWriter();
      printWriter.println(array.toString());
      printWriter.flush();
      printWriter.close();
    } catch (IOException e) {
      e.printStackTrace();
    } catch (JSONException e) {
      e.printStackTrace();
    }
  }

  /**
   * 顾客评论商品
   *
   * @param orderItemId
   * @param content
   * @param score
   * @param session
   * @param response
   */
  @RequestMapping(
      value = "/commentGoods",
      method = {RequestMethod.GET})
  public void commentGoods(
      int orderItemId,
      String content,
      int score,
      HttpSession session,
      HttpServletResponse response) {
    String encoding = "utf-8";
    response.setContentType("text/plain;charset=" + encoding);
    response.setCharacterEncoding(encoding);
    PrintWriter printWriter = null;
    JSONObject jsonObject = new JSONObject();
    try {
      printWriter = response.getWriter();
      Comment comment = new Comment();
      comment.setScore(score);
      comment.setContent(content);
      Customer customer = (Customer) session.getAttribute("customer");
      if (customer == null) { // 顾客未登录
        jsonObject.put("result", false);
        jsonObject.put("msg", "您还未登录");
        printWriter.println(jsonObject.toString());
        printWriter.flush();
        printWriter.close();
        return;
      }
      comment.setCusId(customer.getCusId());
      OrderItem orderItem = orderService.getOrderItem(orderItemId);
      Goods goods = orderItem.getGoods();
      if (goods == null) { // 在数据库中未找到该商品
        jsonObject.put("result", false);
        jsonObject.put("msg", "您评论的商品不存在");
        printWriter.println(jsonObject.toString());
        printWriter.flush();
        printWriter.close();
        return;
      }
      comment.setGoodsId(goods.getGoodsId());
      customerService.commentGoods(comment);
      orderService.commentOrderItem(orderItem);
      jsonObject.put("result", true);
      jsonObject.put("msg", "评论成功");
      printWriter.println(jsonObject.toString());
      printWriter.flush();
      printWriter.close();
    } catch (IOException e) {
      e.printStackTrace();
    } catch (JSONException e) {
      e.printStackTrace();
    }
  }

  /**
   * 顾客忘记密码
   *
   * @param username
   * @param response
   */
  @RequestMapping(
      value = "/forgetPassword",
      method = {RequestMethod.GET})
  public void forgetPassword(String username, HttpServletResponse response) {
    String encoding = "utf-8";
    response.setContentType("text/plain;charset=" + encoding);
    response.setCharacterEncoding(encoding);
    PrintWriter printWriter = null;
    JSONObject obj = new JSONObject();
    try {
      printWriter = response.getWriter();
      Customer customer = customerService.getCustomerByUsername(username);
      if (customer == null) {
        obj.put("result", false);
        obj.put("msg", "该用户名不存在");
      } else {
        customerService.sendPasswordToEmail(customer);
        obj.put("result", true);
        obj.put("msg", "您的密码已发送至您的邮箱，请注意查收");
      }
      printWriter.println(obj.toString());
      printWriter.flush();
      printWriter.close();
    } catch (IOException e) {
      e.printStackTrace();
    } catch (JSONException e) {
      e.printStackTrace();
    }
  }
}
