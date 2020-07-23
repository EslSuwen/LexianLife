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
                        <th width="">昵称</th>
                        <th width="100">姓名</th>
                        <th width="80">性别</th>
                        <th width="120">手机</th>
                        <th width="150">邮箱</th>
                        <th width="180">出生日期</th>
                        <th width="70">状态</th>
                        <th width="250">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${users}" var="users" varStatus="state">
                        <tr>
                            <td>${users.cusId}</td>
                            <td>${users.username}</td>
                            <td>${users.nickname}</td>
                            <td>${users.realname}</td>
                            <td>${users.sex == 1 ? "男" : "女"}</td>
                            <td>${users.phone}</td>
                            <td>${users.email}</td>
                            <td>${users.birth}</td>
                            <td class="td-status">
                                <c:if test="${users.status == 1}">
                                    <span class="label label-success radius">已启用</span></c:if>
                                <c:if test="${users.status == 0}">
                                    <span class="label label-defaunt radius">已禁用</span></c:if>
                            </td>
                            <td class="td-manage">
                                <c:if test="${users.status == 1}">
                                    <a onClick="member_stop(this,${users.cusId})" href="javascript:;" title="停用"
                                       class="btn btn-xs btn-success"><i
                                            class="fa fa-check  bigger-120"></i>停用</a></c:if>
                                <c:if test="${users.status == 0}">
                                    <a onClick="member_start(this,${users.cusId})" href="javascript:;" title="启用"
                                       class="btn btn-xs btn-defaunt"><i
                                            class="fa fa-check  bigger-120"></i>启用</a></c:if>
                                <a title="删除" href="javascript:;" onclick="member_del(this,${users.cusId})"
                                   class="btn btn-xs btn-warning"><i class="icon-trash  bigger-120"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
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

    /*用户-停用*/
    function member_stop(obj, id) {
        layer.confirm('确认要停用吗？', function (index) {
            statusChange(id, false)
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="icon-ok bigger-120"></i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
            $(obj).remove();
            layer.msg('已停用!', {icon: 5, time: 1000});
        });
    }

    /*用户-启用*/
    function member_start(obj, id) {
        layer.confirm('确认要启用吗？', function (index) {
            statusChange(id, true)
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="icon-ok bigger-120"></i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
            $(obj).remove();
            layer.msg('已启用!', {icon: 6, time: 1000});
        });
    }

    function statusChange(id, boolean) {
        $.ajax({
            url: '/manager/customer/change_status.do',
            type: 'POST',
            dataType: "JSON",
            data: {status: boolean, id: id},
            success: function (data) {
                if (data.status) {
                    layer.msg("修改成功", {icon: data.status, time: 1000}, function () {
                    });
                } else {
                    layer.msg("修改失败", {icon: data.status, time: 1000}, function () {
                    });
                }
            }
        })
    }

    /*用户-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                url: '/manager/customer/delete_customer.do',
                type: 'POST',
                dataType: "JSON",
                data: {id: id},
                success: function (data) {
                    if (data.status) {
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!', {icon: 1, time: 1000});
                    } else {
                        layer.msg("删除失败", {icon: data.status, time: 1000}, function () {
                        });
                    }
                }
            })
        });
    }

    //    laydate({
    //        elem: '#start',
    //        event: 'focus'
    //    });

</script>
