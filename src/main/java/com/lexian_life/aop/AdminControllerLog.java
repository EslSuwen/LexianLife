package com.lexian_life.aop;

import java.lang.annotation.*;

/** @author coderWu Created in 下午3:38 17-9-26 */
@Target({ElementType.PARAMETER, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface AdminControllerLog {

  String description() default "";
}
