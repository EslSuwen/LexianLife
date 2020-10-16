<%@ page import="java.util.List" %>
<%@ page import="com.cqjtu.lexian.domain.Order" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cfm" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <link href="../../..//AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="../../../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="../../../style/foreground/personal.css" rel="stylesheet" type="text/css">
    <link href="../../../style/foreground/orstyle.css" rel="stylesheet" type="text/css">
    <script src="../../../AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    <title>订单管理</title>
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

                    <div class="user-order">

                        <!--标题 -->
                        <div class="am-cf am-padding">
                            <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small>
                            </div>
                        </div>
                        <hr/>

                        <div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

                            <ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
                                <li class="am-active"><a href="#tab1">已完成</a></li>
                                <li><a href="#tab2">待付款</a></li>
                                <li><a href="#tab3">待发货</a></li>
                                <li><a href="#tab4">待收货</a></li>
                                <li><a href="#tab5">待评价</a></li>
                            </ul>

                            <div class="am-tabs-bd">
                                <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                                    <div class="order-top">
                                        <div class="th th-item">
                                            <td class="td-inner">商品</td>
                                        </div>
                                        <div class="th th-price">
                                            <td class="td-inner">单价</td>
                                        </div>
                                        <div class="th th-number">
                                            <td class="td-inner">数量</td>
                                        </div>
                                        <div class="th th-operation">
                                            <td class="td-inner">商品操作</td>
                                        </div>
                                        <div class="th th-amount">
                                            <td class="td-inner">合计</td>
                                        </div>
                                        <div class="th th-status">
                                            <td class="td-inner">交易状态</td>
                                        </div>
                                        <div class="th th-change">
                                            <td class="td-inner">交易操作</td>
                                        </div>
                                    </div>

                                    <div class="order-main">
                                        <div class="order-list">

                                            <!--交易成功-->
                                            <c:forEach items="${requestScope.finishedOrders}" var="order">
                                                <div class="order-status0" id="${order.orderId}">
                                                    <div class="order-title">
                                                        <div class="dd-num">订单编号：<a
                                                                href="javascript:;">${order.orderNum}</a></div>
                                                        <span>成交时间：<cfm:formatDate value="${order.payTime}"
                                                                                   pattern="yyyy-MM-dd"/></span>
                                                        <!--    <em>店铺：小桔灯</em>-->
                                                    </div>
                                                    <div class="order-content">
                                                        <div class="order-left">
                                                            <c:forEach items="${order.orderItems}" var="orderItem">
                                                                <ul class="item-list">
                                                                    <li class="td td-item">
                                                                        <div class="item-pic">
                                                                            <a href="/viewGoods?goods_id=${orderItem.goods.goodsId}"
                                                                               class="J_MakePoint">
                                                                                <img src="${orderItem.goods.img}"
                                                                                     class="itempic J_ItemImg">
                                                                            </a>
                                                                        </div>
                                                                        <div class="item-info">
                                                                            <div class="item-basic-info">
                                                                                <a href="/viewGoods?goods_id=${orderItem.goods.goodsId}">
                                                                                    <p>${orderItem.goods.name}</p>
                                                                                </a>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li class="td td-price">
                                                                        <div class="item-price">
                                                                            ￥${orderItem.goods.unitPrice}
                                                                        </div>
                                                                    </li>
                                                                    <li class="td td-number">
                                                                        <div class="item-number">
                                                                            <span>×</span>${orderItem.num}
                                                                        </div>
                                                                    </li>
                                                                    <li class="td td-operation">
                                                                        <div class="item-operation">

                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </c:forEach>
                                                        </div>
                                                        <div class="order-right">
                                                            <li class="td td-amount">
                                                                <div class="item-amount">
                                                                    合计：${order.logisticsFee+order.serviceFee+order.amount}
                                                                    <p>含运费：<span>${order.logisticsFee}</span></p>
                                                                </div>
                                                            </li>
                                                            <div class="move-right">
                                                                <li class="td td-status">
                                                                    <div class="item-status">
                                                                        <p class="Mystatus">交易完成</p>
                                                                    </div>
                                                                </li>
                                                                <li class="td td-change">
                                                                    <div class="am-btn am-btn-danger anniu"
                                                                         onclick="deleteOrder(${order.orderId})">
                                                                        删除订单
                                                                    </div>
                                                                </li>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>

                                        </div>

                                    </div>

                                </div>
                                <div class="am-tab-panel am-fade" id="tab2">
                                    <div class="order-top">
                                        <div class="th th-item">
                                            <td class="td-inner">商品</td>
                                        </div>
                                        <div class="th th-price">
                                            <td class="td-inner">单价</td>
                                        </div>
                                        <div class="th th-number">
                                            <td class="td-inner">数量</td>
                                        </div>
                                        <div class="th th-operation">
                                            <td class="td-inner">商品操作</td>
                                        </div>
                                        <div class="th th-amount">
                                            <td class="td-inner">合计</td>
                                        </div>
                                        <div class="th th-status">
                                            <td class="td-inner">交易状态</td>
                                        </div>
                                        <div class="th th-change">
                                            <td class="td-inner">交易操作</td>
                                        </div>
                                    </div>
                                    <div class="order-main">
                                        <div class="order-list">
                                            <c:forEach items="${requestScope.waitPayOrders}" var="order">
                                                <div class="order-status1">
                                                    <div class="order-title">
                                                        <div class="dd-num">订单编号：<a
                                                                href="javascript:void(0);">${order.orderNum}</a></div>
                                                    </div>
                                                    <div class="order-content">
                                                        <div class="order-left">
                                                            <c:forEach items="${order.orderItems}" var="orderItem">
                                                                <ul class="item-list">
                                                                    <li class="td td-item">
                                                                        <div class="item-pic">
                                                                            <a href="#" class="J_MakePoint">
                                                                                <img src="${orderItem.goods.img}"
                                                                                     class="itempic J_ItemImg">
                                                                            </a>
                                                                        </div>
                                                                        <div class="item-info">
                                                                            <div class="item-basic-info">
                                                                                <a href="#">
                                                                                    <p>${orderItem.goods.name}</p>
                                                                                </a>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li class="td td-price">
                                                                        <div class="item-price">
                                                                            ￥${orderItem.goods.unitPrice}
                                                                        </div>
                                                                    </li>
                                                                    <li class="td td-number">
                                                                        <div class="item-number">
                                                                            <span>×</span>${orderItem.num}
                                                                        </div>
                                                                    </li>
                                                                    <li class="td td-operation">
                                                                        <div class="item-operation">

                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </c:forEach>
                                                        </div>
                                                        <div class="order-right">
                                                            <li class="td td-amount">
                                                                <div class="item-amount">
                                                                    合计：￥${order.logisticsFee+order.serviceFee+order.amount}
                                                                    <p>含运费：<span>￥${order.logisticsFee}</span></p>
                                                                </div>
                                                            </li>
                                                            <div class="move-right">
                                                                <li class="td td-status">
                                                                    <div class="item-status">
                                                                        <p class="Mystatus">等待买家付款</p>
                                                                        <p class="order-info"><a href="#">取消订单</a></p>

                                                                    </div>
                                                                </li>
                                                                <li class="td td-change">
                                                                    <a href="/payNotPayedOrder?orderId=${order.orderId}">
                                                                        <div class="am-btn am-btn-danger anniu">
                                                                            一键支付
                                                                        </div>
                                                                    </a>
                                                                </li>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="am-tab-panel am-fade" id="tab3">
                                    <div class="order-top">
                                        <div class="th th-item">
                                            <td class="td-inner">商品</td>
                                        </div>
                                        <div class="th th-price">
                                            <td class="td-inner">单价</td>
                                        </div>
                                        <div class="th th-number">
                                            <td class="td-inner">数量</td>
                                        </div>
                                        <div class="th th-operation">
                                            <td class="td-inner">商品操作</td>
                                        </div>
                                        <div class="th th-amount">
                                            <td class="td-inner">合计</td>
                                        </div>
                                        <div class="th th-status">
                                            <td class="td-inner">交易状态</td>
                                        </div>
                                        <div class="th th-change">
                                            <td class="td-inner">交易操作</td>
                                        </div>
                                    </div>

                                    <div class="order-main">
                                        <div class="order-list">
                                            <c:forEach items="${requestScope.waitSendOrders}" var="order">
                                                <div class="order-status2">
                                                    <div class="order-title">
                                                        <div class="dd-num">订单编号：<a
                                                                href="javascript:;">${order.orderNum}</a></div>
                                                        <span>成交时间：<cfm:formatDate value="${order.payTime}"
                                                                                   pattern="yyyy-MM-dd"/></span>
                                                        <!--    <em>店铺：小桔灯</em>-->
                                                    </div>
                                                    <div class="order-content">
                                                        <div class="order-left">
                                                            <c:forEach items="${order.orderItems}" var="orderItem">
                                                                <ul class="item-list">
                                                                    <li class="td td-item">
                                                                        <div class="item-pic">
                                                                            <a href="/viewGoods?goods_id=${orderItem.goods.goodsId}"
                                                                               class="J_MakePoint">
                                                                                <img src="${orderItem.goods.img}"
                                                                                     class="itempic J_ItemImg">
                                                                            </a>
                                                                        </div>
                                                                        <div class="item-info">
                                                                            <div class="item-basic-info">
                                                                                <a href="/viewGoods?goods_id=${orderItem.goods.goodsId}">
                                                                                    <p>${orderItem.goods.name}</p>
                                                                                </a>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li class="td td-price">
                                                                        <div class="item-price">
                                                                            ￥${orderItem.goods.unitPrice}
                                                                        </div>
                                                                    </li>
                                                                    <li class="td td-number">
                                                                        <div class="item-number">
                                                                            <span>×</span>${orderItem.num}
                                                                        </div>
                                                                    </li>
                                                                    <li class="td td-operation">
                                                                        <div class="item-operation">
                                                                                <%--<a href="refund.html">退款</a>--%>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </c:forEach>
                                                        </div>
                                                        <div class="order-right">
                                                            <li class="td td-amount">
                                                                <div class="item-amount">
                                                                    合计：￥${order.logisticsFee+order.serviceFee+order.amount}
                                                                    <p>含运费：<span>￥${order.logisticsFee}</span></p>
                                                                </div>
                                                            </li>
                                                            <div class="move-right">
                                                                <li class="td td-status">
                                                                    <div class="item-status">
                                                                        <p class="Mystatus">买家已付款</p>
                                                                    </div>
                                                                </li>
                                                                <li class="td td-change">
                                                                    <div class="am-btn am-btn-danger anniu"
                                                                         onclick="sendRemindSend()">
                                                                        提醒发货
                                                                    </div>
                                                                </li>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="am-tab-panel am-fade" id="tab4">
                                    <div class="order-top">
                                        <div class="th th-item">
                                            <td class="td-inner">商品</td>
                                        </div>
                                        <div class="th th-price">
                                            <td class="td-inner">单价</td>
                                        </div>
                                        <div class="th th-number">
                                            <td class="td-inner">数量</td>
                                        </div>
                                        <div class="th th-operation">
                                            <td class="td-inner">商品操作</td>
                                        </div>
                                        <div class="th th-amount">
                                            <td class="td-inner">合计</td>
                                        </div>
                                        <div class="th th-status">
                                            <td class="td-inner">交易状态</td>
                                        </div>
                                        <div class="th th-change">
                                            <td class="td-inner">交易操作</td>
                                        </div>
                                    </div>

                                    <div class="order-main">
                                        <div class="order-list">
                                            <c:forEach items="${requestScope.waitRecOrders}" var="order">
                                                <div class="order-status3">
                                                    <div class="order-title">
                                                        <div class="dd-num">订单编号：<a
                                                                href="javascript:;">${order.orderNum}</a></div>
                                                        <span>成交时间：<cfm:formatDate value="${order.payTime}"
                                                                                   pattern="yyyy-MM-dd"/></span>
                                                    </div>
                                                    <div class="order-content">
                                                        <div class="order-left">
                                                            <c:forEach items="${order.orderItems}" var="orderItem">
                                                                <ul class="item-list">
                                                                    <li class="td td-item">
                                                                        <div class="item-pic">
                                                                            <a href="/viewGoods?goods_id=${orderItem.goods.goodsId}"
                                                                               class="J_MakePoint">
                                                                                <img src="${orderItem.goods.img}"
                                                                                     class="itempic J_ItemImg">
                                                                            </a>
                                                                        </div>
                                                                        <div class="item-info">
                                                                            <div class="item-basic-info">
                                                                                <a href="/viewGoods?goods_id=${orderItem.goods.goodsId}">
                                                                                    <p>${orderItem.goods.name}</p>
                                                                                </a>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li class="td td-price">
                                                                        <div class="item-price">
                                                                            ￥${orderItem.goods.unitPrice}
                                                                        </div>
                                                                    </li>
                                                                    <li class="td td-number">
                                                                        <div class="item-number">
                                                                            <span>×</span>${orderItem.num}
                                                                        </div>
                                                                    </li>
                                                                    <li class="td td-operation">
                                                                        <div class="item-operation">
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </c:forEach>
                                                        </div>
                                                        <div class="order-right">
                                                            <li class="td td-amount">
                                                                <div class="item-amount">
                                                                    合计：￥${order.logisticsFee+order.serviceFee+order.amount}
                                                                    <p>含运费：<span>￥${order.logisticsFee}</span></p>
                                                                </div>
                                                            </li>
                                                            <div class="move-right">
                                                                <li class="td td-status">
                                                                    <div class="item-status">
                                                                        <p class="Mystatus">快递已到达</p>
                                                                    </div>
                                                                </li>
                                                                <li class="td td-change">
                                                                    <a class="am-btn am-btn-danger anniu"
                                                                       href="/confiremRec?orderId=${order.orderId}">
                                                                        确认收货</a>
                                                                </li>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="am-tab-panel am-fade" id="tab5">
                                    <div class="order-top">
                                        <div class="th th-item">
                                            <td class="td-inner">商品</td>
                                        </div>
                                        <div class="th th-price">
                                            <td class="td-inner">单价</td>
                                        </div>
                                        <div class="th th-number">
                                            <td class="td-inner">数量</td>
                                        </div>
                                        <div class="th th-operation">
                                            <td class="td-inner">商品操作</td>
                                        </div>
                                        <div class="th th-amount">
                                            <td class="td-inner">合计</td>
                                        </div>
                                        <div class="th th-status">
                                            <td class="td-inner">交易状态</td>
                                        </div>
                                        <div class="th th-change">
                                            <td class="td-inner">交易操作</td>
                                        </div>
                                    </div>

                                    <div class="order-main">
                                        <div class="order-list">
                                            <!--不同状态的订单	-->
                                            <c:forEach items="${requestScope.notCommentOrders}" var="order">
                                                <div class="order-status4">
                                                    <div class="order-title">
                                                        <div class="dd-num">订单编号：<a
                                                                href="javascript:;">${order.orderNum}</a></div>
                                                        <span>成交时间：<cfm:formatDate value="${order.payTime}"
                                                                                   pattern="yyyy-MM-dd"/></span>

                                                    </div>
                                                    <div class="order-content">
                                                        <div class="order-left">
                                                            <c:forEach items="${order.orderItems}" var="orderItem">
                                                                <c:if test="${orderItem.commented==0}">
                                                                    <ul class="item-list">
                                                                        <li class="td td-item">
                                                                            <div class="item-pic">
                                                                                <a href="/viewGoods?goods_id=${orderItem.goods.goodsId}"
                                                                                   class="J_MakePoint">
                                                                                    <img src="${orderItem.goods.img}"
                                                                                         class="itempic J_ItemImg">
                                                                                </a>
                                                                            </div>
                                                                            <div class="item-info">
                                                                                <div class="item-basic-info">
                                                                                    <a href="/viewGoods?goods_id=${orderItem.goods.goodsId}">
                                                                                        <p>${orderItem.goods.name}</p>
                                                                                    </a>
                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                        <li class="td td-price">
                                                                            <div class="item-price">
                                                                                ￥${orderItem.goods.unitPrice}
                                                                            </div>
                                                                        </li>
                                                                        <li class="td td-number">
                                                                            <div class="item-number">
                                                                                <span>×</span>${orderItem.num}
                                                                            </div>
                                                                        </li>
                                                                        <li class="td td-operation">
                                                                            <div class="item-operation">
                                                                                    <%--<a href="refund.html">退款/退货</a>--%>
                                                                            </div>
                                                                        </li>
                                                                    </ul>
                                                                </c:if>
                                                            </c:forEach>
                                                        </div>
                                                        <div class="order-right">
                                                            <li class="td td-amount">
                                                                <div class="item-amount">
                                                                    合计：￥${order.logisticsFee+order.serviceFee+order.amount}
                                                                    <p>含运费：<span>￥${order.logisticsFee}</span></p>
                                                                </div>
                                                            </li>
                                                            <div class="move-right">
                                                                <li class="td td-status">
                                                                    <div class="item-status">
                                                                        <p class="Mystatus">交易成功</p>
                                                                    </div>
                                                                </li>
                                                                <li class="td td-change">
                                                                    <a href="/toComment?orderId=${order.orderId}">
                                                                        <div class="am-btn am-btn-danger anniu">
                                                                            评价商品
                                                                        </div>
                                                                    </a>
                                                                </li>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>

                                    </div>

                                </div>
                            </div>
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
                            <li><a href="/page/foreground/user/UserInfo.jsp">个人信息</a></li>
                            <li><a href="/page/foreground/user/Safety.jsp">安全设置</a></li>
                            <li><a href="/manageAddress">收货地址</a></li>
                        </ul>
                    </li>
                    <li class="person">
                        <div class="h5">我的交易</div>
                        <ul>
                            <li class="active"><a href="/viewOrder">订单管理</a></li>
                        </ul>
                    </li>

                    <li class="person">
                        <div class="h5">我的小窝</div>
                        <ul>
                            <li><a href="/page/foreground/user/Collection.jsp">关注</a></li>
                            <li><a href="/page/foreground/user/Foot.jsp">足迹</a></li>
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
    function deleteOrder(orderId) {
        if (confirm("您确定要删除此订单?")) {
            var url = "/deleteOrder"
            var data = {orderId: orderId}
            $.getJSON(url, data, function (json) {
                if (json.result) {
                    $("#" + orderId).remove()
                } else {
                    alert("删除订单失败！")
                }
            })
        }
    }

    function sendRemindSend() {
        alert("商家正在处理您的订单")
    }
</script>
</html>
