<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <link rel="icon" href="../../img/lexian.jpg" type="image/x-icon"/>
    <script type="text/javascript" src="../../js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="../../js/bootstrap.js"></script>
    <script type="text/javascript" src="../../js/foreground/main.js"></script>
    <link rel="stylesheet" href="../../style/bootstrap.css">
    <link rel="stylesheet" href="../../style/foreground/main.css">

    <link href="../../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css"/>
    <link href="../../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css"/>
    <link href="../../style/foreground/hmstyle.css" rel="stylesheet" type="text/css"/>
    <link href="../../style/foreground/demo.css" rel="stylesheet" type="text/css"/>
    <script src="../../AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
    <title>主页</title>
</head>
<body>
<header>
    <div class="topBox">
        <div class="pull-right">
            <ul class="topList">
                <li><a href="/admin/index" class="am-center">管理员</a>
                <li>
                    <c:if test="${sessionScope.customer==null}">
                        <a href="../../page/foreground/user/Login.jsp">登录</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/page/foreground/user/Register.jsp">注册</a>
                    </c:if>
                    <c:if test="${sessionScope.customer!=null}">
                        欢迎,<a href="../../page/foreground/user/UserCenter.jsp">${sessionScope.customer.username}</a>
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
                        <img src="../../img/lexian.jpg" class="img-circle" style="width: 150px;height: 150px;">
                        <img src="../../img/lexiantxt.png" class="img-rounded" style="width: 200px;"/>
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
                            <img src="../../img/cart.png"
                                 style="width: 32px;height: 32px;">&nbsp;&nbsp;<span>我的购物车</span>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</nav>
<article>
    <div class="hmtop">
        <div class="banner">
            <!--轮播 -->
            <div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
                <ul class="am-slides">
                    <li class="banner1"><a href="Error.jsp"><img src="../../img/banner/ad1.jpg"
                                                                 alt="ad1"/></a></li>
                    <li class="banner2"><a href="Error.jsp"><img src="../../img/banner/ad2.jpg"
                                                                 alt="ad2"/></a></li>
                    <li class="banner3"><a href="Error.jsp"><img src="../../img/banner/ad3.jpg"
                                                                 alt="ad3"/></a></li>
                    <li class="banner4"><a href="Error.jsp"><img src="../../img/banner/ad4.jpg"
                                                                 alt="ad4"/></a></li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <div class="shopNav">
            <div class="slideall">
                <div id="nav" class="navfull">
                    <div class="area">
                        <div class="category-content" id="guide_2">

                            <div class="category">
                                <ul class="category-list" id="js_climit_li">
                                    <c:forEach var="catalog" items="${sessionScope.catalogs}">
                                        <li class="appliance js_toggle relative first">
                                            <div class="category-info">
                                                <h3 class="category-name b-category-name"><a class="ml-22"
                                                                                             title="${catalog.name}"
                                                                                             href="#f${catalog.catalog_id}"><i><img
                                                        src="${catalog.img}"></i>${catalog.name}</a></h3>
                                                <em>&gt;</em></div>
                                            <div class="menu-item menu-in top">
                                                <div class="area-in">
                                                    <div class="area-bg">
                                                        <div class="menu-srot">
                                                            <div class="sort-side">
                                                                <dt><span title="${catalog.name}">${catalog.name}</span>
                                                                </dt>
                                                                <dl class="dl-sort">
                                                                    <c:forEach items="${catalog.categories}"
                                                                               var="category">
                                                                        <dd><a title="${category.name}"
                                                                               href="/viewCategory?categoryId=${category.categoryId}&pageIndex=1"><span>${category.name}</span></a>
                                                                        </dd>
                                                                    </c:forEach>
                                                                </dl>
                                                            </div>
                                                            <div class="brand-side">
                                                                <c:forEach items="${catalog.categories[0].goods}"
                                                                           var="goods">
                                                                    <a href="/viewGoods?goods_id=${goods.goodsId}"><img
                                                                            src="${goods.img}"
                                                                            style="width: 100px;height: 100px;"></a>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <b class="arrow"></b>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--轮播-->

        <script type="text/javascript">
            (function () {
                $('.am-slider').flexslider();
            });
            $(document).ready(function () {
                $("li").hover(function () {
                    $(".category-content .category-list li.first .menu-in").css("display", "none");
                    $(".category-content .category-list li.first").removeClass("hover");
                    $(this).addClass("hover");
                    $(this).children("div.menu-in").css("display", "block")
                }, function () {
                    $(this).removeClass("hover")
                    $(this).children("div.menu-in").css("display", "none")
                });
            })
        </script>

        <script type="text/javascript">
            if ($(window).width() < 640) {
                function autoScroll(obj) {
                    $(obj).find("ul").animate({
                        marginTop: "-39px"
                    }, 500, function () {
                        $(this).css({
                            marginTop: "0px"
                        }).find("li:first").appendTo(this);
                    })
                }

                $(function () {
                    setInterval('autoScroll(".demo")', 3000);
                })
            }
        </script>
    </div>
    <div class="shopMainbg">
        <div class="shopMain" id="shopmain">
            <div class="clear "></div>
            <c:forEach var="catalog" items="${sessionScope.catalogs}">
                <div id="f${catalog.catalog_id}">
                    <div class="am-container ">
                        <div class="shopTitle ">
                            <h4>${catalog.name}</h4>
                            <h3>${catalog.des}</h3>
                            <div class="today-brands ">
                                <c:if test="${catalog.categories.size()>6}">
                                    <a href="/viewCategory?categoryId=${catalog.categories[0].categoryId}&pageIndex=1">${catalog.categories[0].name}</a>
                                    <a href="/viewCategory?categoryId=${catalog.categories[1].categoryId}&pageIndex=1">${catalog.categories[1].name}</a>
                                    <a href="/viewCategory?categoryId=${catalog.categories[2].categoryId}&pageIndex=1">${catalog.categories[2].name} </a>
                                    <a href="/viewCategory?categoryId=${catalog.categories[3].categoryId}&pageIndex=1">${catalog.categories[3].name}</a>
                                    <a href="/viewCategory?categoryId=${catalog.categories[4].categoryId}&pageIndex=1">${catalog.categories[4].name}</a>
                                    <a href="/viewCategory?categoryId=${catalog.categories[5].categoryId}&pageIndex=1">${catalog.categories[5].name}</a>
                                </c:if>
                                <c:if test="${catalog.categories.size()<=6}">
                                    <c:forEach var="category" items="${catalog.categories}">
                                        <a href="/viewCategory?categoryId=${category.categoryId}&pageIndex=1">${category.name}</a>
                                    </c:forEach>
                                </c:if>
                            </div>
                            <span class="more ">
                    <a href="#">更多<i class="am-icon-angle-right" style="padding-left:10px ;"></i></a>
                        </span>
                        </div>
                    </div>
                    <div class="am-g am-g-fixed floodThree ">
                        <div class="am-u-sm-4 text-four list">
                            <div class="word">
                                <c:if test="${catalog.categories.size()<6}">
                                    <c:forEach var="category" items="${catalog.categories}">
                                        <a class="outer"
                                           href="/viewCategory?categoryId=${category.categoryId}&pageIndex=1"><span
                                                class="inner"><b class="text">${category.name}</b></span></a>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${catalog.categories.size()>=6}">
                                    <a class="outer"
                                       href="/viewCategory?categoryId=${catalog.categories[0].categoryId}&pageIndex=1"><span
                                            class="inner"><b class="text">${catalog.categories[0].name}</b></span></a>
                                    <a class="outer"
                                       href="/viewCategory?categoryId=${catalog.categories[1].categoryId}&pageIndex=1"><span
                                            class="inner"><b class="text">${catalog.categories[1].name}</b></span></a>
                                    <a class="outer"
                                       href="/viewCategory?categoryId=${catalog.categories[2].categoryId}&pageIndex=1"><span
                                            class="inner"><b class="text">${catalog.categories[2].name}</b></span></a>
                                    <a class="outer"
                                       href="/viewCategory?categoryId=${catalog.categories[3].categoryId}&pageIndex=1"><span
                                            class="inner"><b class="text">${catalog.categories[3].name}</b></span></a>
                                    <a class="outer"
                                       href="/viewCategory?categoryId=${catalog.categories[4].categoryId}&pageIndex=1"><span
                                            class="inner"><b class="text">${catalog.categories[4].name}</b></span></a>
                                    <a class="outer"
                                       href="/viewCategory?categoryId=${catalog.categories[5].categoryId}&pageIndex=1"><span
                                            class="inner"><b class="text">${catalog.categories[5].name}</b></span></a>
                                </c:if>
                            </div>
                            <a href="/viewGoods?goods_id=${catalog.categories[0].goods[0].goodsId}">
                                <img src="${catalog.categories[0].goods[0].img}"/>
                                <div class="outer-con ">
                                    <div class="title ">
                                            ${catalog.categories[0].goods[0].name}
                                    </div>
                                </div>
                            </a>
                            <div class="triangle-topright"></div>
                        </div>
                        <div class="am-u-sm-4 text-four">
                            <a href="/viewGoods?goods_id=${catalog.categories[1].goods[0].goodsId}">
                                <<img src="${catalog.categories[1].goods[0].img}"/>
                                <div class="outer-con ">
                                    <div class="title ">
                                            ${catalog.categories[1].goods[0].name}
                                    </div>
                                    <div class="sub-title ">
                                        ¥${catalog.categories[1].goods[0].unitPrice}
                                    </div>
                                    <i class="am-icon-shopping-basket am-icon-md  seprate"></i>
                                </div>
                            </a>
                        </div>
                        <div class="am-u-sm-4 text-four sug">
                            <a href="/viewGoods?goods_id=${catalog.categories[4].goods[0].goodsId}">
                                <img src="${catalog.categories[4].goods[0].img}"/>
                                <div class="outer-con ">
                                    <div class="title ">
                                            ${catalog.categories[4].goods[0].name}
                                    </div>
                                    <div class="sub-title ">
                                        ¥${catalog.categories[4].goods[0].unitPrice}
                                    </div>
                                    <i class="am-icon-shopping-basket am-icon-md  seprate"></i>
                                </div>
                            </a>
                        </div>
                        <div class="am-u-sm-6 am-u-md-3 text-five big ">
                            <a href="/viewGoods?goods_id=${catalog.categories[2].goods[0].goodsId}">
                                <img src="${catalog.categories[2].goods[0].img}"/>
                                <div class="outer-con ">
                                    <div class="title ">
                                            ${catalog.categories[2].goods[0].name}
                                    </div>
                                    <div class="sub-title ">
                                        ￥${catalog.categories[2].goods[0].unitPrice}
                                    </div>
                                    <i class="am-icon-shopping-basket am-icon-md  seprate"></i>
                                </div>
                            </a>
                        </div>
                        <div class="am-u-sm-6 am-u-md-3 text-five ">
                            <a href="/viewGoods?goods_id=${catalog.categories[3].goods[0].goodsId}">
                                <img src="${catalog.categories[3].goods[0].img}"/>
                                <div class="outer-con ">
                                    <div class="title ">
                                            ${catalog.categories[3].goods[0].name}
                                    </div>
                                    <div class="sub-title ">
                                        ¥${catalog.categories[3].goods[0].unitPrice}
                                    </div>
                                    <i class="am-icon-shopping-basket am-icon-md  seprate"></i>
                                </div>
                            </a>
                        </div>
                        <div class="am-u-sm-6 am-u-md-3 text-five sug">
                            <a href="/viewGoods?goods_id=${catalog.categories[5].goods[0].goodsId}">
                                <img src="${catalog.categories[5].goods[0].img}"/>
                                <div class="outer-con ">
                                    <div class="title ">
                                            ${catalog.categories[5].goods[0].name}
                                    </div>
                                    <div class="sub-title ">
                                        ¥${catalog.categories[5].goods[0].unitPrice}
                                    </div>
                                    <i class="am-icon-shopping-basket am-icon-md  seprate"></i>
                                </div>
                            </a>
                        </div>
                        <div class="am-u-sm-6 am-u-md-3 text-five big">
                            <a href="/viewGoods?goods_id=${catalog.categories[6].goods[0].goodsId}">
                                <img src="${catalog.categories[6].goods[0].img}"/>
                                <div class="outer-con ">
                                    <div class="title ">
                                            ${catalog.categories[6].goods[0].name}
                                    </div>
                                    <div class="sub-title ">
                                        ¥${catalog.categories[6].goods[0].unitPrice}
                                    </div>
                                    <i class="am-icon-shopping-basket am-icon-md  seprate"></i>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="clear "></div>
                </div>
            </c:forEach>

        </div>
    </div>
    <!--菜单 -->
    <div class=tip>
        <div id="sidebar">
            <div id="wrap">
                <c:if test="${sessionScope.customer!=null}">
                    <div id="prof" class="item ">
                        <a href="# ">
                            <span class="setting "></span>
                        </a>
                        <div class="ibar_login_box status_login ">
                            <div class="avatar_box ">
                                <p class="avatar_imgbox "><img
                                        <c:if test="${sessionScope.customer.headImg==null}">
                                            src="../../../img/images/getAvatar.jpg"
                                        </c:if>
                                        <c:if test="${sessionScope.customer.headImg!=null}">
                                            src="${sessionScope.customer.headImg}"</c:if>
                                /></p>
                                <ul class="user_info ">
                                    <li>${sessionScope.customer.nickname}</li>
                                </ul>
                            </div>
                            <div class="login_btnbox ">
                                <c:if test="${sessionScope.customer==null}">
                                    <a href="# " class="login_order ">我的订单</a>
                                    <a href="# " class="login_favorite ">我的收藏</a>
                                </c:if>
                                <c:if test="${sessionScope.customer!=null}">
                                    <a href="/viewOrder" class="login_order ">我的订单</a>
                                    <a href="/page/foreground/user/Collection.jsp" class="login_favorite ">我的收藏</a>
                                </c:if>
                            </div>
                            <i class="icon_arrow_white "></i>
                        </div>

                    </div>
                </c:if>
                <div id="shopCart " class="item ">
                    <c:if test="${sessionScope.customer==null}">
                        <a href="user/Login.jsp">
                            <span class="message "></span>
                        </a>
                        <p>
                            购物车
                        </p>
                        <p class="cart_num ">0</p>
                    </c:if>
                    <c:if test="${sessionScope.customer!=null}">
                        <a href="/viewCart">
                            <span class="message "></span>
                        </a>
                        <p>
                            购物车
                        </p>
                        <p class="cart_num ">${sessionScope.cart.cartItems.size()}</p>
                    </c:if>
                </div>
                <div id="asset " class="item ">
                    <c:if test="${sessionScope.customer==null}">
                        <a href="user/Login.jsp">
                            <span class="view "></span>
                        </a>
                        <div class="mp_tooltip ">
                            我的购物
                            <i class="icon_arrow_right_black "></i>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.customer!=null}">
                        <a href="/viewOrder">
                            <span class="view "></span>
                        </a>
                        <div class="mp_tooltip ">
                            我的购物
                            <i class="icon_arrow_right_black "></i>
                        </div>
                    </c:if>
                </div>

                <div id="foot " class="item ">
                    <c:if test="${sessionScope.customer==null}">
                        <a href="#">
                            <span class="zuji "></span>
                        </a>
                        <div class="mp_tooltip ">
                            我的足迹
                            <i class="icon_arrow_right_black "></i>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.customer!=null}">
                        <a href="/page/foreground/user/Foot.jsp">
                            <span class="zuji "></span>
                        </a>
                        <div class="mp_tooltip ">
                            我的足迹
                            <i class="icon_arrow_right_black "></i>
                        </div>
                    </c:if>
                </div>

                <div id="brand " class="item ">
                    <c:if test="${sessionScope.customer==null}">
                        <a href="#">
                            <span class="wdsc "><img src="../../img/images/wdsc.png "/></span>
                        </a>
                        <div class="mp_tooltip ">
                            我的收藏
                            <i class="icon_arrow_right_black "></i>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.customer!=null}">
                        <a href="/page/foreground/user/Collection.jsp">
                            <span class="wdsc "><img src="../../img/images/wdsc.png "/></span>
                        </a>
                        <div class="mp_tooltip ">
                            我的收藏
                            <i class="icon_arrow_right_black "></i>
                        </div>
                    </c:if>
                </div>

                <div class="quick_toggle ">
                    <li class="qtitem ">
                        <a href="/page/foreground/HelpCenter.jsp"><span class="kfzx "></span></a>
                        <div class="mp_tooltip ">客服中心<i class="icon_arrow_right_black "></i></div>
                    </li>
                    <li class="qtitem ">
                        <a href="#top " class="return_top "><span class="top "></span></a>
                    </li>
                </div>
                <!--回到顶部 -->
                <div id="quick_links_pop " class="quick_links_pop hide "></div>

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
<script type="text/javascript " src="../../js/foreground/quick_links.js "></script>
</html>
