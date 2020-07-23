<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: xiaoxiaobing
  Date: 17-9-19
  Time: 上午1:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
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
    <link href="../../../AmazeUI-2.4.2/assets/css/amazeui.datetimepicker.css" rel="stylesheet" type="text/css">
    <link href="../../../style/foreground/personal.css" rel="stylesheet" type="text/css">
    <link href="../../../style/foreground/infstyle.css" rel="stylesheet" type="text/css">
    <script src="../../../AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="../../../AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>
    <script src="../../../AmazeUI-2.4.2/assets/js/amazeui.datetimepicker.min.js"></script>
    <script src="../../../AmazeUI-2.4.2/assets/js/amazeui.datetimepicker.zh-CN.js"></script>
    <title>个人信息</title>
</head>
<body>
<c:if test="${sessionScope.result!=null}">
    <%="<script>alert('" + session.getAttribute("result").toString() + "')</script>"%>
    <%session.removeAttribute("result");%>
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
        <div class="center">
            <div class="col-main">
                <div class="main-wrap">

                    <div class="user-info">
                        <!--标题 -->
                        <div class="am-cf am-padding">
                            <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small>
                            </div>
                        </div>
                        <hr/>
                        <form class="am-form am-form-horizontal" id="form" action="/customerModify.do" method="post"
                              enctype="multipart/form-data">
                            <!--头像 -->
                            <div class="user-infoPic">
                                <div class="filePic">
                                    <input type="file" name="headFile" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp"
                                           accept="image/*" onchange="getPhoto(this)">
                                    <img class="am-circle am-img-thumbnail" alt="" id="headImg"
                                            <c:if test="${sessionScope.customer.headImg==null}">
                                                src="../../../img/images/getAvatar.do.jpg"
                                            </c:if>
                                            <c:if test="${sessionScope.customer.headImg!=null}">
                                                src="${sessionScope.customer.headImg}"</c:if>
                                    />
                                </div>

                                <p class="am-form-help">头像</p>

                                <div class="info-m">
                                    <div><b>登录名：<i>${sessionScope.customer.username}</i></b></div>
                                </div>
                            </div>
                            <div class="user-detail">
                                <div class="am-form-group">
                                    <label for="nick_name" class="am-form-label">昵称</label>
                                    <div class="am-form-content">
                                        <input type="text" id="nick_name" name="nickname" placeholder="nickname"
                                               value="${sessionScope.customer.nickname}">
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="real_name" class="am-form-label">真实姓名</label>
                                    <div class="am-form-content">
                                        <input type="text" id="real_name" name="realname" placeholder="realname"
                                               value="${sessionScope.customer.realname}">
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label class="am-form-label">性别</label>
                                    <div class="am-form-content sex">
                                        <label class="am-radio-inline">
                                            <input type="radio" name="sex" value="1" data-am-ucheck
                                                   <c:if test="${sessionScope.customer.sex==1}">checked</c:if>> 男
                                        </label>
                                        <label class="am-radio-inline">
                                            <input type="radio" name="sex" value="2" data-am-ucheck
                                                   <c:if test="${sessionScope.customer.sex==2}">checked</c:if>> 女
                                        </label>
                                        <label class="am-radio-inline">
                                            <input type="radio" name="sex" value="0" data-am-ucheck
                                                   <c:if test="${sessionScope.customer.sex==0}">checked</c:if>> 保密
                                        </label>
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label class="am-form-label">生日</label>
                                    <div class="am-form-content birth">
                                        <input type="txt" name="birth" id="datetimepickers" class="am-form-field"
                                               value="<fmt:formatDate value="${sessionScope.customer.birth}" type="date"/>">
                                    </div>

                                </div>
                                <div class="am-form-group">
                                    <label for="phone" class="am-form-label">电话</label>
                                    <div class="am-form-content">
                                        <input id="phone" placeholder="telephonenumber" name="phone" type="tel"
                                               value="${sessionScope.customer.phone}">
                                    </div>
                                </div>
                                <div class="info-btn">
                                    <div class="am-btn am-btn-danger" onclick="customerModify()">保存修改</div>
                                </div>
                            </div>
                        </form>
                        <!--个人信息 -->
                        <div class="info-main">
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
                            <%--<li> <a href="bill.html">账单明细</a></li>--%>
                        </ul>
                    </li>

                    <li class="person">
                        <div class="h5">我的小窝</div>
                        <ul>
                            <li><a href="Collection.jsp">关注</a></li>
                            <li><a href="Foot.jsp">足迹</a></li>
                            <%--<li> <a href="comment.html">评价</a></li>--%>
                            <%--<li> <a href="news.html">消息</a></li>--%>
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
            <p>版权所有 © 2008-2017 中南大学软件学院&nbsp;&nbsp;&nbsp;&nbsp;Benson科技工作室</p>
            <p>京ICP备15003716号-3 | 京ICP证150437号</p>
        </div>
    </div>
</footer>
</body>
<script>
    (function ($) {
        var time_date = $('#datetimepickers');
        time_date.datetimepicker({
            language: 'zh-CN',
            format: 'yyyy-mm-dd',
            todayBtn: true,
            minView: 2,//0 或者 hour: 显示分（默认）;1 或者 days: 显示小时;2 或者 month: 显示天;3 或者 year: 显示月;4 或者 decade: 显示年
            todayHighlight: true, //高亮显示当天日期
            autoclose: true //设置日期后自动关闭
        });
        var date = new Date();
        var dateStr = time_date.attr("value")
        var ymdStr = dateStr.split(" ")[0]
        var ymd = ymdStr.split("-");
        date.setYear(parseInt(ymd[0]))
        date.setMonth(parseInt(ymd[1]) - 1)
        date.setDate(parseInt(ymd[2]))
        //console.log(date.valueOf()+(60*60*24*1000*60));
        time_date.datetimepicker('update', date);
//        time_date.datetimepicker('setStartDate',date); //小于当前日期不可选
//        time_date.datetimepicker('setEndDate', new Date(date.valueOf()+(60*60*24*1000*60))); //间隔超过六十天 不可选
    }(jQuery));
    var imgurl = "";

    function getPhoto(node) {
        var imgURL = "";
        try {
            var file = null;
            if (node.files && node.files[0]) {
                file = node.files[0];
            } else if (node.files && node.files.item(0)) {
                file = node.files.item(0);
            }
            //Firefox 因安全性问题已无法直接通过input[file].value 获取完整的文件路径
            try {
                imgURL = file.getAsDataURL();
            } catch (e) {
                imgRUL = window.URL.createObjectURL(file);
            }
        } catch (e) {
            if (node.files && node.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    imgURL = e.target.result;
                };
                reader.readAsDataURL(node.files[0]);
            }
        }
        creatImg(imgRUL);
        return imgURL;
    }

    function creatImg(imgRUL) {
        $("#headImg")[0].src = imgRUL
    }

    function customerModify() {
        $("#datetimepickers").attr("value", $("#datetimepickers").val())
        $("#form")[0].submit();
    }
</script>
</html>
