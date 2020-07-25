package com.cqjtu.lexian.util;

import javax.servlet.http.Cookie;

/**
 * ServletUtil
 *
 * @author suwen
 */
public class ServletUtil {
  /**
   * 从一个cookie数组中获取特定名字的cookie
   *
   * @param cookies cookies
   * @param name cookie name
   * @return cookies
   */
  public static Cookie getCookieByName(Cookie[] cookies, String name) {
    Cookie cookie = null;
    for (Cookie value : cookies) {
      if (value.getName().equals(name)) {
        return value;
      }
    }
    return null;
  }
}
