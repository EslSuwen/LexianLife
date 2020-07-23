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
    <%--<script type="text/javascript" src="../../../js/foreground/product.js"></script>--%>
    <link rel="stylesheet" href="../../../style/bootstrap.css">
    <link rel="stylesheet" href="../../../style/foreground/main.css">
    <link rel="stylesheet" href="../../../style/foreground/product.css">
    <script type="text/javascript" src="../../../js/foreground/ProJson.js"></script>

    <link href="../../../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="../../../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="../../../style/foreground/personal.css" rel="stylesheet" type="text/css">
    <link href="../../../style/foreground/addstyle.css" rel="stylesheet" type="text/css">
    <script src="../../../AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="../../../AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    <script type="text/javascript" src="../../../js/foreground/address.js"></script>
    <link href="../../../style/foreground/demo.css" rel="stylesheet" type="text/css"/>
    <link href="../../../style/foreground/cartstyle.css" rel="stylesheet" type="text/css"/>
    <link href="../../../style/foreground/jsstyle.css" rel="stylesheet" type="text/css"/>

    <title>确认订单</title>
</head>
<body>
<c:if test="${sessionScope.submitOrderFail!=null}">
    <%="<script>alert('" + session.getAttribute("submitOrderFail") + "')</script>"%>
    <%session.removeAttribute("submitOrderFail");%>
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
        <div class="myCartBox">
            <div class="h2">结算</div>
            <div class="notLogin"><span class="glyphicon glyphicon-warning-sign">&nbsp;</span>温馨提示：订单中存在不支持7天无理由退换商品，请确认相关商品信息后提交订单。
            </div>
        </div>
        <div class="accountInfoBox">
            <h3>确认收货地址 </h3>
            <div class="control">
                <div class="tc-btn createAddr theme-login am-btn am-btn-danger">使用新地址</div>
            </div>
            <div class="clear"></div>
            <div class="accountDetailBox">
                <div class="user-address">
                    <hr/>
                    <ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">
                        <c:forEach var="recAddr" items="${sessionScope.recAddrs}">
                            <li class="user-addresslist" id="${recAddr.recaddrId}"
                                onclick="selectAddress(${recAddr.recaddrId})">
                                    <%--<span class="new-option-r"><i class="am-icon-check-circle"></i>设为默认</span>--%>
                                <p class="new-tit new-p-re">
                                    <span class="new-txt" id="name${recAddr.recaddrId}">${recAddr.recName}</span>
                                    <span class="new-txt-rd2" id="phone${recAddr.recaddrId}">${recAddr.phone}</span>
                                </p>
                                <div class="new-mu_l2a new-p-re">
                                    <p class="new-mu_l2cw">
                                        <span class="title">地址：</span>
                                        <span class="province"
                                              id="province${recAddr.recaddrId}">${recAddr.province}</span>
                                        <span class="city" id="city${recAddr.recaddrId}">${recAddr.city}</span>
                                        <span class="dist" id="district">${recAddr.district}</span>
                                        <span class="street" id="addr${recAddr.recaddrId}">${recAddr.addr}</span></p>
                                </div>
                                <div class="new-addr-btn">
                                    <a href="/toEditAddr.do?id=${recAddr.recaddrId}"><i class="am-icon-edit"></i>编辑</a>
                                    <span class="new-addr-bar">|</span>
                                    <a href="javascript:void(0);" onclick="delClick('${recAddr.recaddrId}');"><i
                                            class="am-icon-trash"></i>删除</a>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>

                </div>
            </div>
        </div>
        <div class="productbill">
            <div class="h4">送货清单</div>
            <div class="myCartBox">
                <div class="myCartTable">
                    <table class="table">
                        <tr>
                            <th>商品</th>
                            <th>单价</th>
                            <th>数量</th>
                            <th>小计</th>
                        </tr>
                        <c:forEach var="orderItem" items="${sessionScope.order.orderItems}">
                            <tr>
                                <td>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <img src="../../../img/goodsImg/${orderItem.goods.img}" width="100"
                                                 height="150">
                                        </div>
                                        <div class="col-md-8">
                                            <div style="line-height: 30px">
                                                    ${orderItem.goods.name}
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td>￥${orderItem.goods.unitPrice}</td>
                                <td>
                                    <div class="numBox">
                                            ${orderItem.num}
                                        <br>有货
                                    </div>
                                </td>
                                <td>￥${orderItem.num*orderItem.goods.unitPrice}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
        <div class="account pull-right">
            <div class="h4">结算</div>
            <table>
                <tr>
                    <td>总商品金额：</td>
                    <td>￥${sessionScope.order.amount}</td>
                </tr>
                <tr>
                    <td>运费：</td>
                    <td>￥${sessionScope.order.logisticsFee}</td>
                </tr>
                <tr>
                    <td>服务费</td>
                    <td>￥${sessionScope.order.serviceFee}</td>
                </tr>
                <tr>
                    <td>应付总额</td>
                    <td>￥${sessionScope.order.amount+sessionScope.order.logisticsFee+sessionScope.order.serviceFee}</td>
                </tr>
            </table>
            <div class="summary" id="summary">寄送至： 江苏 苏州市 昆山市 巴城镇 杰普软件园 收货人：邓小兵 150****9496</div>
            <a href="/submitOrder.do">
                <button type="button" class="submitOrder">提交订单</button>
            </a>
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

<div class="theme-popover-mask"></div>
<div class="theme-popover">

    <!--标题 -->
    <div class="am-cf am-padding">
        <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add address</small>
        </div>
    </div>
    <hr/>

    <div class="am-u-md-12">
        <form class="am-form am-form-horizontal" method="post" action="/addAddressWidthAccount.do">

            <div class="am-form-group">
                <label for="user-name" class="am-form-label">收货人</label>
                <div class="am-form-content">
                    <input type="text" id="user-name" name="recName" placeholder="收货人">
                </div>
            </div>

            <div class="am-form-group">
                <label for="user-phone" class="am-form-label">手机号码</label>
                <div class="am-form-content">
                    <input id="user-phone" name="phone" placeholder="手机号必填" type="text">
                </div>
            </div>
            <div class="am-form-group">
                <label for="postcode" class="am-form-label">邮编</label>
                <div class="am-form-content">
                    <input id="postcode" name="postcode" placeholder="邮政编码" type="text">
                </div>
            </div>
            <div class="am-form-group">
                <label class="am-form-label">所在地</label>
                <div class="am-form-content address">
                    <div class="row">
                        <select name="province" id="cmbProvince" style="width: 120px;">
                        </select>
                        <select name="city" id="cmbCity" style="width: 120px;">
                        </select>
                        <select name="district" id="cmbArea" style="width: 120px;">
                        </select>
                    </div>
                </div>
            </div>

            <script type="text/javascript">
                addressInit('cmbProvince', 'cmbCity', 'cmbArea');
            </script>

            <div class="am-form-group">
                <label for="user-intro" class="am-form-label">详细地址</label>
                <div class="am-form-content">
                    <textarea class="" rows="3" id="user-intro" placeholder="输入详细地址" name="addr"></textarea>
                    <small>100字以内写出你的详细地址...</small>
                </div>
            </div>

            <div class="am-form-group theme-poptit">
                <div class="am-u-sm-9 am-u-sm-push-3">
                    <input type="submit" class="am-btn am-btn-danger" value="保存"/>
                    <div class="am-btn am-btn-danger close">取消</div>
                </div>
            </div>
        </form>
    </div>

</div>

<div class="clear"></div>
</body>
<script>
    function delClick(recaddrId) {
        var url = "/delRecAddr.do";
        var data = {id: recaddrId}
        $.getJSON(url, data, function (json) {
            if (json.result == "true") {//成功
                $("#" + recaddrId).remove()
            } else {
                alert(json.msg)
            }
        })
    }

    function selectAddress(recaddrId) {
        var url = "/selectAddressWidthAccount.do"
        var data = {recaddrId: recaddrId}
        $.getJSON(url, data, function (json) {
            if (json.result) {
                var province = $("#province" + recaddrId)
                var city = $("#city" + recaddrId)
                var district = $("#district" + recaddrId)
                var addr = $("#addr" + recaddrId)
                var name = $("#name" + recaddrId)
                var phone = $("#phone" + recaddrId)
                $("#summary").text("寄送至：" + province.text() + " " + city.text() + " " + district.text() + " " + addr.text() + " 收货人：" + name.text() + " " + phone.text().substr(0, 3) + "***" + phone.text().substr(phone.text().length - 4, 4))
            } else {
                alert(json.msg)
            }
        })
    }
</script>
</html>
