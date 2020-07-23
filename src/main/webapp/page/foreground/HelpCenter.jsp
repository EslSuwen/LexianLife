<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dengxiaobing
  Date: 2017/9/25
  Time: 下午7:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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

    <title>帮助中心</title>
</head>
<body>
<!---->
<header>
    <div class="topBox">
        <div class="pull-right">
            <ul class="topList">
                <li>
                    <c:if test="${sessionScope.customer==null}">
                        <a href="../../page/foreground/user/Login.jsp">登录</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/page/foreground/user/Register.jsp">注册</a>
                    </c:if>
                    <c:if test="${sessionScope.customer!=null}">
                        欢迎,<a href="../../page/foreground/user/UserCenter.jsp">${sessionScope.customer.username}</a>
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
                        <img src="../../img/lexian.jpg" class="img-circle" style="width: 150px;height: 150px;">
                        <img src="../../img/lexiantxt.png" class="img-rounded" style="width: 200px;"/>
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
                            <c:forEach items="${sessionScope.catalogs}" begin="1" end="5" var="catalog">
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
    <h2>新手指南</h2><br>
    <ul>
        <li><h3>一、注册/登录</h3>
            <ul>
                <li>
                    <h4>1、如何注册登录?</h4>
                    进入“注册页面”，设置用户名（您的账户名和登录名）、设置登录密码（建议至少使用两种字符组合）、确认登录密码（请再次输入密码）、验证码（请输入验证码）、手机验证（请输入手机验证码）、勾选“买买用户注册协议”点击“立即注册”即完成注册。
                </li>
                <li>
                    <h4>2、如何修改登陆密码？</h4>
                    进入我的买买，进入“我的买买-安全中心”，点击下图中“登录密码”后的“修改”，根据引导即可完成密码修改。
                </li>
                <li>
                    <h4>3、登录密码怎么设置比较安全？</h4>
                    登录密码可以包含数字、特殊符号和英文字母（区分大小写），至少6位字符，不超过20位字符，不含空格。为了提高账户安全性， 建议不要设置纯字母或纯数字形式。
                </li>
                <li>
                    <h4>4、忘记账户或昵称怎么办？</h4>
                    若您忘记账户或昵称，请联系买买客服人员为您处理。
                </li>
                <li>
                    <h4>5、如何验证/绑定手机？</h4>
                    登录买买账户，在“我的买买—安全中心-手机绑定”里，可以完成手机验证。
                    点击“手机绑定”，输入“手机号、手机验证码、手机动态验证码”提交即可进行手机绑定；
                </li>
            </ul>
        </li>
        <li>
            <h3>二、购买流程</h3>
            <ul>
                <li>
                    <h4>1、如何购买下单？</h4>
                    下单操作步骤：<br>
                    浏览您要购买的商品，点击“加入购物车”，商品会自动添加到购物车里；<br>
                    如果您需要更改商品数量，需在商品数量框中输入购买数量；<br>
                    选好商品后点击“去结算”； <br>
                    填写收货信息和支付及配送方式，然后点击提交订单即可。
                </li>
                <li>
                    <h4>2、如何查询红包？</h4>
                    登陆买买，进入“我的买买-我的钱包-我的红包”查看，在此可查看可用红包、过期红包、已使用红包
                </li>
                <li>
                    <h4>3、如何填写收货地址？</h4>
                    填写收货地址的操作步骤：<br>
                    步骤一：先登陆买买，点击买买首页右上角【我的买买】；<br>
                    步骤二：点击【我的买买】-【地址管理】进入地址填写页面，然后点击【新增收货地址】即可输入您的收货地址。.
                </li>
            </ul>
        </li>
    </ul>
    <ul>


        <h2>常见问题</h2>
        <li>
            <h3>一、查询订单</h3>
            <ul>
                <li>
                    <h4>1、刚刚我下了订单，我想查询下我的订单，如何查询？</h4>
                    在买买首页右上角点击【我的订单】即可查询到下单记录。
                </li>
                <li>
                    <h4>2、如何在手机上查询订单？</h4>
                    点击【买家】­­-【我的订单】即可查询到下单情况
                </li>
            </ul>
        <li>
            <h3>二、提交订单</h3>
            <ul>
                <li>
                    <h4>1、为什么我的订单总是无法提交成功？<br></h4>
                    可能存在以下几种情况：<br>
                    （1）订单信息填写不完整；<br>
                    （2）订单商品库存不足或者库存无货；<br>
                    （3）订单商品不能配送到您所填写的收货地址；<br>
                    （4）网络延时；<br>
                    以上各种情况都会在页面中弹出提示信息，可以通过修改订单信息（提示信息）或者稍后再试，即可成功提交订单。
                </li>
                <li>
                    <h4>2、订单多付款怎么办？</h4>
                    多付款的订单，在订单完成之后，系统会自动把多支付的款项退还给您。一般款项是退至买买账户余额，请您注意查收即可。
                </li>
                <li>
                    <h4>3、订单少支付怎么办？</h4>
                    如果订单少支付了，请刷新页面，重新点击“支付”按钮支付剩余金额即可。
                </li>
            </ul>
        </li>
        <li>
            <h3>三、取消订单</h3>
            <ul>
                <li>
                    <h4>1、怎么查询我的订单是否取消成功？</h4>
                    进入【我的订单】查询您订单状态，取消成功订单状态显示【已取消】
                </li>
                <li>
                    <h4>2、如何取消订单？<br></h4>
                    创建订单后，如下条件可以取消订单：<br>
                    （1）已选购商品并创建订单，但未成功支付的订单。您可以在“我的订单”页，对应的订单操作栏中选择"取消订单"，点击按钮即可完成取消；<br>
                    （2）已成功生成订单并完成支付，正在等待审核的订单。您可以在“我的订单”页，对应的订单操作栏中选择"取消订单"。<br>
                </li>
                <li>
                    <h4>3、订单取消后还能恢复吗？<br></h4>
                    订单一旦取消，将无法恢复，请您慎重操作。
                </li>
                <li>
                    <h4>4、订单拒收后，退款什么时候返还？<br></h4>
                    买买商品订单拒收后，在线支付订单您可以在前台提交退款申请，也可以联系客服为您提交退款申请，待商品返回，我司为您审核退款，退款审核成功后，将在1-3个工作日自动退回账户，如您的订单退款超过退款周期仍未收到退款，请您联系客服进行处理。
                </li>
            </ul>
        </li>
    </ul>
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
<script type="text/javascript " src="../../js/foreground/quick_links.js "></script>
</html>
