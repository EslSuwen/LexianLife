<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>修改密码</title>


    <link rel="icon" href="../../../img/lexian.jpg" type="image/x-icon"/>
    <script type="text/javascript" src="../../../js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="../../../js/bootstrap.js"></script>
    <script type="text/javascript" src="../../../js/foreground/main.js"></script>
    <script type="text/javascript" src="../../../js/foreground/user.js"></script>
    <link rel="stylesheet" href="../../../style/foreground/user.css">
    <link rel="stylesheet" href="../../../style/bootstrap.css">
    <link rel="stylesheet" href="../../../style/foreground/main.css">


    <link href="../../../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="../../../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="../../../style/foreground/personal.css" rel="stylesheet" type="text/css">
    <link href="../../..//style/foreground/stepstyle.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../../../js/jquery-3.2.1.js"></script>
    <script src="../../../AmazeUI-2.4.2/assets/js/amazeui.js"></script>

</head>

<body>
<c:if test="${sessionScope.modifyPswFail!=null}">
    <%="<script>alert('" + session.getAttribute("modifyPswFail") + "')</script>"%>
    <%
        session.removeAttribute("modifyPswFail");
    %>
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
    <div class="navbar">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <a class="logoBox" href="/main.do">
                        <img src="../../../img/lexian.jpg" class="img-circle" style="width: 150px;height: 150px;">
                        <img src="../../../img/lexiantxt.png" class="img-rounded" style="width: 200px;"/>
                    </a>
                </div>
                <div class="col-md-5">
                    <div class="searchBox">
                        <form action="/findGoods.do" method="post">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="name">
                                    </div>
                                    <div class="col-md-3">
                                        <button type="submit" class="searchBtn">搜索</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <ul class="list-inline">
                        <c:forEach items="${sessionScope.catalogs}" begin="0" end="4" var="catalog">
                                <li>
                                    <a href="/viewCategory.do?categoryId=${catalog.categories[0].categoryId}&pageIndex=1">${catalog.categories[0].name}</a>
                                </li>
                                <li>|</li>
                            </c:forEach>
                            <li>
                                <a href="/viewCategory.do?categoryId=${catalogs[5].categories[0].categoryId}&pageIndex=1">${sessionScope.catalogs[5].categories[0].name}</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2">
                    <a href="/viewCart.do">
                        <div class="cartBox">
                            <img src="../../../img/cart.png"
                                 style="width: 32px;height: 32px;">&nbsp;&nbsp;<span>我的购物车</span>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</nav>
<article>
    <div class="container">
        <div class="center">
            <div class="col-main">
                <div class="main-wrap">

                    <div class="am-cf am-padding">
                        <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">修改密码</strong> / <small>Password</small>
                        </div>
                    </div>
                    <hr/>
                    <!--进度条-->
                    <div class="m-progress">
                        <div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">重置密码</p>
                            </span>
                            <span class="step-2 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                <p class="stage-name">完成</p>
                            </span>
                            <span class="u-progress-placeholder"></span>
                        </div>
                        <div class="u-progress-bar total-steps-2">
                            <div class="u-progress-bar-inner"></div>
                        </div>
                    </div>
                    <form class="am-form am-form-horizontal" action="/modifyPassword.do" method="post" id="form">
                        <div class="am-form-group">
                            <label for="verifyCode" class="am-form-label">邮箱验证码</label>
                            <div class="am-form-content">
                                <div class="row">
                                    <div class="col-md-8">
                                        <input type="password" id="verifyCode" placeholder="请输入邮箱收到的验证码" name="getCode">
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="am-btn am-btn-success"
                                                onclick="sendMailMsg(this,'/sendModifyPswEmail.do')">发送验证邮件
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="password" class="am-form-label">新密码</label>
                            <div class="am-form-content">
                                <input type="password" id="password" placeholder="由数字、字母组合" name="password">
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="rePassword" class="am-form-label">确认密码</label>
                            <div class="am-form-content">
                                <input type="password" id="rePassword" placeholder="请再次输入上面的密码" name="rePassword">
                            </div>
                        </div>
                        <div class="info-btn">
                            <div class="am-btn am-btn-danger" onclick="modifyPassword()">保存修改</div>
                        </div>
                    </form>

                </div>
            </div>
            <aside class="menu">
                <ul>
                    <li class="person">
                        <div class="h4">个人中心</div>
                    </li>
                    <li class="person">
                        <div class="h5">个人资料</div>
                        <ul>
                            <li><a href="UserInfo.jsp">个人信息</a></li>
                            <li class="active"><a href="Safety.jsp">安全设置</a></li>
                            <li><a href="/manageAddress.do">收货地址</a></li>
                        </ul>
                    </li>
                    <li class="person">
                        <div class="h5">我的交易</div>
                        <ul>
                            <li><a href="/viewOrder.do">订单管理</a></li>
                        </ul>
                    </li>

                    <li class="person">
                        <div class="h5">我的小窝</div>
                        <ul>
                            <li><a href="Collection.jsp">关注</a></li>
                            <li><a href="Foot.jsp">足迹</a></li>
                        </ul>
                    </li>

                </ul>

            </aside>
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
    function modifyPassword() {
        if ($("#password").val() != $("#rePassword").val()) {
            alert("两次输入的密码不一致")
            return
        }
        $("#form")[0].submit()
    }
</script>
</html>
