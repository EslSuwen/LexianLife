<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dengxiaobing
  Date: 2017/9/21
  Time: 下午1:36
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
    <link rel="stylesheet" href="../../../style/bootstrap.css">
    <link rel="stylesheet" href="../../../style/foreground/main.css">
    <link rel="stylesheet" href="../../../style/foreground/product.css">
    <script type="text/javascript">
    </script>
    <title>购物车</title>
</head>
<body>
<!---->
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
                                    <a href="/viewCategory.do?category_id=${catalog.categories[0].category_id}&pageIndex=1">${catalog.categories[0].name}</a>
                                </li>
                                <li>|</li>
                            </c:forEach>
                            <li>
                                <a href="/viewCategory.do?category_id=${catalogs[5].categories[0].category_id}&pageIndex=1">${sessionScope.catalogs[5].categories[0].name}</a>
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
            <div class="h2">购物车</div>
            <%--<div class="notLogin"><span class="glyphicon glyphicon-warning-sign">&nbsp;</span>您还没有登录，登录后的购物车内的商品将自动保存到您的帐号中<button class="curLoginBtn">立即登录</button></div>--%>
            <%--<a href="/viewCart.do" class="btn btn-success btn-lg">更新</a>--%>
            <div class="title">全部商品&nbsp;${sessionScope.cart.cartItems.size()}</div>
            <div class="myCartTable">
                <table class="table">
                    <tr>
                        <th><input type="checkbox" onclick="selectAll()" id="allCheck">全选</th>
                        <th>商品</th>
                        <th>单价</th>
                        <th>数量</th>
                        <th>小计</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach var="cartItem" items="${sessionScope.cart.cartItems}">
                        <tr>
                            <td><input type="checkbox" id="check${cartItem.cartItemId}"
                                       <c:if test="${cartItem.selected==1}">checked</c:if>
                                       onclick="selectCartItem(${cartItem.cartItemId})"></td>
                            <td>
                                <div class="row">
                                    <div class="col-md-4">
                                        <img src="../${cartItem.goods.img}" width="100" height="150">
                                    </div>
                                    <div class="col-md-8">
                                        <div style="line-height: 150px">
                                                ${cartItem.goods.name}
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td>￥<span id="unitPrice${cartItem.cartItemId}">${cartItem.goods.unitPrice}</span></td>
                            <td>
                                <div class="numBox">
                                    <button class="addBtn" onclick="add('${cartItem.cartItemId}')">+</button>
                                    <input type="number" value="${cartItem.num}"
                                           oninput="numChange(this,'${cartItem.cartItemId}')"
                                           id="${cartItem.cartItemId}">
                                    <button class="subBtn" onclick="sub('${cartItem.cartItemId}')">-</button>
                                    <br><c:if test="${cartItem.num<=cartItem.goods.inventory}">有货</c:if><c:if
                                        test="${cartItem.num>cartItem.goods.inventory}">无货</c:if>
                                </div>
                            </td>
                            <td>￥<span
                                    id="account${cartItem.cartItemId}">${cartItem.goods.unitPrice*cartItem.num}</span>
                            </td>
                            <td>
                                <a class="btn btn-danger btn-sm"
                                   href="/removeCartItem.do?cartItemId=${cartItem.cartItemId}">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <div class="operateBox pull-right">
                    已选择<span class="selectNum"
                             id="selectNum">${sessionScope.cart.getSelectSize()}</span>件商品&nbsp;总价:<span
                        class="allPrice" id="allPrice">￥${sessionScope.cart.getTotalPrice()}</span>
                    <a href="/toSettleAccount.do">
                        <button class="gotoPayBtn">去结算</button>
                    </a>
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
    function selectAll() {
        $("[id^=check]").each(function () {
            $(this)[0].checked = !$("#allCheck")[0].checked
            $(this).click()
        })
        updateAccount()
    }

    function updateCartItemNum(cartItemId, num) {
        if (num < 0) {
            alert("商品数量不能小于0")
            $("#" + cartItemId).val("0")
            return
        }
        var url = "/updateCartItemNum.do";
        var data = {cartItemId: cartItemId, num: num}
        $.getJSON(url, data, function (json) {

        })
    }

    function add(numId) {
        $("#" + numId).val(parseInt($("#" + numId).val()) + 1)
        updateCartItemNum(numId, $("#" + numId).val())
        $("#account" + numId).text(parseFloat($("#unitPrice" + numId).text()) * $("#" + numId).val())
        updateAccount()
    }

    function sub(numId) {
        $("#" + numId).val(parseInt($("#" + numId).val()) - 1)
        updateCartItemNum(numId, $("#" + numId).val())
        $("#account" + numId).text(parseFloat($("#unitPrice" + numId).text()) * $("#" + numId).val())
        updateAccount()
    }

    function numChange(obj, cartItemId) {
        updateCartItemNum(cartItemId, $(obj).val())
        $("#account" + cartItemId).text(parseFloat($("#unitPrice" + cartItemId).text()) * $(obj).val())
        updateAccount()
    }

    function updateAccount() {
        var account = 0
        $("[id^=account]").each(function () {
            var id = $(this).attr("id")
            id = id.substring(7, id.length)
            if ($("#check" + id)[0].checked) {
                account += parseFloat($(this).text())
            }
        })
        $("#allPrice").text(account)
    }

    function selectCartItem(cartItemId) {
        var selected = 0
        if ($("#check" + cartItemId)[0].checked)
            selected = 1
        var url = "/selectCartItem.do"
        var data = {cartItemId: cartItemId, selected: selected}
        $.getJSON(url, data, function (json) {
        })
        updateAccount()
        var checkedCount = 0
        $("[id^=check]").each(function () {
            if (this.checked) {
                checkedCount += 1
            }
        })
        $("#selectNum").text(checkedCount)
    }
</script>
</html>
