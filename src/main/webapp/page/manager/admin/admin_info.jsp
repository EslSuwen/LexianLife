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
    <script src="../../../assets/layer/layer.js" type="text/javascript"></script>
    <script src="../../../assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="../../../assets/js/bootstrap.min.js"></script>
    <script src="../../../assets/js/typeahead-bs2.min.js"></script>
    <script src="../../../assets/js/jquery.dataTables.min.js"></script>
    <script src="../../../assets/js/jquery.dataTables.bootstrap.js"></script>

    <title>个人信息管理</title>
</head>

<body>
<div class="clearfix">
    <div class="admin_info_style">
        <div class="admin_modify_style" id="Personal">
            <div class="type_title">管理员信息</div>
            <div class="xinxi">
                <form method="post" id="update-form" action="/manager/admin/add_admin.do">
                    <div class="form-group"><label class="col-sm-3 control-label no-padding-right">登录名： </label>
                        <div class="col-sm-9"><input type="text" name="username" id="username"
                                                     value="${admin.username}" class="col-xs-7"
                                                     disabled="disabled">
                            &nbsp;&nbsp;&nbsp;<a href="javascript:void()" onclick="change_Password()"
                                                 class="btn btn-warning btn-xs">修改密码</a></div>

                    </div>
                    <div class="form-group"><label class="col-sm-3 name-label no-padding-right">用户名： </label>
                        <div class="col-sm-9"><input type="text" name="name" id="name" value="${admin.name}"
                                                     class="col-xs-7 text_info" disabled="disabled"></div>
                    </div>
                    <div class="form-group"><label class="col-sm-3 control-label no-padding-right">移动电话： </label>
                        <div class="col-sm-9"><input type="text" name="phone" id="phone" value="${admin.phone}"
                                                     class="col-xs-7 text_info" disabled="disabled"></div>
                    </div>
                    <div class="form-group"><label class="col-sm-3 control-label no-padding-right">电子邮箱： </label>
                        <div class="col-sm-9"><input type="text" name="email" id="email" value="${admin.email}"
                                                     class="col-xs-7 text_info" disabled="disabled"></div>
                    </div>
                    <input type="hidden" name="adminId" id="adminId" value="${admin.adminId}"/>
                </form>
                <div class="Button_operation clearfix">
                    <button onclick="modify();" class="btn btn-danger radius" type="submit">修改信息</button>
                    <button onclick="save_info();" class="btn btn-success radius" type="button">保存修改</button>
                </div>
            </div>
        </div>
        <div class="recording_style">
            <div class="type_title">管理员登陆记录</div>
            <div class="recording_list">
                <table class="table table-border table-bordered table-bg table-hover table-sort" id="sample-table">
                    <thead>
                    <tr class="text-c">
                        <th width="80">ID</th>
                        <th width="300">内容</th>
                        <th width="10%">用户名</th>
                        <th width="150">时间</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${log}" var="log" varStatus="state">
                        <tr>
                            <td>${log.adminLogId}</td>
                            <td>${log.content}</td>
                            <td>${admin.name}</td>
                            <td>${log.time}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!--修改密码样式-->
<div class="change_Pass_style" id="change_Pass">
    <ul class="xg_style">
        <li><label class="label_name">原&nbsp;&nbsp;密&nbsp;码</label><input name="原密码" type="password" class=""
                                                                          id="password"></li>
        <li><label class="label_name">新&nbsp;&nbsp;密&nbsp;码</label><input name="新密码" type="password" class=""
                                                                          id="Nes_pas"></li>
        <li><label class="label_name">确认密码</label><input name="再次确认密码" type="password" class="" id="c_mew_pas"></li>

    </ul>
    <!--       <div class="center"> <button class="btn btn-primary" type="button" id="submit">确认修改</button></div>-->
</div>
</body>
</html>
<script>

    //按钮点击事件
    function modify() {
        $('.text_info').attr("disabled", false);
        $('.text_info').addClass("add");
        $('#Personal').find('.xinxi').addClass("hover");
        $('#Personal').find('.btn-success').css({'display': 'block'});
    };

    function save_info() {
        var num = 0;
        var str = "";
        $(".xinxi input[type$='text']").each(function (n) {
            if ($(this).val() == "") {

                layer.alert(str += "" + $(this).attr("name") + "不能为空！\r\n", {
                    title: '提示框',
                    icon: 0,
                });
                num++;
                return false;
            }
        });
        if (num > 0) {
            return false;
        } else {
            $.ajax({
                url: '/manager/admin/add_admin.do',
                type: 'POST',
                dataType: "JSON",
                data: {
                    adminId: $("#adminId").val(),
                    name: $("#name").val(),
                    username: $("#username").val(),
                    phone: $("#phone").val(),
                    email: $("#email").val(),
                },
                success: function (data) {
                    if (data.status) {
                        layer.msg("修改成功", {icon: data.status, time: 1000}, function () {
                            location.reload()
                        });
                    } else {
                        layer.msg("修改失败", {icon: data.status, time: 1000}, function () {
                        });
                    }
                }
            })

        }
    };
    //初始化宽度、高度
    $(".admin_modify_style").height($(window).height());
    $(".recording_style").width($(window).width() - 400);
    //当文档窗口发生改变时 触发  
    $(window).resize(function () {
        $(".admin_modify_style").height($(window).height());
        $(".recording_style").width($(window).width() - 400);
    });

    //修改密码
    function change_Password() {
        layer.open({
            type: 1,
            title: '修改密码',
            area: ['300px', '300px'],
            shadeClose: true,
            content: $('#change_Pass'),
            btn: ['确认修改'],
            yes: function (index, layero) {
                if ($("#password").val() == "") {
                    layer.alert('原密码不能为空!', {
                        title: '提示框',
                        icon: 0,

                    });
                    return false;
                }
                if ($("#Nes_pas").val() == "") {
                    layer.alert('新密码不能为空!', {
                        title: '提示框',
                        icon: 0,

                    });
                    return false;
                }

                if ($("#c_mew_pas").val() == "") {
                    layer.alert('确认新密码不能为空!', {
                        title: '提示框',
                        icon: 0,

                    });
                    return false;
                }
                if (!$("#c_mew_pas").val || $("#c_mew_pas").val() != $("#Nes_pas").val()) {
                    layer.alert('密码不一致!', {
                        title: '提示框',
                        icon: 0,

                    });
                    return false;
                } else {
                    $.ajax({
                        url: '/manager/admin/change_pwd.do',
                        type: 'POST',
                        dataType: "JSON",
                        data: {
                            pwd: $("#password").val(),
                            newpwd: $("#Nes_pas").val(),
                            id: $("#adminId").val(),
                        },
                        success: function (data) {
                            if (data.status) {
                                layer.msg("修改成功", {icon: data.status, time: 1000}, function () {
                                    location.reload()
                                });
                            } else {
                                layer.msg(data.msg, {icon: data.status, time: 1000}, function () {
                                });
                            }
                        }
                    })
                }
            }
        });
    }
</script>
<script>
    jQuery(function ($) {
        var oTable1 = $('#sample-table').dataTable({
            "aaSorting": [[1, "desc"]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable": false, "aTargets": [0, 2]}// 制定列不参与排序
            ]
        });

    });
</script>
