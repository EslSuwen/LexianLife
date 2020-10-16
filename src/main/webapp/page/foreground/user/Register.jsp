<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head lang="en">
    <meta charset="UTF-8">
    <title>注册</title>
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


    <link rel="stylesheet" href="../../../AmazeUI-2.4.2/assets/css/amazeui.min.css"/>
    <link href="../../../style/foreground/dlstyle.css" rel="stylesheet" type="text/css">
    <script src="../../../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="../../../AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

</head>

<body>

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
                <li><a href="/viewOrder">我的订单</a></li>
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">我的乐鲜
                    <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="/viewOrder">待处理订单</a></li>
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
        <div class="res-banner">
            <div class="res-main">
                <div class="login-banner-bg"><span></span><img src="../../../img/images/big.jpg"/></div>
                <div class="login-box">
                    <h3 class="title">新用户注册</h3>
                    <div class="clear"
                         style="text-align: center;width:100%;color: rgb(218,70,35);">${requestScope.registerFail}</div>
                    <div class="am-tabs-bd">
                        <div class="am-tab-panel am-active">
                            <form method="post" action="/customerRegister" id="form">
                                <div class="user-email">
                                    <label for="email"><i class="am-icon-envelope-o"></i></label>
                                    <input type="email" name="email" id="email" placeholder="请输入邮箱账号">
                                </div>
                                <div class="user-phone">
                                    <label for="username"><i class="am-icon-phone"></i></label>
                                    <input type="text" name="phone" id="phone" placeholder="请输入手机号">
                                </div>
                                <div class="user-name">
                                    <label for="username"><i class="am-icon-user"></i></label>
                                    <input type="text" name="username" id="username" placeholder="用户名">
                                </div>
                                <div class="user-pass">
                                    <label for="password"><i class="am-icon-lock"></i></label>
                                    <input type="password" name="password" id="password" placeholder="设置密码">
                                </div>
                            </form>
                            <div class="login-links">
                                <label for="reader-me">
                                    <input id="reader-me" type="checkbox"> 点击表示您同意商城<a href="#">《服务协议》</a>
                                </label>
                            </div>
                            <div class="am-cf">
                                <input type="submit" name="" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl"
                                       onclick="register()">
                            </div>
                        </div>
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
<script type="text/javascript">
    function register() {
        var form = $("#form")[0];
        if (!$("#reader-me")[0].checked) {
            alert("请先阅读服务协议")
            return
        }
        form.submit()
    }
</script>
</html>
