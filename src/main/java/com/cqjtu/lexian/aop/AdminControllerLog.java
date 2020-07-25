package com.cqjtu.lexian.aop;

import java.lang.annotation.*;

/**
 * AdminControllerLog
 *
 * @author suwen
 */
@Target({ElementType.PARAMETER, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface AdminControllerLog {

  String description() default "";
}
