package com.cqjtu.lexian.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/** Created by xiaoxiaobing on 17-8-3. */
@Controller
public class TestWeb {
  @RequestMapping("/test.do")
  public String test(String username, String password) {
    System.out.println(username);
    System.out.println(password);
    return "Test";
  }
}
