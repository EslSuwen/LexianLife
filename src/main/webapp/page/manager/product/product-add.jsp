<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="../../../js/manager/html5.js"></script>
    <script type="text/javascript" src="../../../js/manager/respond.min.js"></script>
    <script type="text/javascript" src="../../../js/manager/PIE_IE678.js"></script>
    <![endif]-->
    <link href="../../../assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="../../../css/style.css"/>
    <link href="../../../assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="../../../assets/css/ace.min.css"/>
    <link rel="stylesheet" href="../../../Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script src="../../../js/manager/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../../../Widget/Validform/5.3.2/Validform.min.js"></script>
    <link rel="stylesheet" href="../../../assets/css/font-awesome.min.css"/>
    <!--[if IE 7]>
    <link rel="stylesheet" href="../../../assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->
    <link href="../../../Widget/icheck/icheck.css" rel="stylesheet" type="text/css"/>
    <link href="../../../Widget/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css"/>

    <title>新增图片</title>
</head>
<body>
<div class="clearfix" id="add_picture">
    <div id="scrollsidebar" class="left_Treeview">
        <div class="show_btn" id="rightArrow"><span></span></div>
        <div class="widget-box side_content">
            <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
            <div class="side_list">
                <div class="widget-header header-color-green2">
                    <h4 class="lighter smaller">选择产品类型</h4>
                </div>
                <div class="widget-body">
                    <div class="widget-main padding-8">
                        <div id="treeDemo" class="ztree"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="page_right_style">
        <div class="type_title">添加商品</div>
        <form method="post" enctype="multipart/form-data" id="form-article-add">
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>商品名：</label>
                <div class="formControls">
                    <input type="text" class="input-text" value="${goods.name}" placeholder="" id="name" name="name"
                           datatype="*2-16" nullmsg="商品名不能为空">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>售价：</label>
                <div class="formControls">
                    <input type="text" class="input-text" value="${goods.unitPrice}" placeholder="" id="unitPrice"
                           name="unitPrice"
                           datatype="*1-16" nullmsg="售价不能为空">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>单位：</label>
                <div class="formControls">
                    <input type="text" class="input-text" value="${goods.unit}" placeholder="" id="unit" name="unit"
                           datatype="*1-16" nullmsg="单位不能为空">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>重量：</label>
                <div class="formControls">
                    <input type="text" class="input-text" value="${goods.weight}" placeholder="" id="weight"
                           name="weight"
                           datatype="*1-16" nullmsg="重量不能为空">kg
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>库存：</label>
                <div class="formControls">
                    <input type="text" class="input-text" value="${goods.inventory}" placeholder="" id="inventory"
                           name="inventory"
                           datatype="*1-16" nullmsg="库存不能为空">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>属性：</label>
                <div class="formControls">
                    <div id="attr">
                        <c:forEach items="${goods.goodsAttrs}" var="attrs" varStatus="state">
                            <input value="${attrs.name}" name='attrname' class='input-text attr'/>：
                            <input value="${attrs.value}" name='attrvalue' class='input-text attr'/><br>
                            <input style="display: none" value="${attrs.goodsAttrId}" name='attrid'
                                   class='input-text attr'/>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="clearfix cl">
                <label class="form-label col-2">&nbsp;</label>
                <button type="button" class="col-2 btn btn-primary radius" id="add-attr"><i
                        class="icon-bar"></i>添加属性
                </button>
            </div>
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>缩略图：</label>
                <div class="formControls">
                    <input name="picture" class="input-text" nullmsg="图片不能为空" type="file">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>物品详细图：</label>
                <div class="formControls">
                    <input name="bigpic" class="input-text" nullmsg="图片不能为空" type="file">
                </div>
                <div class="formControls">
                    <input name="bigpic" class="input-text" nullmsg="图片不能为空" type="file">
                </div>
                <div class="formControls">
                    <input name="bigpic" class="input-text" nullmsg="图片不能为空" type="file">
                </div>
                <div class="formControls">
                    <input name="bigpic" class="input-text" nullmsg="图片不能为空" type="file">
                </div>
                <div class="formControls">
                    <input name="bigpic" class="input-text" nullmsg="图片不能为空" type="file">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>物品说明图：</label>
                <div id="adpic-area"></div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <button type="button" class="col-2 btn btn-primary radius" id="product-ad"><i
                    class="icon-bar"></i>添加物品说明图
            </button>
            <div class="form-group">
                <div class="formControls">
                    <input style="display: none;" type="text" class="input-text" value="${goods.category.category_id}"
                           placeholder="" id="categoryid" name="categoryid"
                           datatype="*1-16" nullmsg="请选择商品类别">
                    <input style="display:none;" name="goodsId" value="${goods.goodsId}">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="clearfix cl">
                <div class="clearfix cl">
                    <div class="Button_operation">
                        <input class="btn btn-primary radius" type="button" id="save" value="保存"/>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="../../../js/manager/jquery-1.9.1.min.js"></script>
<script src="../../../assets/js/bootstrap.min.js"></script>
<script src="../../../assets/js/typeahead-bs2.min.js"></script>
<script src="../../../assets/layer/layer.js" type="text/javascript"></script>
<script src="../../../assets/laydate/laydate.js" type="text/javascript"></script>
<script type="text/javascript" src="../../../Widget/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../../../Widget/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript" src="../../../Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="../../../Widget/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="../../../Widget/webuploader/0.1.5/webuploader.min.js"></script>
<script src="../../../js/manager/lrtk.js" type="text/javascript"></script>
<script type="text/javascript" src="../../../js/manager/H-ui.js"></script>
<script type="text/javascript" src="../../../js/manager/H-ui.admin.js"></script>
<script>

    function addCategory(id) {
        $("#categoryid")[0].value = id;
    }

    var attrCount = 0;
    $("#product-ad").click(function () {
        attrCount++;
        $("#adpic-area").append("<div class=\"formControls\">\n" +
            "                    <input name=\"adpic\"  class=\"input-text\" nullmsg=\"图片不能为空\" type=\"file\">\n" +
            "                </div>")
    })

    $("#add-attr").click(function () {
        attrCount++;
        $("#attr").append(
            "         <input type=\"test\"  name='attrname'  class='input-text attr'  />  ：" +
            "                <input type=\"test\" name='attrvalue' class='input-text attr'  /><br>")
    })

    $(function () {
        $("#add_picture").fix({
            float: 'left',
            skin: 'green',
            durationTime: false,
            stylewidth: '220',
            spacingw: 0,
            spacingh: 260,
        });
    });
    $(document).ready(function () {
//初始化宽度、高度

        $(".widget-box").height($(window).height());
        $(".page_right_style").height($(window).height());
        $(".page_right_style").width($(window).width() - 220);
        //当文档窗口发生改变时 触发
        $(window).resize(function () {

            $(".widget-box").height($(window).height());
            $(".page_right_style").height($(window).height());
            $(".page_right_style").width($(window).width() - 220);
        });
    });
    /******树状图********/
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
            beforeClick: function (treeId, treeNode) {
                console.log(treeId.id);
                console.log(treeNode)
//                var zTree = $.fn.zTree.getZTreeObj("tree");
//                if (treeNode.isParent) {
//                    zTree.expandNode(treeNode);
//                    return false;
//                } else {
//                    demoIframe.attr("src", treeNode.file + ".html");
//                    return true;
//                }
            }
        }
    };

    var zNodes = [
        {id: 1, pId: 0, name: "商城分类列表", open: true},
        <c:forEach items = "${catalogList}" var = "catalogList" varStatus="state">
        {id: '1' + '${catalogList.key.catalog_id}', pId: 1, name: "${catalogList.key.name}"},
        <c:forEach items = "${catalogList.value}" var = "category" varStatus="state">
        {
            id: '2' + '${category.category_id}',
            pId: '1' + '${catalogList.key.catalog_id}',
            name: "${category.name}",
            "click": "addCategory(${category.category_id})"
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
        //demoIframe.bind("load", loadReady);
        var zTree = $.fn.zTree.getZTreeObj("tree");
        //zTree.selectNode(zTree.getNodeByParam("id",'11'));
    });

    $("#save").click(function () {
        var valid = $("#form-article-add").Validform({
            tiptype: 2,
            ajaxPost: true,
            callback: function (data) {
//            if (data.status) {
//                layer.msg("添加成功", {icon: data.status, time: 1000}, function () {
//                    location.reload();//刷新页面
//                });
//            }
//            else {
//                layer.msg(data.msg, {icon: data.status, time: 3000});
//            }
            }


        });
        if (valid.check()) {
            $.ajax({
                url: '/manager/product/new_product_add.do',
                type: 'POST',
                cache: false,
                data: new FormData($('#form-article-add')[0]),
                processData: false,
                contentType: false,
                success: function (data) {
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
        }
    })

</script>
</body>
</html>
