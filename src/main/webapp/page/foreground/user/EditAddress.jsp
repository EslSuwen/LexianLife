<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>地址管理</title>

    <link rel="icon" href="../../../img/lexian.jpg" type="image/x-icon"/>
    <script type="text/javascript" src="../../../js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="../../../js/bootstrap.js"></script>
    <script type="text/javascript" src="../../../js/foreground/main.js"></script>
    <script type="text/javascript" src="../../../js/foreground/user.js"></script>
    <link rel="stylesheet" href="../../../style/foreground/user.css">
    <link rel="stylesheet" href="../../../style/bootstrap.css">
    <link rel="stylesheet" href="../../../style/foreground/main.css">
    <script type="text/javascript" src="../../../js/foreground/ProJson.js"></script>


    <link href="../../../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="../../../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="../../../style/foreground/personal.css" rel="stylesheet" type="text/css">
    <link href="../../../style/foreground/addstyle.css" rel="stylesheet" type="text/css">
    <script src="../../../AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="../../../AmazeUI-2.4.2/assets/js/amazeui.js"></script>

</head>

<body>
<c:if test="${sessionScope.updateAddrFail!=null}">
    <%="<script>alert('" + session.getAttribute("updateAddrFail").toString() + "')</script>"%>
    <%session.removeAttribute("updateAddrFail");%>
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

                    <div class="user-address">
                        <!--标题 -->
                        <div class="am-cf am-padding">
                            <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">编辑地址</strong> / <small>Address&nbsp;list</small>
                            </div>
                        </div>
                        <hr/>
                        <div class="clear"></div>
                        <!--例子-->
                        <div class="am-modal am-modal-no-btn" id="doc-modal-1">

                            <div class="add-dress">
                                <div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
                                    <form class="am-form am-form-horizontal" action="/updateAddr" method="post">
                                        <div class="am-form-group">
                                            <label for="user-name" class="am-form-label">收货人</label>
                                            <div class="am-form-content">
                                                <input type="text" id="user-name" name="recName" placeholder="收货人"
                                                       value="${sessionScope.editingAddr.recName}">
                                            </div>
                                        </div>
                                        <div class="am-form-group">
                                            <label for="user-phone" class="am-form-label">手机号码</label>
                                            <div class="am-form-content">
                                                <input id="user-phone" name="phone" placeholder="手机号必填" type="text"
                                                       value="${sessionScope.editingAddr.phone}">
                                            </div>
                                        </div>
                                        <div class="am-form-group">
                                            <label for="postcode" class="am-form-label">邮编</label>
                                            <div class="am-form-content">
                                                <input id="postcode" name="postcode" placeholder="邮政编码" type="text"
                                                       value="${sessionScope.editingAddr.postcode}">
                                            </div>
                                        </div>
                                        <div class="am-form-group">
                                            <label class="am-form-label">所在地</label>
                                            <div class="am-form-content address">
                                                <select name="province" id="cmbProvince">
                                                </select>
                                                <select name="city" id="cmbCity">
                                                </select>
                                                <select name="district" id="cmbArea">
                                                </select>
                                            </div>
                                        </div>

                                        <script type="text/javascript">
                                            addressInit('cmbProvince', 'cmbCity', 'cmbArea', '${sessionScope.editingAddr.province}', '${sessionScope.editingAddr.city}', '${sessionScope.editingAddr.district}');
                                        </script>

                                        <div class="am-form-group">
                                            <label for="user-intro" class="am-form-label">详细地址</label>
                                            <div class="am-form-content">
                                                <textarea class="" rows="3" id="user-intro" name="addr"
                                                          placeholder="输入详细地址">${sessionScope.editingAddr.addr}</textarea>
                                                <small>100字以内写出你的详细地址...</small>
                                            </div>
                                        </div>

                                        <div class="am-form-group">
                                            <div class="am-u-sm-9 am-u-sm-push-3">
                                                <input type="submit" class="am-btn am-btn-success" value="保存"/>
                                                <a href="/manageAddress" class="am-close am-btn am-btn-danger"
                                                   data-am-modal-close>取消</a>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                            </div>

                        </div>

                    </div>

                    <script type="text/javascript">
                        $(document).ready(function () {
                            $(".new-option-r").click(function () {
                                $(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
                            });

                            var $ww = $(window).width();
                            if ($ww > 640) {
                                $("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
                            }

                        })
                    </script>

                    <div class="clear"></div>

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
                            <li><a href="Safety.jsp">安全设置</a></li>
                            <li class="active"><a href="/manageAddress">收货地址</a></li>
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

</html>
