<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dengxiaobing
  Date: 2017/9/18
  Time: 上午10:26
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

    <link rel="stylesheet" href="../../../AmazeUI-2.4.2/assets/css/amazeui.css">
    <link rel="stylesheet" href="../../../style/foreground/seastyle.css">
    <link rel="stylesheet" href="../../../style/foreground/demo.css">
    <link rel="stylesheet" href="../../../AmazeUI-2.4.2/assets/css/admin.css">
    <script src="../../../AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
    <script type="text/javascript">
    </script>
    <title>搜索商品</title>
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
        <div class="mayfind">
            <div class="row">
                <div class="col-lg-2">&nbsp;您是不是在找:</div>
                <div class="col-md-10">
                    <ul class="list-unstyled list-inline">
                        <c:forEach items="${requestScope.mayFindList}" var="category" varStatus="status">
                            <c:if test="${status.index<8}">
                                <li>
                                    <a href="/viewCategory.do?category_id=${category.category_id}&pageIndex=1">${category.name}</a>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <div class="search">
            <div class="search-list">
                <div class="am-g am-g-fixed">
                    <div class="am-u-sm-12 am-u-md-12">
                        <div class="clear"></div>
                    </div>
                    <div class="search-content">
                        <div class="sort">
                            <li class="first"><a title="综合" href="/findGoods.do?name=${requestScope.name}">综合排序</a></li>
                            <li><a title="销量" href="/findGoods.do?name=${requestScope.name}&sort=1">销量排序</a></li>
                            <li><a title="价格" href="/findGoods.do?name=${requestScope.name}&sort=2">价格优先</a></li>
                            <%--<li class="big">价格区间
                                <form action="">
                                    <input type="number" style="width: 100px;">~<input type="number" style="width: 100px;"><button type="button" class="btn btn-sm" style="background-color: orangered;color:white;height: 25px;">查询</button>
                                </form>
                            </li>--%>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="productTable">
                        <table class="table">
                            <c:forEach items="${requestScope.goodsPage.getContent()}" varStatus="status" step="4">
                                <tr>
                                    <td>
                                        <div class="productItem" onmouseenter="mouseInProductItem(this)"
                                             onmouseleave="mouseOutProductItem(this)">
                                            <a href="/viewGoods.do?goods_id=${requestScope.goodsPage.getContent()[status.index].goodsId}"><img
                                                    src="${requestScope.goodsPage.getContent()[status.index].img}"
                                                    class="pic"></a>
                                            <div class="row">
                                                <div class="col-md-6"><span
                                                        class="price">￥${requestScope.goodsPage.getContent()[status.index].unitPrice}</span>
                                                </div>
                                                <div class="col-md-6"><span
                                                        class="payNum">${requestScope.goodsPage.getContent()[status.index].saleCount}人付款</span>
                                                </div>
                                            </div>
                                            <a href="/viewGoods.do?goods_id=${requestScope.goodsPage.getContent()[status.index].goodsId}"
                                               class="introduce">${requestScope.goodsPage.getContent()[status.index].name}</a>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="concernBox"
                                                         id="con${requestScope.goodsPage.getContent()[status.index].goodsId}"
                                                         onmouseenter="concernIn(this,'${requestScope.goodsPage.getContent()[status.index].goodsId}')"
                                                         onmouseleave="concernOut(this,'${requestScope.goodsPage.getContent()[status.index].goodsId}')">
                                                        <div class="row">
                                                            <div class="col-md-3"><img src="../../../img/concern1.png"
                                                                                       class="concern"
                                                                                       id="${requestScope.goodsPage.getContent()[status.index].goodsId}">
                                                            </div>
                                                            <div class="col-md-9"><a href="javascript:void(0)"
                                                                                     class="concernText"
                                                                                     onclick="addAttention('${requestScope.goodsPage.getContent()[status.index].goodsId}')">关注</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="addCartBox" onmouseenter="mouseInProductItem(this)"
                                                         onmouseleave="mouseOutProductItem(this)">
                                                        <div class="row">
                                                            <div class="col-md-3"><img src="../../../img/addcart.png"
                                                                                       class="addCart"></div>
                                                            <div class="col-md-9"><a
                                                                    href="/addToCart.do?goods_id=${requestScope.goodsPage.getContent()[status.index].goodsId}"
                                                                    class="addCartText">加入购物车</a></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <c:if test="${requestScope.goodsPage.getContent()[status.index+1]!=null}">
                                        <td>
                                            <div class="productItem" onmouseenter="mouseInProductItem(this)"
                                                 onmouseleave="mouseOutProductItem(this)">
                                                <a href="/viewGoods.do?goods_id=${requestScope.goodsPage.getContent()[status.index+1].goodsId}"><img
                                                        src="${requestScope.goodsPage.getContent()[status.index+1].img}"
                                                        class="pic"></a>
                                                <div class="row">
                                                    <div class="col-md-6"><span
                                                            class="price">￥${requestScope.goodsPage.getContent()[status.index+1].unitPrice}</span>
                                                    </div>
                                                    <div class="col-md-6"><span
                                                            class="payNum">${requestScope.goodsPage.getContent()[status.index+1].saleCount}人付款</span>
                                                    </div>
                                                </div>
                                                <a href="/viewGoods.do?goods_id=${requestScope.goodsPage.getContent()[status.index+1].goodsId}"
                                                   class="introduce">${requestScope.goodsPage.getContent()[status.index+1].name}</a>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="concernBox"
                                                             id="con${requestScope.goodsPage.getContent()[status.index+1].goodsId}"
                                                             onmouseenter="concernIn(this,'${requestScope.goodsPage.getContent()[status.index+1].goodsId}')"
                                                             onmouseleave="concernOut(this,'${requestScope.goodsPage.getContent()[status.index+1].goodsId}')">
                                                            <div class="row">
                                                                <div class="col-md-3"><img
                                                                        src="../../../img/concern1.png" class="concern"
                                                                        id="${requestScope.goodsPage.getContent()[status.index+1].goodsId}">
                                                                </div>
                                                                <div class="col-md-9"><a href="javascript:void(0)"
                                                                                         class="concernText"
                                                                                         onclick="addAttention('${requestScope.goodsPage.getContent()[status.index+1].goodsId}')">关注</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="addCartBox" onmouseenter="mouseInProductItem(this)"
                                                             onmouseleave="mouseOutProductItem(this)">
                                                            <div class="row">
                                                                <div class="col-md-3"><img
                                                                        src="../../../img/addcart.png" class="addCart">
                                                                </div>
                                                                <div class="col-md-9"><a
                                                                        href="/addToCart.do?goods_id=${requestScope.goodsPage.getContent()[status.index+1].goodsId}"
                                                                        class="addCartText">加入购物车</a></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </c:if>
                                    <c:if test="${requestScope.goodsPage.getContent()[status.index+2]!=null}">
                                        <td>
                                            <div class="productItem" onmouseenter="mouseInProductItem(this)"
                                                 onmouseleave="mouseOutProductItem(this)">
                                                <a href="/viewGoods.do?goods_id=${requestScope.goodsPage.getContent()[status.index+2].goodsId}"><img
                                                        src="${requestScope.goodsPage.getContent()[status.index+2].img}"
                                                        class="pic"></a>
                                                <div class="row">
                                                    <div class="col-md-6"><span
                                                            class="price">￥${requestScope.goodsPage.getContent()[status.index+2].unitPrice}</span>
                                                    </div>
                                                    <div class="col-md-6"><span
                                                            class="payNum">${requestScope.goodsPage.getContent()[status.index+2].saleCount}人付款</span>
                                                    </div>
                                                </div>
                                                <a href="/viewGoods.do?goods_id=${requestScope.goodsPage.getContent()[status.index+2].goodsId}"
                                                   class="introduce">${requestScope.goodsPage.getContent()[status.index+2].name}</a>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="concernBox"
                                                             id="con${requestScope.goodsPage.getContent()[status.index+2].goodsId}"
                                                             onmouseenter="concernIn(this,'${requestScope.goodsPage.getContent()[status.index+2].goodsId}')"
                                                             onmouseleave="concernOut(this,'${requestScope.page.getContent()[status.index+2].goodsId}')">
                                                            <div class="row">
                                                                <div class="col-md-3"><img
                                                                        src="../../../img/concern1.png" class="concern"
                                                                        id="${requestScope.goodsPage.getContent()[status.index+2].goodsId}">
                                                                </div>
                                                                <div class="col-md-9"><a href="javascript:void(0)"
                                                                                         class="concernText"
                                                                                         onclick="addAttention('${requestScope.goodsPage.getContent()[status.index+2].goodsId}')">关注</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="addCartBox" onmouseenter="mouseInProductItem(this)"
                                                             onmouseleave="mouseOutProductItem(this)">
                                                            <div class="row">
                                                                <div class="col-md-3"><img
                                                                        src="../../../img/addcart.png" class="addCart">
                                                                </div>
                                                                <div class="col-md-9"><a
                                                                        href="/addToCart.do?goods_id=${requestScope.goodsPage.getContent()[status.index+2].goodsId}"
                                                                        class="addCartText">加入购物车</a></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </c:if>
                                    <c:if test="${requestScope.goodsPage.getContent()[status.index+3]!=null}">
                                        <td>
                                            <div class="productItem" onmouseenter="mouseInProductItem(this)"
                                                 onmouseleave="mouseOutProductItem(this)">
                                                <a href="/viewGoods.do?goods_id=${requestScope.goodsPage.getContent()[status.index+3].goodsId}"><img
                                                        src="${requestScope.goodsPage.getContent()[status.index+3].img}"
                                                        class="pic"></a>
                                                <div class="row">
                                                    <div class="col-md-6"><span
                                                            class="price">￥${requestScope.goodsPage.getContent()[status.index+3].unitPrice}</span>
                                                    </div>
                                                    <div class="col-md-6"><span
                                                            class="payNum">${requestScope.goodsPage.getContent()[status.index+3].saleCount}人付款</span>
                                                    </div>
                                                </div>
                                                <a href="/viewGoods.do?goods_id=${requestScope.goodsPage.getContent()[status.index+3].goodsId}"
                                                   class="introduce">${requestScope.goodsPage.getContent()[status.index+3].name}</a>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="concernBox"
                                                             id="con${requestScope.goodsPage.getContent()[status.index+3].goodsId}"
                                                             onmouseenter="concernIn(this,'${requestScope.goodsPage.getContent()[status.index+3].goodsId}')"
                                                             onmouseleave="concernOut(this,'${requestScope.goodsPage.getContent()[status.index+3].goodsId}')">
                                                            <div class="row">
                                                                <div class="col-md-3"><img
                                                                        src="../../../img/concern1.png" class="concern"
                                                                        id="${requestScope.goodsPage.getContent()[status.index+3].goodsId}">
                                                                </div>
                                                                <div class="col-md-9"><a href="javascript:void(0)"
                                                                                         class="concernText"
                                                                                         onclick="addAttention('${requestScope.goodsPage.getContent()[status.index+3].goodsId}')">关注</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="addCartBox" onmouseenter="mouseInProductItem(this)"
                                                             onmouseleave="mouseOutProductItem(this)">
                                                            <div class="row">
                                                                <div class="col-md-3"><img
                                                                        src="../../../img/addcart.png" class="addCart">
                                                                </div>
                                                                <div class="col-md-9"><a
                                                                        href="/addToCart.do?goods_id=${requestScope.goodsPage.getContent()[status.index+3].goodsId}"
                                                                        class="addCartText">加入购物车</a></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <!--分页 -->
                    <ul class="am-pagination am-pagination-right">
                        <c:if test="${requestScope.goodsPage.getNumber()==0}">
                            <li class="am-disabled"><a href="#">&laquo;</a></li>
                        </c:if>
                        <c:if test="${requestScope.goodsPage.getNumber()!=0}">
                            <li>
                                <a href="/findGoods.do?name=${requestScope.name}&pageIndex=${requestScope.goodsPage.getNumber()}&sort=${requestScope.sort}">&laquo;</a>
                            </li>
                        </c:if>
                        <c:choose>
                            <%--总页数小于等于5，把所有页显示出来--%>
                            <c:when test="${requestScope.goodsPage.getTotalPages()<5}">
                                <c:set var="begin" value="1"/>
                                <c:set var="end" value="${requestScope.goodsPage.getTotalPages()}"/>
                            </c:when>
                            <%--总页数>5的话，计算begin和end--%>
                            <c:otherwise>
                                <c:set var="begin" value="${requestScope.goodsPage.getNumber()-1}"/>
                                <c:set var="end" value="${requestScope.goodsPage.getNumber()+3}"/>
                                <%--处理头溢出--%>
                                <c:if test="${begin<1}">
                                    <c:set var="begin" value="1"/>
                                    <c:set var="end" value="5"/>
                                </c:if>
                                <%--处理尾溢出--%>
                                <c:if test="${end>requestScope.goodsPage.getTotalPages()}">
                                    <c:set var="begin" value="${requestScope.goodsPage.getTotalPages()-4}"/>
                                    <c:set var="end" value="${requestScope.goodsPage.getTotalPages()}"/>
                                </c:if>
                            </c:otherwise>
                        </c:choose>
                        <c:forEach begin="${begin}" end="${end}" var="i">
                            <c:choose>
                                <c:when test="${i==requestScope.goodsPage.getNumber()+1}">
                                    <li class="am-active"><a href="#">${i}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li>
                                        <a href="/findGoods.do?name=${requestScope.name}&pageIndex=${i}&sort=${requestScope.sort}">${i}</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:if test="${requestScope.goodsPage.getNumber()+1<end}">
                            <li>
                                <a href="/findGoods.do?name=${requestScope.name}&pageIndex=${requestScope.goodsPage.getNumber()+2}&sort=${requestScope.sort}">&raquo;</a>
                            </li>
                        </c:if>
                        <c:if test="${requestScope.goodsPage.getNumber()+1==end}">
                            <li class="am-disabled"><a href="#">&raquo;</a></li>
                        </c:if>
                    </ul>

                </div>
            </div>
        </div>
    </div>
    <div class="mayLike">
        <div class="h5">猜你喜欢：</div>
        <ul class="list-unstyled list-inline" id="mayLikeBox">
        </ul>
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
    $(document).ready(function () {
        loadMayLike()
    })

    function loadMayLike() {
        var url = "/queryMayLike.do"
        $.getJSON(url, function (array) {
            $.each(array, function (n, obj) {
                var li = "<li><div class='productItem' onmouseenter='mouseInProductItem(this)' onmouseleave='mouseOutProductItem(this)'> <a href='/viewGoods.do?goods_id=" + obj.goods_id + "'><img src='" + obj.img + "' class='pic'></a> <div class='row'> <div class='col-md-6'><span class='price'>￥" + obj.unitPrice + "</span></div> <div class='col-md-6'><span class='payNum'>" + obj.saleCount + "人付款</span></div> </div> <a href='/viewGoods.do?goods_id=" + obj.goods_id + "' class='introduce'>" + obj.name + "</a> <div class='row'> <div class='col-md-6'> <div class='concernBox' id='con+obj.goods_id+' onmouseenter='concernIn(this,'" + obj.goods_id + "')' onmouseleave='concernOut(this,'" + obj.goods_id + "')'> <div class='row'> <div class='col-md-3'><img src='../../../img/concern1.png' class='concern' id='" + obj.goods_id + "'></div> <div class='col-md-9'><a href='javascript:void(0)' class='concernText' onclick='addAttention('" + obj.goods_id + "')'>关注</a></div> </div> </div> </div> <div class='col-md-6'> <div class='addCartBox' onmouseenter='mouseInProductItem(this)' onmouseleave='mouseOutProductItem(this)'> <div class='row'> <div class='col-md-3'><img src='../../../img/addcart.png' class='addCart'></div> <div class='col-md-9'><a href='/addToCart.do?goods_id=" + obj.goods_id + "' class='addCartText'>加入购物车</a></div> </div> </div> </div> </div> </div></li>"
                $("#mayLikeBox").append(li)
            })
        })
    }

    function addAttention(goods_id) {
        var url = "/addAttention.do"
        var data = {goods_id: goods_id}
        $.getJSON(url, data, function (json) {
            if (json.result) {
                concernOut($("#con" + goods_id)[0], "" + goods_id);
                $("#con" + goods_id).attr("onmouseenter", "").unbind("concernIn")
                $("#con" + goods_id).attr("onmouseleave", "").unbind("concernOut")
                $("#" + goods_id).attr("src", "../../../img/concern2.png")
            }
            alert(json.msg)
        })
    }
</script>
</html>
