<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../../../assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="../../../css/style.css"/>
    <link href="../../../assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="../../../assets/css/ace.min.css"/>
    <link rel="stylesheet" href="../../../assets/css/font-awesome.min.css"/>
    <!--[if IE 7]>
    <link rel="stylesheet" href="../../../assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="../../../assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="../../../assets/js/jquery.min.js"></script>

    <!-- <![endif]-->

    <!--[if IE]>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <![endif]-->

    <!--[if !IE]> -->

    <script type="text/javascript">
        window.jQuery || document.write("<script src='../../../assets/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
    </script>

    <!-- <![endif]-->

    <!--[if IE]>
    <script type="text/javascript">
        window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>" + "<" + "/script>");
    </script>
    <![endif]-->

    <script type="text/javascript">
        if ("ontouchend" in document) document.write("<script src='../../../assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
    </script>
    <script src="../../../assets/js/bootstrap.min.js"></script>
    <script src="../../../assets/js/typeahead-bs2.min.js"></script>
    <!-- page specific plugin scripts -->
    <script src="../../../assets/js/jquery.dataTables.min.js"></script>
    <script src="../../../assets/js/jquery.dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="../../../js/manager/H-ui.js"></script>
    <script type="text/javascript" src="../../../js/manager/H-ui.admin.js"></script>
    <script src="../../../assets/layer/layer.js" type="text/javascript"></script>
    <script src="../../../assets/laydate/laydate.js" type="text/javascript"></script>
    <title>用户列表</title>
</head>

<body>
<div class="page-content clearfix">
    <div id="Member_Ratings">
        <div class="d_Confirm_Order_style">
            <!---->
            <div class="table_menu_list">
                <table class="table table-striped table-bordered table-hover" id="sample-table">
                    <thead>
                    <tr>
                        <th width="80">ID</th>
                        <th width="100">登录名</th>
                        <th width="100">昵称</th>
                        <th width="80">性别</th>
                        <th width="250">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${users}" var="users" varStatus="state">
                        <tr>
                            <td>${users.cusId}</td>
                            <td>${users.username}</td>
                            <td>${users.nickname}</td>
                            <td>${users.sex == 1 ? "男" : "女"}</td>
                            <td class="td-manage">
                                <a onClick="Browse_history(${users.cusId})" href="javascript:;" title="浏览记录"
                                   class="btn btn-xs btn-defaunt"><i class="fa fa-ok  bigger-120"></i>浏览记录</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!--浏览记录-->
<div id="Browse_history" style="display:none; padding:10px">
    <table class="table table-striped table-bordered table-hover" id="Browse_history_list" width="100%">
        <thead>
        <tr>
            <th>用户</th>
            <th>产品名称</th>
            <th>价格(元)</th>
            <th>时间</th>
        </tr>
        </thead>
        <tbody id="tbody">
        </tbody>
    </table>


</div>
<script>
    jQuery(function ($) {
        var oTable1 = $('#sample-table').dataTable({
            "aaSorting": [[1, "desc"]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable": false, "aTargets": [0, 8, 9]}// 制定列不参与排序
            ]
        });


        $('table th input:checkbox').on('click', function () {
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox')
                .each(function () {
                    this.checked = that.checked;
                    $(this).closest('tr').toggleClass('selected');
                });

        });


        $('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});

        function tooltip_placement(context, source) {
            var $source = $(source);
            var $parent = $source.closest('table')
            var off1 = $parent.offset();
            var w1 = $parent.width();

            var off2 = $source.offset();
            var w2 = $source.width();

            if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2)) return 'right';
            return 'left';
        }
    })

</script>
<script>
    //浏览记录
    function Browse_history(id) {
        $.ajax({
            url: '/manager/customer/record.do',
            type: 'POST',
            cache: false,
            data: {id: id},
            success: function (data) {
                console.log(data)
                if (data.status) {
                    layer.open({
                        type: 1,
                        title: '浏览记录',
                        area: ['1000px', '400px'],
                        shadeClose: true,
                        content: $('#Browse_history'),
                    })
                    var table = $('#Browse_history_list').DataTable();
                    table.destroy();
                    $("#tbody").empty();
                    $('#Browse_history_list').DataTable({
                        data: data.msg,
                        columns: [
                            {data: "用户"},
                            {data: "产品名称"},
                            {data: "价格(元)"},
                            {data: "加入时间"},
                        ],
                        "aaSorting": [[1, "desc"]],//默认第几个排序
                        "bStateSave": true,//状态保存
                        "aoColumnDefs": [
                            //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                            {"orderable": false, "aTargets": [0, 1]}// 制定列不参与排序
                        ]
                    });
                } else {
                    layer.msg("查询失败", {icon: data.status, time: 1000}, function () {
                    });
                }
            }
        })
    }


</script>
</body>
</html>

