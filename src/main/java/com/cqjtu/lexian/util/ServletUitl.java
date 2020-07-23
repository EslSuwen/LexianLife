package com.cqjtu.lexian.util;

import javax.servlet.http.Cookie;

/** Created by dengxiaobing on 2017/9/18. */
public class ServletUitl {
  /**
   * 从一个cookie数组中获取特定名字的cookie
   *
   * @param cookies
   * @param name
   * @return
   */
  public static Cookie getCookieByName(Cookie[] cookies, String name) {
    Cookie cookie = null;
    for (int i = 0; i < cookies.length; i++) {
      if (cookies[i].getName().equals(name)) {
        cookie = cookies[i];
        break;
      }
    }
    return cookie;
  }
}
