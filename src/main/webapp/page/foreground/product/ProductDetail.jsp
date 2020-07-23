<%@ taglib prefix="cfmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dengxiaobing
  Date: 2017/9/21
  Time: 下午2:54
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

    <link href="../../../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="../../../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="../../../style/foreground/demo.css" rel="stylesheet" type="text/css">
    <link href="../../../style/foreground/optstyle.css" rel="stylesheet" type="text/css">
    <link href="../../../style/foreground/style.css" rel="stylesheet" type="text/css">
    <script src="../../../js/foreground/quick_links.js" type="text/javascript"></script>
    <script src="../../../AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../../js/foreground/jquery.imagezoom.min.js"></script>
    <script type="text/javascript" src="../../../js/foreground/jquery.flexslider.js"></script>
    <script type="text/javascript" src="../../../js/foreground/list.js"></script>
    <script type="text/javascript">
    </script>
    <title>商品详情</title>
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
    <div class="listMain">
        <div class="item-inform">
            <div class="clearfixLeft" id="clearcontent">
                <div class="box">
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $(".jqzoom").imagezoom();
                            $("#thumblist li a").click(function () {
                                $(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
                                $(".jqzoom").attr('src', $(this).find("img").attr("mid"));
                                $(".jqzoom").attr('rel', $(this).find("img").attr("big"));
                            });
                        });
                    </script>

                    <div class="tb-booth tb-pic tb-s310">
                        <a href="../../../img/goodsImg/${requestScope.viewGoods.goodsId}_s_1.jpg"><img
                                src="../../../img/goodsImg/${requestScope.viewGoods.goodsId}_m_1.jpg" alt=""
                                class="jqzoom" rel="../../../img/goodsImg/${requestScope.viewGoods.goodsId}_b_1.jpg"
                                style="cursor: crosshair;"></a>
                    </div>
                    <ul class="tb-thumb" id="thumblist">
                        <c:forEach begin="1" end="5" varStatus="status">
                            <li <c:if test="${status.index==1}">class="tb-selected"</c:if>>
                                <div class="tb-pic tb-s40">
                                    <a href="#"><img
                                            src="../../../img/goodsImg/${requestScope.viewGoods.goodsId}_s_${status.index}.jpg"
                                            mid="../../../img/goodsImg/${requestScope.viewGoods.goodsId}_m_${status.index}.jpg"
                                            big="../../../img/goodsImg/${requestScope.viewGoods.goodsId}_b_${status.index}.jpg"></a>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

                <div class="clear"></div>
            </div>

            <div class="clearfixRight">

                <!--规格属性-->
                <!--名称-->
                <div class="tb-detail-hd">
                    <h1>
                        ${requestScope.viewGoods.name}
                    </h1>
                </div>
                <div class="tb-detail-list">
                    <!--价格-->
                    <div class="tb-detail-price">
                        <li class="price iteminfo_price">
                            <dt>价格</dt>
                            <dd><em>¥</em><b class="sys_item_price">${requestScope.viewGoods.unitPrice}</b></dd>
                        </li>
                        <li class="price iteminfo_mktprice">
                            <dt>重量</dt>
                            <dd>${requestScope.viewGoods.weight}kg</b></dd>
                        </li>
                        <div class="clear"></div>
                    </div>

                    <!--地址-->
                    <%--<dl class="iteminfo_parameter freight">
                        <dt>配送至</dt>
                        <div class="iteminfo_freprice">
                            <div class="am-form-content address">
                                <select data-am-selected="" style="display: none;">
                                    <option value="a">浙江省</option>
                                    <option value="b">湖北省</option>
                                </select><div class="am-selected am-dropdown" id="am-selected-x5ym8" data-am-dropdown="">  <button type="button" class="am-selected-btn am-btn am-dropdown-toggle am-btn-default">    <span class="am-selected-status am-fl">浙江省</span>    <i class="am-selected-icon am-icon-caret-down"></i>  </button>  <div class="am-selected-content am-dropdown-content" style="min-width: 62px;">    <h2 class="am-selected-header"><span class="am-icon-chevron-left">返回</span></h2>       <ul class="am-selected-list">                     <li class="am-checked" data-index="0" data-group="0" data-value="a">         <span class="am-selected-text">浙江省</span>         <i class="am-icon-check"></i></li>                                 <li class="" data-index="1" data-group="0" data-value="b">         <span class="am-selected-text">湖北省</span>         <i class="am-icon-check"></i></li>            </ul>    <div class="am-selected-hint"></div>  </div></div>
                            </div>
                            <div class="pay-logis">
                                快递<b class="sys_item_freprice">10</b>元
                            </div>
                        </div>
                    </dl>--%>
                    <div class="clear"></div>

                    <!--销量-->
                    <ul class="tm-ind-panel">
                        <li class="tm-ind-item tm-ind-sellCount canClick">
                            <div class="tm-indcon"><span class="tm-label">月销量</span><span
                                    class="tm-count">${requestScope.monthSaleCount}</span></div>
                        </li>
                        <li class="tm-ind-item tm-ind-sumCount canClick">
                            <div class="tm-indcon"><span class="tm-label">累计销量</span><span
                                    class="tm-count">${requestScope.viewGoods.saleCount}</span></div>
                        </li>
                        <li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
                            <div class="tm-indcon"><span class="tm-label">累计评价</span><span
                                    class="tm-count">${requestScope.goodCount+requestScope.midCount+requestScope.badCount}</span>
                            </div>
                        </li>
                    </ul>
                    <div class="clear"></div>

                    <!--各种规格-->
                    <dl class="iteminfo_parameter sys_item_specpara">
                        <dt class="theme-login">
                            <div class="cart-title">可选规格<span class="am-icon-angle-right"></span></div>
                        </dt>
                        <dd>
                            <!--操作页面-->

                            <div class="theme-popover-mask"></div>

                            <div class="theme-popover">
                                <div class="theme-span"></div>
                                <div class="theme-poptit">
                                    <a href="javascript:;" title="关闭" class="close">×</a>
                                </div>
                                <div class="theme-popbod dform">
                                    <form class="theme-signin" name="loginform" action="" method="post">

                                        <div class="theme-signin-left">

                                            <div class="theme-options">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <div class="cart-title">单位</div>
                                                        </td>
                                                        <td>${requestScope.viewGoods.unit}</td>
                                                    </tr>
                                                </table>

                                            </div>
                                            <div class="theme-options">
                                                <div class="cart-title number">数量</div>
                        <dd>
                            <input id="min" class="am-btn am-btn-default" name="" type="button" value="-"
                                   disabled="disabled">
                            <input id="text_box" name="" type="text" value="1" style="width:30px;">
                            <input id="add" class="am-btn am-btn-default" name="" type="button" value="+">
                            <span id="Stock" class="tb-hidden">库存<span
                                    class="stock">${requestScope.viewGoods.inventory}</span>${requestScope.viewGoods.unit}</span>
                        </dd>

                </div>
                <div class="clear"></div>

                <div class="btn-op">
                    <div class="btn am-btn am-btn-warning">确认</div>
                    <div class="btn close am-btn am-btn-warning">取消</div>
                </div>
            </div>
            <div class="theme-signin-right">
                <div class="img-info">
                    <img src="../../../img/images/songzi.jpg">
                </div>
                <div class="text-info">
                    <span class="J_Price price-now">¥39.00</span>
                    <span id="Stock" class="tb-hidden">库存<span class="stock">1000</span>件</span>
                </div>
            </div>

            </form>
        </div>
    </div>

    </dd>
    </dl>
    <div class="clear"></div>
    <!--活动	-->
    <div class="shopPromotion gold">
        <div class="hot">
            <dt class="tb-metatit">上架时间</dt>
            <div class="gold-list">
                <p><cfmt:formatDate value="${requestScope.viewGoods.onsaleTime}" pattern="yyyy-MM-dd"/></p>
            </div>
        </div>
    </div>
    </div>

    <div class="pay">
        <div class="pay-opt">
            <a href="home.html"><span class="am-icon-home am-icon-fw">首页</span></a>
            <a><span class="am-icon-heart am-icon-fw">收藏</span></a>

        </div>
        <li>
            <div class="clearfix tb-btn tb-btn-buy theme-login">
                <a id="LikBuy" title="点此按钮到下一步确认购买信息" href="javascript:void(0)" onclick="buyNow()">立即购买</a>
            </div>
        </li>
        <li>
            <div class="clearfix tb-btn tb-btn-basket theme-login">
                <a id="LikBasket" title="加入购物车" href="javascript:void(0);" onclick="addCart()"><i></i>加入购物车</a>
            </div>
        </li>
    </div>

    </div>

    <div class="clear"></div>

    </div>
    </div>
    <div class="container">
        <div class="introduce">
            <div class="introduceMain">
                <div class="am-tabs" data-am-tabs="">
                    <ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs" otop="996.78125"
                        style="position: static; top: 0px; z-index: 998;">
                        <li class="am-active">
                            <a href="#">

                                <span class="index-needs-dt-txt">宝贝详情</span></a>

                        </li>

                        <li>
                            <a href="#">

                                <span class="index-needs-dt-txt">全部评价</span></a>

                        </li>

                        <li>
                            <a href="#">

                                <span class="index-needs-dt-txt">猜你喜欢</span></a>
                        </li>
                    </ul>

                    <div class="am-tabs-bd"
                         style="touch-action: pan-y; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">

                        <div class="am-tab-panel am-fade am-in am-active">
                            <div class="J_Brand">

                                <div class="attr-list-hd tm-clear">
                                    <h4>产品参数：</h4></div>
                                <div class="clear"></div>
                                <ul id="J_AttrUL">
                                    <c:forEach items="${requestScope.viewGoods.goodsAttrs}" var="attr">
                                        <li title="">${attr.name}:&nbsp;${attr.value}</li>
                                    </c:forEach>
                                    <%-- <li title="">原料产地:&nbsp;巴基斯坦</li>
                                     <li title="">产地:&nbsp;湖北省武汉市</li>
                                     <li title="">配料表:&nbsp;进口松子、食用盐</li>
                                     <li title="">产品规格:&nbsp;210g</li>
                                     <li title="">保质期:&nbsp;180天</li>
                                     <li title="">产品标准号:&nbsp;GB/T 22165</li>
                                     <li title="">生产许可证编号：&nbsp;QS4201 1801 0226</li>
                                     <li title="">储存方法：&nbsp;请放置于常温、阴凉、通风、干燥处保存 </li>
                                     <li title="">食用方法：&nbsp;开袋去壳即食</li>--%>
                                </ul>
                                <div class="clear"></div>
                            </div>

                            <div class="details">
                                <div class="attr-list-hd after-market-hd">
                                    <h4>商品细节</h4>
                                </div>
                                <div class="twlistNews">
                                    <c:forEach begin="1" end="7" varStatus="status">
                                        <img src="../../../img/goodsImg/${requestScope.viewGoods.goodsId}_d_${status.index}.jpg">
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="clear"></div>

                        </div>

                        <div class="am-tab-panel am-fade">


                            <div class="clear"></div>
                            <div class="tb-r-filter-bar">
                                <ul class=" tb-taglist am-avg-sm-4">
                                    <li class="tb-taglist-li tb-taglist-li-current">
                                        <div class="comment-info">
                                            <span>全部评价</span>
                                            <span class="tb-tbcr-num">(${requestScope.goodCount+requestScope.midCount+requestScope.badCount})</span>
                                        </div>
                                    </li>

                                    <li class="tb-taglist-li tb-taglist-li-1">
                                        <div class="comment-info">
                                            <span>好评</span>
                                            <span class="tb-tbcr-num">${requestScope.goodCount}</span>
                                        </div>
                                    </li>

                                    <li class="tb-taglist-li tb-taglist-li-0">
                                        <div class="comment-info">
                                            <span>中评</span>
                                            <span class="tb-tbcr-num">(${requestScope.midCount})</span>
                                        </div>
                                    </li>

                                    <li class="tb-taglist-li tb-taglist-li--1">
                                        <div class="comment-info">
                                            <span>差评</span>
                                            <span class="tb-tbcr-num">(${requestScope.badCount})</span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="clear"></div>

                            <ul class="am-comments-list am-comments-list-flip" id="commentsBox">

                            </ul>

                            <div class="clear"></div>

                            <!--分页 -->
                            <ul class="am-pagination am-pagination-right">
                                <li class="am-disabled"><a href="#">«</a></li>
                                <li class="am-active"><a href="#">1</a></li>
                                <%--<li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">»</a></li>--%>
                            </ul>
                            <div class="clear"></div>

                            <div class="tb-reviewsft">
                                <div class="tb-rate-alert type-attention">购买前请查看该商品的 <a href="#"
                                                                                        target="_blank">购物保障</a>，明确您的售后保障权益。
                                </div>
                            </div>

                        </div>

                        <div class="am-tab-panel am-fade">
                            <div class="like">
                                <ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes" id="mayLikeBox">
                                </ul>
                            </div>
                            <div class="clear"></div>

                            <%--  <!--分页 -->
                              <ul class="am-pagination am-pagination-right" id="pages">
                                  <li class="am-disabled"><a href="#">«</a></li>
                                 <li class="am-active"><a href="#">1</a></li>
                                &lt;%&ndash;  <li><a href="#">2</a></li>
                                  <li><a href="#">3</a></li>
                                  <li><a href="#">4</a></li>
                                  <li><a href="#">5</a></li>
                                  <li><a href="#">»</a></li>&ndash;%&gt;
                              </ul>--%>
                            <div class="clear"></div>

                        </div>

                    </div>

                </div>

                <div class="clear"></div>

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
    $(document).ready(function () {
        queryComments(1)
        loadMayLike()
    })

    function queryComments(pageIndex) {
        var url = "/queryComments.do"
        var data = {goods_id:${requestScope.viewGoods.goodsId}, pageIndex: pageIndex}
        $.getJSON(url, data, function (json) {
            var comments = json.comments;
            var pageCount = json.pageCount;
            $.each(comments, function (n, item) {
                var li = "<li class='am-comment'><img class='am-comment-avatar' src='../../../img/images/hwbn40x40.jpg'><div class='am-comment-main'> <header class='am-comment-hd'> <div class='am-comment-meta'> <a href='#link-to-user' class='am-comment-author'>" + item.name + " (匿名)</a>评论于 <time datetime=''>" + item.time + "</time></div> </header> <div class='am-comment-bd'> <div class='tb-rev-item' data-id='255776406962'> <div class='J_TbcRate_ReviewContent tb-tbcr-content '>" + item.content + "</div> </div> </div></div> </li>"
                $("#commentsBox").append(li)
            })
        })

    }

    function updatePage(pageIndex, pageCount) {

//        var pages  = ""
//        if(pageIndex==1)
//            pages += "<li class='am-disabled'><a href='#'>&laquo;</a></li>"
//        else
        <%--pages += "<li><a href='/viewCategory.do?categoryId=${requestScope.viewCategory.categoryId}&pageIndex=${requestScope.page.getNumber()}&sort=${sessionScope.sort}'>&laquo;</a></li></c:if><c:choose>&lt;%&ndash;总页数小于等于5，把所有页显示出来&ndash;%&gt;<c:when test='${requestScope.page.getTotalPages()<5}'><c:set var='begin' value='1'/><c:set var='end' value='${requestScope.page.getTotalPages()}'/></c:when>&lt;%&ndash;总页数>5的话，计算begin和end&ndash;%&gt;<c:otherwise><c:set var='begin' value='${requestScope.page.getNumber()-1}'/><c:set var='end' value=${requestScope.page.getNumber()+3}'/>&lt;%&ndash;处理头溢出&ndash;%&gt;<c:if test='${begin<1}'><c:set var='begin' value='1'/><c:set var='end' value='5'/></c:if>&lt;%&ndash;处理尾溢出&ndash;%&gt;<c:if test='${end>requestScope.page.getTotalPages()}'><c:set var='begin' value='${requestScope.page.getTotalPages()-4}'/><c:set var='end' value='${requestScope.page.getTotalPages()}'/></c:if></c:otherwise></c:choose><c:forEach begin='${begin}' end='${end}' var='i'><c:choose><c:when test='${i==requestScope.page.getNumber()+1}'> <li class='am-active'><a href='#'>${i}</a></li></c:when><c:otherwise> <li><a href='/viewCategory.do?categoryId=${requestScope.viewCategory.categoryId}&pageIndex=${i}&sort=${sessionScope.sort}'>${i}</a></li></c:otherwise></c:choose></c:forEach><c:if test='${requestScope.page.getNumber()+1<end}'> <li><a href='/viewCategory.do?categoryId=${requestScope.viewCategory.categoryId}&pageIndex=${requestScope.page.getNumber()+2}&sort=${sessionScope.sort}'>&raquo;</a></li></c:if><c:if test='${requestScope.page.getNumber()+1==end}'> <li class='am-disabled'><a href='#'>&raquo;</a></li></c:if>"--%>
//        $("#pages").html("")
    }

    function addCart() {
        var url = "/addToCart.do?goods_id=${requestScope.viewGoods.goodsId}&num=" + $("#text_box").val();
        $("<a href='" + url + "'>aaa</a>")[0].click("")
    }

    function buyNow() {
        var url = "/buyNow.do?goods_id=${requestScope.viewGoods.goodsId}&num=" + $("#text_box").val();
        $("<a href='" + url + "'>aaa</a>")[0].click("")
    }

    function loadMayLike() {
        var url = "/queryMayLike.do"
        $.getJSON(url, function (array) {
            $.each(array, function (n, obj) {
                var li = "<li> <div class='i-pic limit'> <a href='/viewGoods.do?goods_id=" + obj.goods_id + "'> <img src='" + obj.img + "'></a> <p><a href='/viewGoods.do?goods_id=" + obj.goods_id + "'> " + obj.name + "</a></p> <p class='price fl'> <b>¥</b> <strong>" + obj.unitPrice + "</strong> </p> </div> </li>"
                $("#mayLikeBox").append(li)
            })
        })
    }
</script>
</html>
