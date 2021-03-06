<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script type="text/javascript" src="../../../js/foreground/user.js"></script>
    <link rel="stylesheet" href="../../../style/foreground/user.css">
    <link rel="stylesheet" href="../../../style/bootstrap.css">
    <link rel="stylesheet" href="../../../style/foreground/main.css">

    <link rel="stylesheet" href="../../../AmazeUI-2.4.2/assets/css/admin.css" type="text/css">
    <link rel="stylesheet" href="../../../AmazeUI-2.4.2/assets/css/amazeui.css" type="text/css">
    <link rel="stylesheet" href="../../../style/foreground/personal.css" type="text/css">
    <link rel="stylesheet" href="../../../style/foreground/systyle.css" type="text/css">
    <title>用户中心</title>
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
    <div class="navbar">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <a class="logoBox" href="/main">
                        <img src="../../../img/lexian.jpg" class="img-circle" style="width: 150px;height: 150px;">
                        <img src="../../../img/lexiantxt.png" class="img-rounded" style="width: 200px;"/>
                    </a>
                </div>
                <div class="col-md-5">
                    <div class="searchBox">
                        <form action="/findGoods" method="post">
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
                                    <a href="/viewCategory?categoryId=${catalog.categories[0].categoryId}&pageIndex=1">${catalog.categories[0].name}</a>
                                </li>
                                <li>|</li>
                            </c:forEach>
                            <li>
                                <a href="/viewCategory?categoryId=${catalogs[5].categories[0].categoryId}&pageIndex=1">${sessionScope.catalogs[5].categories[0].name}</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2">
                    <a href="/viewCart">
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
                    <div class="wrap-left">
                        <div class="wrap-list">
                            <div class="m-user">
                                <!--个人信息 -->
                                <div class="m-bg"></div>
                                <div class="m-userinfo">
                                    <div class="m-baseinfo">
                                        <a href="UserInfo.jsp">
                                            <img class="am-circle am-img-thumbnail" alt="" id="headImg"
                                                    <c:if test="${sessionScope.customer.headImg==null}">
                                                        src="../../../img/images/getAvatar.jpg"
                                                    </c:if>
                                                    <c:if test="${sessionScope.customer.headImg!=null}">
                                                        src="${sessionScope.customer.headImg}"</c:if>
                                            />
                                        </a>
                                        <a class="s-name" href="UserInfo.jsp">${sessionScope.customer.nickname}</a>
                                    </div>
                                    <div class="m-right">
                                        <div class="m-new">
                                            <a href="/logout"><i class="am-icon-bell-o"></i>退出登录</a>
                                        </div>
                                        <div class="m-address">
                                            <a href="/manageAddress" class="i-trigger">我的收货地址</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!--订单 -->
                            <div class="m-order">
                                <div class="s-bar">
                                    <i class="s-icon"></i>我的订单
                                    <a class="i-load-more-item-shadow" href="/viewOrder">全部订单</a>
                                </div>
                                <ul>
                                    <li><a href="/viewOrder"><i><img src="../../../img/images/pay.png"/></i><span>待付款<em
                                            class="m-num" id="waitpaynum"></em></span></a></li>
                                    <li><a href="/viewOrder"><i><img src="../../../img/images/send.png"/></i><span>待发货<em
                                            class="m-num" id="waitsendnum">1</em></span></a></li>
                                    <li><a href="/viewOrder"><i><img
                                            src="../../../img/images/receive.png"/></i><span>待收货<em class="m-num"
                                                                                                    id="waitrecnum"></em></span></a>
                                    </li>
                                    <li><a href="/viewOrder"><i><img
                                            src="../../../img/images/comment.png"/></i><span>待评价<em class="m-num"
                                                                                                    id="waitcommnum">3</em></span></a>
                                    </li>
                                </ul>
                            </div>

                            <!--收藏夹 -->
                            <div class="you-like">
                                <div class="s-bar">我的收藏
                                </div>
                                <div class="s-content" id="attBox">

                                </div>

                                <div class="s-more-btn i-load-more-item" data-screen="0" onclick="getAttention()"><i
                                        class="am-icon-refresh am-icon-fw"></i>更多
                                </div>

                            </div>

                        </div>
                    </div>
                    <div class="wrap-right">

                        <!-- 日历-->
                        <div class="day-list">
                            <div class="s-bar">
                                我的日历
                            </div>
                            <div class="s-care s-care-noweather">
                                <div class="s-date">
                                    <em id="day">21</em>
                                    <span id="week">星期一</span>
                                    <span id="time">2015.12</span>
                                </div>
                            </div>
                        </div>
                        <!--新品 -->


                        <!--热卖推荐 -->
                        <div class="new-goods" id="wellSaleBox">
                            <div class="s-bar">
                                <i class="s-icon"></i>热卖推荐
                            </div>
                        </div>

                    </div>
                </div>

            </div>
            <aside class="menu">
                <ul>
                    <li class="person active">
                        <div class="h4">个人中心</div>
                    </li>
                    <li class="person">
                        <div class="h5">个人资料</div>
                        <ul>
                            <li><a href="UserInfo.jsp">个人信息</a></li>
                            <li><a href="Safety.jsp">安全设置</a></li>
                            <li><a href="/manageAddress">收货地址</a></li>
                        </ul>
                    </li>
                    <li class="person">
                        <div class="h5">我的交易</div>
                        <ul>
                            <li><a href="/viewOrder">订单管理</a></li>
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
<script type="text/javascript">
    var weeks = ["日", "一", "二", "三", "四", "五", "六"]
    var now = new Date();
    $("#day").text(now.getDate())
    $("#week").text("星期" + weeks[now.getDay()])
    $("#time").text(now.getFullYear() + "." + (now.getMonth() + 1))
    $(document).ready(function () {
        var url = "/queryOrderCount"
        $.getJSON(url, function (json) {
            $("#waitpaynum").text(json.waitpaynum)
            $("#waitsendnum").text(json.waitsendnum)
            $("#waitrecnum").text(json.waitrecnum)
            $("#waitcommnum").text(json.waitcommnum)
        })
        getAttention()
        loadWellSale()
    })

    function getAttention() {
        var url = "/getAttentions";
        var data = {pageIndex: $("#attBox").children().length / 12 + 1}
        $.getJSON(url, data, function (json) {
            $.each(json, function (n, item) {
                var obj = "<div class='s-item-wrap'><div class='s-item'> <div class='s-pic'><a href='/viewGoods?goods_id=" + item.goods_id + "' class='s-pic-link'> <img src='../" + item.img + "' alt='" + item.name + "' title='" + item.name + "' class='s-pic-img s-guess-item-img'> </a> </div> <div class='s-price-box'> <span class='s-price'><em class='s-price-sign'>¥</em><em class='s-value'>" + item.unitPrice + "</em></span> </div> <div class='s-title'><a href='/viewGoods?goods_id=" + item.goods_id + "' title='" + item.name + "'>" + item.name + "</a></div> <div class='s-extra-box'> </div> </div> </div>"
                $("#attBox").append(obj)
            })
        })
    }

    function loadWellSale() {
        var url = "/queryWellSale"
        $.getJSON(url, function (array) {
            $.each(array, function (i, obj) {
                var goodsInfo = "<div class='new-goods-info'> <a class='shop-info' href='/viewGoods?goods_id=" + obj.goods_id + "'> <div > <img src='../" + obj.img + "' alt='" + obj.name + "'> </div> <span class='one-hot-goods'>￥" + obj.unitPrice + "</span> </a> </div>"
                $("#wellSaleBox").append(goodsInfo)
            })
        })
    }
</script>
</html>
