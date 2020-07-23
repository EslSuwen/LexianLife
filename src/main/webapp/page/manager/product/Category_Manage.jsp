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
    <link rel="stylesheet" href="../../../Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
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
    <script src="../../../assets/js/ace-elements.min.js"></script>
    <script src="../../../assets/js/ace.min.js"></script>
    <script src="../../../assets/js/bootstrap.min.js"></script>
    <script src="../../../assets/js/typeahead-bs2.min.js"></script>
    <script type="text/javascript" src="../../../Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
    <script src="../../../js/manager/lrtk.js" type="text/javascript"></script>
    <title>分类管理</title>
</head>

<body>
<div class=" clearfix">
    <div id="category">
        <div id="scrollsidebar" class="left_Treeview">
            <div class="show_btn" id="rightArrow"><span></span></div>
            <div class="widget-box side_content">
                <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
                <div class="side_list">
                    <div class="widget-header header-color-green2">
                        <h4 class="lighter smaller">产品类型列表</h4>
                    </div>
                    <div class="widget-body">
                        <div class="widget-main padding-8">
                            <div id="treeDemo" class="ztree"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!---->
        <div class="type_style">
            <div class="type_title">产品类型信息</div>
            <div class="type_content">
                <div class="Operate_btn">
                    <a href="javascript:void(0)" style="display: none" id="add" class="btn  btn-warning"><i
                            class="icon-edit align-top bigger-125"></i>新增子类型</a>
                    <a href="javascript:void(0)" style="display: none" id="delete" class="btn  btn-danger"><i
                            class="icon-trash   align-top bigger-125"></i>删除该类型</a>
                </div>
                <%--<form action="" method="post" class="form form-horizontal" id="form-category-add">--%>
                <div class="Operate_cont clearfix">

                    <div class="formControls ">
                        <label class="form-label"><span class="c-red">*</span>分类名称：</label>
                        <input type="text" disabled="disabled" class="input-text" value="" placeholder="" id="showName"
                               name="name">
                    </div>
                    <br>
                    <div class="formControls " id="sub-name" style="display: none">
                        <label class="form-label"><span class="c-red">*</span>子类名称：</label>
                        <input type="text" class="input-text" value="" placeholder="" id="new-sub-name"
                               name="category-name">
                    </div>
                </div>
                <%--</form>--%>

            </div>
        </div>
    </div>
</div>
</body>
</html>
<script src="../../../assets/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">

    var parId, subId;

    function par(id, name) {
        parId = id;
        $("#showName")[0].value = name;
        $("#sub-name").show();
        $("#add").show();
        $("#forbid").hide();
        $("#delete").hide();
    }


    function sub(id, name) {
        subId = id;
        $("#showName")[0].value = name;
        $("#add").hide();
        $("#forbid").show();
        $("#delete").show();
        $("#sub-name").hide();
    }

    $("#add").click(function () {
        $.ajax({
            url: "/admin/product/category_add.do",
            data: {id: parId, name: $("#new-sub-name").val()},
            dataType: "json",
            method: "POST",
            success: function (data) {
                console.log(data)
                if (data.status) {
                    layer.msg("添加成功", {icon: data.status, time: 1000}, function () {
                        location.reload();//刷新页面
                    });
                } else {
                    layer.msg(data.msg, {icon: data.status, time: 1000}, function () {
                    });
                }
            }
        })

    })
    $("#delete").click(function () {
        $.ajax({
            url: "/admin/product/category_delete.do",
            data: {id: subId},
            dataType: "json",
            method: "POST",
            success: function (data) {
                if (data.status) {
                    layer.msg("删除成功", {icon: data.status, time: 1000}, function () {
                        location.reload();//刷新页面
                    });
                } else {
                    layer.msg(data.msg, {icon: data.status, time: 1000}, function () {
                    });
                }
            }
        })

    })


    $(function () {
        $("#category").fix({
            float: 'left',
            //minStatue : true,
            skin: 'green',
            durationTime: false
        });
    });
</script>
<script type="text/javascript">
    //初始化宽度、高度
    $(".widget-box").height($(window).height());
    $(".page_right_style").width($(window).width() - 220);
    //当文档窗口发生改变时 触发
    $(window).resize(function () {
        $(".widget-box").height($(window).height());
        $(".page_right_style").width($(window).width() - 220);
    })

    /**************/
    var setting = {
        view: {
            dblClickExpand: false,
            showLine: false,
            selectedMulti: false
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: ""
            }
        },
        callback: {
//            beforeClick: function(treeId, treeNode) {
//                var zTree = $.fn.zTree.getZTreeObj("tree");
//                if (treeNode.isParent) {
//                    zTree.expandNode(treeNode);
//                    return false;
//                } else {
//                    demoIframe.attr("src",treeNode.file + ".html");
//                    return true;
//                }
//            }
        }
    };

    var zNodes = [
        {id: 1, pId: 0, name: "商城分类列表", open: true},
        <c:forEach items = "${catalogList}" var = "catalogList" varStatus="state">
        {
            id: '1' + '${catalogList.key.catalog_id}',
            pId: 1,
            name: "${catalogList.key.name}",
            "click": "par(${catalogList.key.catalog_id},'${catalogList.key.name}')"
        },
        <c:forEach items = "${catalogList.value}" var = "category" varStatus="state">
        {
            id: '2' + '${category.categoryId}',
            pId: '1' + '${catalogList.key.catalog_id}',
            name: "${category.name}",
            "click": "sub(${category.categoryId}, '${category.name}')"
        },
        </c:forEach>
        </c:forEach>
    ];

    var code;

    function showCode(str) {
        if (!code) code = $("#code");
        code.empty();
        code.append("<li>" + str + "</li>");
    }

    $(document).ready(function () {
        var t = $("#treeDemo");
        t = $.fn.zTree.init(t, setting, zNodes);
        demoIframe = $("#testIframe");
        demoIframe.bind("load", loadReady);
        var zTree = $.fn.zTree.getZTreeObj("tree");
        zTree.selectNode(zTree.getNodeByParam("id", '11'));
    });
</script>
