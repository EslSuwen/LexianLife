<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <script type="text/javascript" src="../../../Widget/Validform/5.3.2/Validform.min.js"></script>
    <script src="../../../assets/js/typeahead-bs2.min.js"></script>
    <script src="../../../assets/js/jquery.dataTables.min.js"></script>
    <script src="../../../assets/js/jquery.dataTables.bootstrap.js"></script>
    <script src="../../../assets/layer/layer.js" type="text/javascript"></script>
    <script src="../../../js/manager/lrtk.js" type="text/javascript"></script>
    <script src="../../../assets/layer/layer.js" type="text/javascript"></script>
    <script src="../../../assets/laydate/laydate.js" type="text/javascript"></script>
    <title>管理员</title>
</head>

<body>
<div class="page-content clearfix">
    <div class="administrator">
        <div class="d_Confirm_Order_style">
            <!--操作-->
            <div class="border clearfix">
       <span class="l_f">
        <a id="administrator_add" class="btn btn-warning"><i class="fa fa-plus"></i> 添加管理员</a>
       </span>
                <span class="r_f">共：<b>${total}</b>人</span>
            </div>
            <!--管理员列表-->
            <div class="clearfix administrator_style" id="administrator">

                <div style="width: 100%" id="testIframe">
                    <table class="table table-striped table-bordered table-hover" id="sample_table">
                        <thead>
                        <tr>
                            <th width="80px">编号</th>
                            <th width="250px">登录名</th>
                            <th width="180px">姓名</th>
                            <th width="100px">手机</th>
                            <th width="100px">邮箱</th>
                            <th width="70px">状态</th>
                            <th width="100px">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="admin" varStatus="state">
                            <tr>
                                <td>${admin.adminId}</td>
                                <td>${admin.username}</td>
                                <td>${admin.name}</td>
                                <td>${admin.phone}</td>
                                <td>${admin.email}</td>
                                <td class="td-status">
                                    <c:if test="${admin.status == 1}">
                                        <span class="label label-success radius">已启用</span></c:if>
                                    <c:if test="${admin.status == 0}">
                                        <span class="label label-defaunt radius">已禁用</span></c:if>
                                </td>
                                <td class="td-manage">
                                    <c:if test="${admin.status == 1}">
                                        <a onClick="member_stop(this,${admin.adminId})" href="javascript:;" title="停用"
                                           class="btn btn-xs btn-success"><i
                                                class="fa fa-check  bigger-120"></i></a></c:if>
                                    <c:if test="${admin.status == 0}">
                                        <a onClick="member_start(this,${admin.adminId})" href="javascript:;" title="启用"
                                           class="btn btn-xs btn-defaunt"><i
                                                class="fa fa-check  bigger-120"></i></a></c:if>
                                    <a title="删除" href="javascript:;" onclick="member_del(this,${admin.adminId})"
                                       class="btn btn-xs btn-warning"><i class="fa fa-trash  bigger-120"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!--添加管理员-->
    <div id="add_administrator_style" class="add_menber" style="display:none">
        <form method="post" id="form-admin-add" action="/admin/add_admin.do">
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>登录名：</label>
                <div class="formControls">
                    <input type="text" class="input-text" value="" placeholder="" id="user-name" name="username"
                           datatype="*2-16" nullmsg="用户名不能为空">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>姓名：</label>
                <div class="formControls">
                    <input type="text" class="input-text" value="" placeholder="" id="name" name="name"
                           datatype="*2-16" nullmsg="用户名不能为空">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>初始密码：</label>
                <div class="formControls">
                    <input type="password" placeholder="密码" name="password" autocomplete="off" value=""
                           class="input-text" datatype="*6-20" nullmsg="密码不能为空">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label "><span class="c-red">*</span>确认密码：</label>
                <div class="formControls ">
                    <input type="password" placeholder="确认新密码" autocomplete="off" class="input-text Validform_error"
                           errormsg="您两次输入的新密码不一致！" datatype="*" nullmsg="请再输入一次新密码！" recheck="password"
                           id="newpassword2">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label "><span class="c-red">*</span>手机：</label>
                <div class="formControls ">
                    <input type="text" class="input-text" value="" placeholder="" id="user-tel" name="phone"
                           datatype="m" nullmsg="手机不能为空">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>邮箱：</label>
                <div class="formControls ">
                    <input type="text" class="input-text" placeholder="@" name="email" id="email" datatype="e"
                           nullmsg="请输入邮箱！">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div>
                <input class="btn btn-primary radius" type="submit" id="Add_Administrator"
                       value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
        </form>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    jQuery(function ($) {
        var oTable1 = $('#sample_table').dataTable({
            "aaSorting": [[1, "desc"]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable": false, "aTargets": [0, 2, 3, 4, 5, 7, 8,]}// 制定列不参与排序
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
    });

</script>
<script type="text/javascript">
    $(function () {
        $("#administrator").fix({
            float: 'left',
            //minStatue : true,
            skin: 'green',
            durationTime: false,
            spacingw: 50,//设置隐藏时的距离
            spacingh: 270,//设置显示时间距
        });
    });

    //字数限制
    function checkLength(which) {
        var maxChars = 100; //
        if (which.value.length > maxChars) {
            layer.open({
                icon: 2,
                title: '提示框',
                content: '您输入的字数超过限制!',
            });
            // 超过限制的字数了就将 文本框中的内容按规定的字数 截取
            which.value = which.value.substring(0, maxChars);
            return false;
        } else {
            var curr = maxChars - which.value.length; //250 减去 当前输入的
            document.getElementById("sy").innerHTML = curr.toString();
            return true;
        }
    };
    //初始化宽度、高度
    $(".widget-box").height($(window).height() - 215);
    //当文档窗口发生改变时 触发
    $(window).resize(function () {
        $(".widget-box").height($(window).height() - 215);
    })

    /*用户-停用*/
    function member_stop(obj, id) {
        layer.confirm('确认要停用吗？', function (index) {
            statusChange(id, false);
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="fa fa-close bigger-120"></i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
            $(obj).remove();
            layer.msg('已停用!', {icon: 5, time: 1000});
        });
    }

    /*用户-启用*/
    function member_start(obj, id) {
        layer.confirm('确认要启用吗？', function (index) {
            statusChange(id, true);
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="fa fa-check  bigger-120"></i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
            $(obj).remove();
            layer.msg('已启用!', {icon: 6, time: 1000});
        });
    }

    function statusChange(id, boolean) {
        $.ajax({
            url: '/admin/change_status.do',
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

    /*产品-编辑*/
    function member_edit(title, url, id, w, h) {
        layer_show(title, url, w, h);
    }

    /*产品-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                url: '/admin/delete_admin.do',
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

    /*添加管理员*/
    $('#administrator_add').on('click', function () {
        layer.open({
            type: 1,
            title: '添加管理员',
            area: ['700px', ''],
            shadeClose: false,
            content: $('#add_administrator_style'),
        });
    })
    //表单验证提交
    $("#form-admin-add").Validform({
        tiptype: 2,
        ajaxPost: true,
        callback: function (data) {
            if (data.status) {
                layer.msg("添加成功", {icon: data.status, time: 1000}, function () {
                    location.reload();//刷新页面
                });
            } else {
                layer.msg(data.msg, {icon: data.status, time: 3000});
            }
        }


    });
</script>
