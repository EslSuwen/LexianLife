<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cfm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: dengxiaobing
  Date: 2017/9/23
  Time: 下午1:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="icon" href="../../../img/lexian.jpg" type="image/x-icon"/>
    <script type="text/javascript" src="../../../js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="../../../js/bootstrap.js"></script>
    <script type="text/javascript" src="../../../js/foreground/main.js"></script>
    <script type="text/javascript" src="../../../js/foreground/product.js"></script>
    <link rel="stylesheet" href="../../../style/bootstrap.css">
    <link rel="stylesheet" href="../../../style/foreground/main.css">
    <link rel="stylesheet" href="../../../style/foreground/product.css">
    <script type="text/javascript">
    </script>
    <title>支付</title>
</head>
<body>
<c:if test="${sessionScope.payFail!=null}">
    <%="<script>alert('" + session.getAttribute("payFail") + "')</script>"%>
    <%session.removeAttribute("payFail");%>
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
                        <%--<li><a href="#">我的消息</a></li>--%>
                        <li><a href="/page/foreground/user/Collection.jsp">我的关注</a></li>
                    </ul>
                </li>
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">客户服务
                    <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="/page/foreground/HelpCenter.jsp">帮助中心</a></li>
                        <%--<li><a href="#">售后服务</a></li>--%>
                        <%--<li><a href="#">在线客服</a></li>--%>
                        <li><a href="/page/foreground/PhoneHelp.jsp">电话客服</a></li>
                        <%--<li><a href="#">客服邮箱</a></li>--%>
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
                            <%-- <li><a href="/page/foreground/product/viewproduct.html">茶油</a></li>
                             <li>|</li>
                             <li><a href="#">洗面奶</a></li>
                             <li>|</li>
                             <li><a href="#">米</a></li>
                             <li>|</li>
                             <li><a href="#">枣类</a></li>
                             <li>|</li>
                             <li><a href="#">桂圆</a></li>
                             <li>|</li>
                             <li><a href="#">纯牛奶</a></li>--%>
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
        <div class="payBox">
            <div class="h3">订单支付</div>
            <div class="orderInfoBox">
                <div class="h4">订单信息</div>
                <div class="orderDetail">
                    <table class="table">
                        <tr>
                            <td style="border: none">订单号</td>
                            <td style="border: none">${sessionScope.order.orderNum}</td>
                            <td style="border: none">订单时间</td>
                            <td style="border: none"><cfm:formatDate value="${sessionScope.order.createTime}"
                                                                     pattern="yyyy-MM-dd hh:mm:ss"/></td>
                        </tr>
                        <tr>
                            <td style="border: none">应付金额</td>
                            <td style="border: none">￥${sessionScope.order.amount+logisticsFee+service_fee}</td>
                            <td style="border: none">收款单位</td>
                            <td style="border: none">乐鲜商城</td>
                        </tr>
                    </table>
                </div>
                <div class="payWay">
                    <div class="h5">选择支付方式</div>
                    <form action="#" method="post">
                        <table class="table">
                            <c:forEach items="${sessionScope.payways}" varStatus="status" step="4">
                                <tr>
                                    <td onclick="selectPayway(this)"
                                        id="${sessionScope.payways[status.index].paywayId}"><img
                                            src="${sessionScope.payways[status.index].img}">${sessionScope.payways[status.index].name}
                                    </td>
                                    <c:if test="${sessionScope.payways[status.index+1]!=null}">
                                        <td onclick="selectPayway(this)"
                                            id="${sessionScope.payways[status.index+1].paywayId}"><img
                                                src="${sessionScope.payways[status.index+1].img}">${sessionScope.payways[status.index+1].name}
                                        </td>
                                    </c:if>
                                    <c:if test="${sessionScope.payways[status.index+2]!=null}">
                                        <td onclick="selectPayway(this)"
                                            id="${sessionScope.payways[status.index+2].paywayId}"><img
                                                src="${sessionScope.payways[status.index+2].img}">${sessionScope.payways[status.index+2].name}
                                        </td>
                                    </c:if>
                                    <c:if test="${sessionScope.payways[status.index+3]!=null}">
                                        <td onclick="selectPayway(this)"
                                            id="${sessionScope.payways[status.index+3].paywayId}"><img
                                                src="${sessionScope.payways[status.index+3].img}">${sessionScope.payways[status.index+3].name}
                                        </td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </table>
                        <a href="/pay.do">
                            <button class="submtPayBtn pull-right" type="button">前往支付</button>
                        </a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</article>
<footer>
    <div class="container">
        <div class="footer-content">
            <a href="#">关于我们</a> | <a href="#">网站声明</a>
            <p>版权所有 © 2008-2017 中南大学软件学院&nbsp;&nbsp;&nbsp;&nbsp;Benson科技工作室</p>
            <p>京ICP备15003716号-3 | 京ICP证150437号</p>
        </div>
    </div>
</footer>
</body>
<script>
    function selectPayway(obj) {
        var url = "/selectPayway.do"
        var data = {paywayId: $(obj).attr("id")}
        $.getJSON(url, data, function (json) {
            if (json.result) {
                $(obj).parent().parent().find("td").each(function () {
                    $(this).attr("style", "")
                })
                $(obj).attr("style", "border-radius: 5px;border-style: solid;border-width: 1px;border-color: grey;")
            }
        })
    }
</script>
</html>
