<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link href="../../../assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="../../../css/style.css"/>
    <link href="../../../assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="../../../assets/css/ace.min.css"/>
    <link rel="stylesheet" href="../../../fonts/css/font-awesome.min.css"/>
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="../../../assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="../../../js/manager/jquery-1.9.1.min.js"></script>
    <script src="../../../assets/js/bootstrap.min.js"></script>
    <script src="../../../assets/js/typeahead-bs2.min.js"></script>
    <script src="../../../assets/js/jquery.dataTables.min.js"></script>
    <script src="../../../assets/js/jquery.dataTables.bootstrap.js"></script>
    <script src="../../../assets/layer/layer.js" type="text/javascript"></script>
    <script src="../../../assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="../../../js/manager/lrtk.js" type="text/javascript"></script>
    <title>订单处理</title>
</head>

<body>
<div class="clearfix">
    <div class="handling_style" id="order_hand">
        <div id="scrollsidebar" class="left_Treeview">
            <div class="show_btn" id="rightArrow"><span></span></div>
            <div class="widget-box side_content">
                <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
                <div class="side_list">
                    <div class="widget-header header-color-green2"><h4 class="lighter smaller">订单操作</h4></div>
                    <div class="widget-body">
                        <ul class="b_P_Sort_list">
                            <li><i class="orange  fa fa-reorder"></i><a onclick="showAll()" href="#">全部订单</a></li>
                            <li><i class="fa fa-sticky-note pink "></i> <a onclick="showOrder(0)" href="#">未付款</a></li>
                            <li><i class="fa fa-sticky-note pink "></i> <a onclick="showOrder(1)" href="#">已支付</a></li>
                            <li><i class="fa fa-sticky-note pink "></i> <a onclick="showOrder(2)" href="#">待发货</a></li>
                            <li><i class="fa fa-sticky-note pink "></i> <a onclick="showOrder(4)" href="#">待收货</a></li>
                            <li><i class="fa fa-sticky-note pink "></i> <a onclick="showOrder(5)" href="#">已完成</a></li>
                            <li><i class="fa fa-sticky-note pink "></i> <a onclick="showOrder(6)" href="#">被删除</a></li>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="order_list_style" id="order_list_style">
            <div class="search_style" style="display: none">

                <ul class="search_content clearfix">
                    <li><label class="l_f">订单编号</label><input name="" type="text" class="text_add" placeholder="输入订单编号"
                                                              style=" width:250px"/></li>
                    <li><label class="l_f">交易时间</label><input class="inline laydate-icon" id="start"
                                                              style=" margin-left:10px;"></li>
                    <li style="width:90px;">
                        <button type="button" class="btn_search"><i class="fa fa-search"></i>查询</button>
                    </li>
                </ul>
            </div>
            <!--交易订单列表-->
            <div class="Orderform_list">
                <table class="table table-striped table-bordered table-hover" id="sample-table">
                    <thead>
                    <tr>
                        <th>订单编号</th>
                        <th>产品名称</th>
                        <th>交易金额</th>
                        <th>付款时间</th>
                        <th>付款方式</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="tbody"></tbody>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<script>


    var products = [];

    var add = [];
    <c:forEach items = "${orders}" var = "orders" varStatus="state">
    if (typeof (products[${orders.status}]) == "undefined") {
        products[${orders.status}] = [];
    }
    <%--console.log(typeof (products[${goods.category.categoryId}]))--%>
    add = {
        "订单编号": "${orders.orderNum}",
        "产品名称":
            <c:forEach items="${orders.orderItems}" var="item">
            "${item.goods.name}," +
            </c:forEach> "",
        "交易金额": "${orders.amount}",
        "付款时间": "${orders.payTime}",
        "付款方式": "${orders.payWay.name}",
        "状态":
            <c:if test="${orders.status == 0}">
            "<span class=\"label label-danger radius\">未付款</span>",
        </c:if>
        <c:if test="${orders.status == 1}">
        "<span class=\"label label-success radius\">已支付</span>",
        </c:if>
        <c:if test="${orders.status == 2}">
        "<span class=\"label label-warning radius\">待发货</span>",
        </c:if>
        <c:if test="${orders.status == 4}">
        "<span class=\"label label-success radius\">待收货</span>",
        </c:if>
        <c:if test="${orders.status == 5}">
        "<span class=\"label label-success radius\">已完成</span>",
        </c:if>
        <c:if test="${orders.status == 6}">
        "<span class=\"label label-danger radius\">已删除</span>",
        </c:if>
        "操作":
            <c:if test="${orders.status == 1}">
            " <a onClick=\"Delivery_stop(this,${orders.orderId}, 2)\"  href=\"javascript:;\" title=\"确认订单\"  class=\"btn btn-xs btn-success\"><i class=\"fa fa-ok bigger-120\"></i>确认订单</a> " +
            </c:if>
            <c:if test="${orders.status == 2}">
            " <a onClick=\"Delivery_stop(this,${orders.orderId}, 4)\"  href=\"javascript:;\" title=\"发货\"  class=\"btn btn-xs btn-success\"><i class=\"fa fa-cubes bigger-120\"></i></a> " +
            </c:if>
            "<a title=\"订单详细\" href=\"/admin/order/order_detailed.do?id=${orders.orderId}\" class=\"btn btn-xs btn-info order_detailed\" ><i class=\"fa fa-list bigger-120\"></i></a>"

    }
    products[${orders.status}].push(add);
    </c:forEach>

    //        console.log(products)

    function showOrder(id) {
        var table = $('#sample-table').DataTable();
        table.destroy();
        $("#tbody").empty();
        $('#sample-table').DataTable({
            data: products[id],
            columns: [
                {data: "订单编号", "width": "15%"},
                {data: "产品名称", "width": "15%"},
                {data: "交易金额", "width": "10%"},
                {data: "付款时间", "width": "15%"},
                {data: "付款方式", "width": "10%"},
                {data: "状态", "width": "10%"},
                {data: "操作", "width": "15%"},
            ],
            "autoWidth": true,
            "aaSorting": [[1, "desc"]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                {"orderable": false, "aTargets": [1, 6]}// 制定列不参与排序
            ]
        });
    }

    showAll()

    function showAll() {
        var init = [];
        $.each(products, function (key, value) {
            if (typeof (value) != "undefined") {
                $.each(value, function (k, v) {
                    init.push(v)
                })
            }
        })
//        console.log(init)
        var table = $('#sample-table').DataTable();
        table.destroy();
        $("#tbody").empty();
        $('#sample-table').DataTable({
            data: init,
            columns: [
                {data: "订单编号", "width": "15%"},
                {data: "产品名称", "width": "15%"},
                {data: "交易金额", "width": "10%"},
                {data: "付款时间", "width": "15%"},
                {data: "付款方式", "width": "10%"},
                {data: "状态", "width": "10%"},
                {data: "操作", "width": "15%"},
            ],
            "aaSorting": [[1, "desc"]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable": false, "aTargets": [1, 6]}// 制定列不参与排序
            ]
        });
    }

</script>


<script>
    $(function () {
        $("#order_hand").fix({
            float: 'left',
            //minStatue : true,
            skin: 'green',
            durationTime: false,
            spacingw: 30,//设置隐藏时的距离
            spacingh: 250,//设置显示时间距
            table_menu: '.order_list_style',
        });
    });


    //时间
    laydate({
        elem: '#start',
        event: 'focus'
    });
    //初始化宽度、高度
    $(".widget-box").height($(window).height());
    $(".order_list_style").width($(window).width() - 220);
    $(".order_list_style").height($(window).height() - 30);
    //当文档窗口发生改变时 触发
    $(window).resize(function () {
        $(".widget-box").height($(window).height());
        $(".order_list_style").width($(window).width() - 234);
        $(".order_list_style").height($(window).height() - 30);
    });

    /**发货**/
    function Delivery_stop(obj, id, status) {
        $.ajax({
            url: '/admin/order/change_status.do',
            type: 'POST',
            dataType: "JSON",
            data: {status: status, id: id},
            success: function (data) {
                if (data.status) {
                    layer.msg("修改成功", {icon: data.status, time: 1000}, function () {
                        location.reload();
                    });
                } else {
                    layer.msg("修改失败", {icon: data.status, time: 1000}, function () {
                    });
                }
            }
        })
    };
</script>
