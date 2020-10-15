package com.cqjtu.lexian.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.Enumeration;

/**
 * WebLogAspect
 *
 * @author xiaoze
 * @date 2018/6/3
 *     <p>实现Web层的日志切面
 */
@Aspect
@Component
public class WebLogAspect {

  private ThreadLocal<Long> startTime = new ThreadLocal<>();

  /**
   * 定义一个切入点. 解释下：
   *
   * <p>~ 第一个 * 代表任意修饰符及任意返回值. ~ 第二个 * 任意包名 ~ 第三个 * 代表任意方法.
   *
   * <p>~ 第四个 * 定义在web包或者子包 ~ 第五个 * 任意方法 ~ .. 匹配任意数量的参数. execution(*
   * xiao.ze.demo.service.impl.*.*(..))
   */
  @Pointcut("execution(* com.cqjtu.lexian.controller.*..*.*(..))")
  public void webLog() {}

  @Before("webLog()")
  public void doBefore(JoinPoint joinPoint) {

    startTime.set(System.currentTimeMillis());

    // 接收到请求，记录请求内容
    System.out.println("WebLogAspect.doBefore()");
    ServletRequestAttributes attributes =
        (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();

    if (attributes != null) {
      HttpServletRequest request = attributes.getRequest();

      // 记录下请求内容
      System.out.println("--------------------------------------------------------------");
      System.out.println("URL : " + request.getRequestURL().toString());
      System.out.println("HTTP_METHOD : " + request.getMethod());
      System.out.println("IP : " + request.getRemoteAddr());
      System.out.println(
          "CLASS_METHOD : "
              + joinPoint.getSignature().getDeclaringTypeName()
              + "."
              + joinPoint.getSignature().getName());
      System.out.println("ARGS : " + Arrays.toString(joinPoint.getArgs()));

      // 获取所有参数方法一：
      Enumeration<String> enu = request.getParameterNames();
      while (enu.hasMoreElements()) {
        String paraName = enu.nextElement();
        System.out.println(paraName + ": " + request.getParameter(paraName));
      }
      System.out.println("--------------------------------------------------------------");
    }
  }

  @AfterReturning("webLog()")
  public void doAfterReturning(JoinPoint joinPoint) {

    // 处理完请求，返回内容
    System.out.println("--------------------------------------------------------------");
    System.out.println("WebLogAspect.doAfterReturning()");
    System.out.println("耗时（毫秒） : " + (System.currentTimeMillis() - startTime.get()));
    startTime.remove();
    System.out.println("--------------------------------------------------------------");
  }
}
