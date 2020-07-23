package com.lexian_life.aop;

import java.lang.reflect.Method;
import java.util.Date;

import com.lexian_life.domain.Admin;
import com.lexian_life.domain.AdminLog;
import com.lexian_life.service.AdminLogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/** @author coderWu Created in 下午3:29 17-9-26 */
@Aspect
@Component
public class AdminLogAOP {

  @Autowired private AdminLogService adminLogService; // 日志记录Service

  @Pointcut("@annotation(com.lexian_life.aop.AdminControllerLog)")
  public void controllerAspect() {}

  @After("controllerAspect()")
  public void doBefore(JoinPoint joinPoint) {
    HttpServletRequest request =
        ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    try {
      // 构造数据库日志对象
      AdminLog adminLog = new AdminLog();
      adminLog.setAdminId(((Admin) request.getSession().getAttribute("admin")).getAdminId());
      adminLog.setOperate(
          (joinPoint.getTarget().getClass().getName()
              + "."
              + joinPoint.getSignature().getName()
              + "()"));
      adminLog.setContent(getControllerMethodDescription(joinPoint));
      adminLog.setTime(new Date());
      // 保存数据库
      adminLogService.save(adminLog);
    } catch (Exception e) {
      // 记录本地异常日志
      e.printStackTrace();
    }
  }

  public static String getControllerMethodDescription(JoinPoint joinPoint) throws Exception {
    String targetName = joinPoint.getTarget().getClass().getName();
    String methodName = joinPoint.getSignature().getName();
    Object[] arguments = joinPoint.getArgs();
    Class targetClass = Class.forName(targetName);
    Method[] methods = targetClass.getMethods();
    String description = "";
    for (Method method : methods) {
      if (method.getName().equals(methodName)) {
        Class[] clazzs = method.getParameterTypes();
        if (clazzs.length == arguments.length) {
          description = method.getAnnotation(AdminControllerLog.class).description();
          break;
        }
      }
    }
    return description;
  }
}
