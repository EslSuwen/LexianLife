<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>发表评论</title>

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
    <link href="../../../style/foreground/infstyle.css" rel="stylesheet" type="text/css">
    <link href="../../../style/foreground/appstyle.css" rel="stylesheet" type="text/css">
    <script src="../../../AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="../../../AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>

    <style>
        ul {
            padding: 0;
            margin: 0;
        }

        li {
            list-style: none;
        }

        /*星星评分*/
        .scoremark {
            width: 154px;
            position: relative;
            margin-top: 0px;
        }

        .scoremark .score {
            float: right;
            display: block;
            margin: 0 0 0 10px;
            font-size: 18px;
            line-height: 22px;
            font-weight: bold;
            color: #f70;
        }

        .scoremark .star {
            float: right;
            display: block;
            position: relative;
            width: 116px;
            height: 20px;
            background: url(../../../img/stars.png) no-repeat 0px -20px;
        }

        .scoremark .ystar {
            position: absolute;
            top: 0;
            left: 0;
            width: 116px;
            height: 20px;
            background: url(../../../img/stars.png) no-repeat 0px 0px;
        }

        .scoremark .star ul {
            width: 120px;
            height: 20px;
            position: absolute;
            top: 0;
            left: 0;
        }

        .scoremark .star ul:hover {
            background: url(../../../img/stars.png) no-repeat 0px -20px;
        }

        .scoremark .star li {
            float: left;
            width: 24px;
            height: 20px;
        }

        .scoremark .star li a {
            display: block;
            width: 24px;
            height: 20px;
            overflow: hidden;
            text-indent: -9999px;
            position: absolute;
            z-index: 5;
        }

        .scoremark .star li a:hover {
            background: url(../../../img/stars.png) no-repeat 0px 0px;
            z-index: 3;
            left: 0
        }

        .scoremark .star a.one-star {
            left: 0;
        }

        .scoremark .star a.one-star:hover {
            width: 24px
        }

        .scoremark .star a.two-stars {
            left: 24px;
        }

        .scoremark .star a.two-stars:hover {
            width: 48px
        }

        .scoremark .star a.three-stars {
            left: 48px;
        }

        .scoremark .star a.three-stars:hover {
            width: 72px
        }

        .scoremark .star a.four-stars {
            left: 72px;
        }

        .scoremark .star a.four-stars:hover {
            width: 96px
        }

        .scoremark .star a.five-stars {
            left: 96px;
        }

        .scoremark .star a.five-stars:hover {
            width: 120px;
        }

        .scoremark .tips {
            position: absolute;
            top: -28px;
            left: 0;
            width: 40px;
            height: 21px;
            color: #333;
            line-height: 20px;
            padding: 0 0 5px 0;
            text-align: center;
            background: url(../../../img/starScore.png) no-repeat;
            z-index: 6;
            font-size: 12px;
        }
    </style>
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

                    <div class="user-comment">
                        <!--标题 -->
                        <div class="am-cf am-padding">
                            <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">发表评论</strong> / <small>Make&nbsp;Comments</small>
                            </div>
                        </div>
                        <hr/>
                        <div class="comment-main">
                            <c:forEach items="${requestScope.commentOrder.orderItems}" var="orderItem">
                                <c:if test="${orderItem.commented==0}">
                                    <div class="comment-list">
                                        <div class="item-pic">
                                            <a href="#" class="J_MakePoint">
                                                <img src="${orderItem.goods.img}" class="itempic">
                                            </a>
                                        </div>
                                        <div class="item-title">

                                            <div class="item-name">
                                                <a href="#">
                                                    <p class="item-basic-info">${orderItem.goods.name}</p>
                                                </a>
                                            </div>
                                            <div class="item-info">
                                                <div class="item-price">
                                                    价格：<strong>￥${orderItem.goods.unitPrice}</strong>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clear"></div>
                                        <div class="item-comment">
                                            <textarea placeholder="请写下对宝贝的感受吧，对他人帮助很大哦！"
                                                      id="content${orderItem.orderItemId}"></textarea>
                                        </div>
                                        <div class="item-opinion">
                                            <div id="scoremark" class="scoremark score">
                                        <span class="star">
      									 <span class="ystar" style="width:0%" id="stars${orderItem.orderItemId}"></span>
       									<ul>
       										<li onclick="selectStar(this,'${orderItem.orderItemId}')"><a
                                                    href="javascript:void(0)" data-name="很差" class="one-star">1</a></li>
        									<li onclick="selectStar(this,'${orderItem.orderItemId}')"><a
                                                    href="javascript:void(0)" data-name="较差"
                                                    class="two-stars">2</a></li>
       										<li onclick="selectStar(this,'${orderItem.orderItemId}')"><a
                                                    href="javascript:void(0)" data-name="一般"
                                                    class="three-stars">3</a></li>
        									<li onclick="selectStar(this,'${orderItem.orderItemId}')"><a
                                                    href="javascript:void(0)" data-name="较好"
                                                    class="four-stars">4</a></li>
        									<li onclick="selectStar(this,'${orderItem.orderItemId}')"><a
                                                    href="javascript:void(0)" data-name="很好"
                                                    class="five-stars">5</a></li>
       									</ul>
      									</span>
                                                <div style="left: 0px; display: none;" class="tips"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="info-btn">
                                        <div class="am-btn am-btn-danger"
                                             onclick="submitComment('${orderItem.orderItemId}')">发表评论
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>

                    </div>

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
                            <li class="active"><a href="UserInfo.jsp">个人信息</a></li>
                            <li><a href="Safety.jsp">安全设置</a></li>
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
    function selectStar(obj, id) {
        var pre = $(obj).prev("li")
        if ($("#stars" + id).css("width") == parseInt($(obj).text()) * 24 + "px")
            $("#stars" + id).css("width", (parseInt($(obj).text()) - 1) * 24 + "px")
        else
            $("#stars" + id).css("width", (parseInt($(obj).text())) * 24 + "px")
        while (pre.html() != undefined) {
            pre = pre.prev("li")
        }
    }

    function submitComment(id) {
        var content = $("#content" + id).val()
        var width = $("#stars" + id).css("width")
        var score = parseInt(width.substr(0, width.lastIndexOf("px"))) / 24
        var url = "/commentGoods.do"
        var data = {orderItemId: id, content: content, score: score}
        $.getJSON(url, data, function (json) {
            alert(json.msg)
        })
        window.history.go(-1);
    }
</script>
</html>
