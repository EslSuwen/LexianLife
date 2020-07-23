<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dengxiaobing
  Date: 2017/9/18
  Time: 下午2:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head lang="en">
    <meta charset="UTF-8">
    <title>登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <script src="../../../js/jquery-3.2.1.js"></script>
    <script src="../../../js/foreground/user.js"></script>

    <link rel="icon" href="../../../img/lexian.jpg" type="image/x-icon"/>
    <script type="text/javascript" src="../../../js/foreground/user.js"></script>
    <link rel="stylesheet" href="../../../style/foreground/user.css">
    <link rel="stylesheet" href="../../../style/bootstrap.css">
    <link rel="stylesheet" href="../../../style/foreground/main.css">


    <link rel="stylesheet" href="../../../AmazeUI-2.4.2/assets/css/amazeui.css"/>
    <link href="../../../style/foreground/dlstyle.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        function login() {
            $("#rempsw")[0].checked = $("#rempsw1")[0].checked
            $("#auto-login")[0].checked = $("#auto-login1")[0].checked
            $("#form")[0].submit();
        }
    </script>
</head>

<body>
<c:if test="${requestScope.loginFail!=null}">
    <%="<script>alert('" + request.getAttribute("loginFail") + "')</script>"%>
    <%request.removeAttribute("loginFail");%>
</c:if>
<header>
    <div class="topBox">
        <div class="pull-right">
            <ul class="topList">
                <li>
                    <c:if test="${sessionScope.customer==null}">
                        <a href="/page/foreground/user/Login.jsp">登录</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/page/foreground/user/Register.jsp">注册</a>
                    </c:if>
                    <c:if test="${sessionScope.customer!=null}">
                        欢迎,<a href="/page/foreground/user/UserCenter.jsp">${sessionScope.customer.username}</a>
                    </c:if>
                </li>
                <li><a href="/viewOrder.do">我的订单</a></li>
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">我的乐鲜
                    <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="/viewOrder.do">待处理订单</a></li>
                        <li><a href="/page/foreground/user/Collection.jsp">我的关注</a></li>
                    </ul>
                </li>
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">客户服务
                    <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="/page/foreground/HelpCenter.jsp">帮助中心</a></li>
                        <li><a href="/page/foreground/PhoneHelp.jsp">电话客服</a></li>
                    </ul>
                </li>
                <li style="width:50px;"></li>
            </ul>
        </div>
    </div>
</header>
<nav>
    <br><br><br><br><br><br>
</nav>
<article>
    <div class="container">
        <div class="login-banner">
            <div class="login-main">
                <div class="login-banner-bg"><span></span><img src="../../../img/images/big.jpg"/></div>
                <div class="login-box">
                    <h3 class="title">登录商城</h3>
                    <div class="clear"></div>
                    <form action="/customerLogin.do" method="post" id="form">
                        <div class="user-name">
                            <label for="username"><i class="am-icon-user"></i></label>
                            <input type="text" name="username" id="username" placeholder="用户名"
                                   value="${sessionScope.username}">
                        </div>
                        <p style="color: rgb(218,70,35);font-size: 10px;">${requestScope.usernameWrong}&nbsp;</p>
                        <div class="user-pass">
                            <label for="password"><i class="am-icon-lock"></i></label>
                            <input type="password" name="password" id="password" placeholder="请输入密码"
                                   value="${sessionScope.password}">
                        </div>
                        <p style="color: rgb(218,70,35);font-size: 10px;">${requestScope.passwordWrong}&nbsp;</p>
                        <div class="verification">
                            <label for="verification"><i class="am-icon-terminal"></i></label>
                            <input type="text" name="verification" id="verification" placeholder="请输入验证码(区分大小写)">
                        </div>
                        <img src="/valicode.do" id="valicodeImg" onclick="changeviliCodeImg()">
                        <p style="color: rgb(218,70,35);font-size: 10px;">${requestScope.verifyWrong}&nbsp;</p>
                        <input type="checkbox" name="rempsw" id="rempsw" hidden value="1">
                        <input type="checkbox" name="autoLogin" id="auto-login" hidden value="1">
                    </form>
                    <div class="login-links">
                        <label for="rempsw1"><input id="rempsw1" type="checkbox"
                                                    <c:if test="${'true'==sessionScope.remPsw}">checked</c:if>>记住密码</label>
                        <label for="auto-login" class="am-fr"><input id="auto-login1" type="checkbox"
                                                                     <c:if test="${'true'==sessionScope.autoLogin}">checked</c:if>>自动登录</label>
                        <br/>
                    </div>
                    <div class="login-links">
                        <a href="javascript:void(0)" class="am-fl" onclick="forgetPassword()">忘记密码</a>
                        <a href="/page/foreground/user/Register.jsp" class="am-fr">注册</a>
                        <br/>
                    </div>
                    <div class="am-cf">
                        <input type="submit" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm"
                               onclick="login()">
                    </div>
                </div>
            </div>
        </div>
    </div>
</article>
<footer>
    <div class="container">
        <div class="footer-content">
            <a href="#">关于我们</a> | <a href="#">网站声明</a>
            <p>版权所有 ©2020</p>
            <p><b>重庆交通大学</b>信息科学与工程学院</p>
        </div>
    </div>
</footer>
</body>
<script>
    function forgetPassword() {
        if (confirm("确认向邮箱发送密码?")) {
            var url = "/forgetPassword.do"
            var data = {username: $("#username").val()}
            $.getJSON(url, data, function (json) {
                alert(json.msg)
            })
        }
    }
</script>
</html>
