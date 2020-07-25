<jsp:include page="../common/top.jsp"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="margin clearfix">
    <div id="refund_style">
        <div class="search_style">

            <ul class="search_content clearfix">
                <li><label class="l_f">产品名称</label><input name="" type="text" class="text_add" placeholder="输入产品名称"
                                                          style=" width:250px"></li>
                <li><label class="l_f">退款时间</label><input class="inline laydate-icon" id="start"
                                                          style=" margin-left:10px;"></li>
                <li style="width:90px;">
                    <button type="button" class="btn_search"><i class="fa fa-search"></i>查询</button>
                </li>
            </ul>
        </div>
        <div class="border clearfix">
       <span class="l_f">
        <a href="#" class="btn btn-success Order_form"><i
                class="fa fa-check-square-o"></i>&nbsp;已退款订单</a>
        <a href="#" class="btn btn-warning Order_form"><i class="fa fa-close"></i>&nbsp;未退款订单</a>
        <a href="#" class="btn btn-danger"><i class="fa fa-trash"></i>&nbsp;批量删除</a>
       </span>
            <span class="r_f">共：<b>2334</b>笔</span>
        </div>
        <!--退款列表-->
        <div class="refund_list">
            <table class="table table-striped table-bordered table-hover" id="sample-table">
                <thead>
                <tr>
                    <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                    <th width="120px">订单编号</th>
                    <th width="250px">产品名称</th>
                    <th width="100px">交易金额</th>
                    <th width="100px">交易时间</th>
                    <th width="100px">退款金额</th>
                    <th width="80px">退款数量</th>
                    <th width="70px">状态</th>
                    <th width="200px">说明</th>
                    <th width="200px">操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
                    <td>20160705445622</td>
                    <td class="order_product_name">
                        <a href="#">华圣 高原红富士苹果 6枚 1.2KG 自营水果</a>
                    </td>
                    <td>456.5</td>
                    <td>2016-7-5</td>
                    <td>145</td>
                    <td>1</td>
                    <td class="td-status"><span class="label label-success radius">待退款</span></td>
                    <td>重复购买商品需退款一件</td>
                    <td>
                        <a onClick="Delivery_Refund(this,'10001')" href="javascript:;" title="退款"
                           class="btn btn-xs btn-success">退款</a>
                        <a title="退款订单详细" href="/page/manager/order/Refund_detailed.jsp"
                           class="btn btn-xs btn-info Refund_detailed">详细</a>
                        <a title="删除" href="javascript:;" onclick="Order_form_del(this,'1')"
                           class="btn btn-xs btn-warning">删除</a>
                    </td>
                </tr>
                <tr>
                    <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
                    <td>20160705445622</td>
                    <td class="order_product_name">
                        <a href="#">华圣 高原红富士苹果 6枚 1.2KG 自营水果</a>
                    </td>
                    <td>456.5</td>
                    <td>2016-7-5</td>
                    <td>145</td>
                    <td>1</td>
                    <td class="td-status"><span class="label label-defaunt radius">已退款</span></td>
                    <td>重复购买商品需退款一件</td>
                    <td>

                        <a title="退款订单详细" href="/page/manager/order/Refund_detailed.jsp"
                           class="btn btn-xs btn-info Refund_detailed">详细</a>
                        <a title="删除" href="javascript:;" onclick="Order_form_del(this,'1')"
                           class="btn btn-xs btn-warning">删除</a>
                    </td>
                </tr>
                </tbody>
            </table>

        </div>
    </div>
</div>
</body>
</html>
<script>
    //订单列表
    jQuery(function ($) {
        var oTable1 = $('#sample-table').dataTable({
            "aaSorting": [[1, "desc"]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable": false, "aTargets": [0, 2, 3, 4, 5, 6, 8, 9]}// 制定列不参与排序
            ]
        });
        //全选操作
        $('table th input:checkbox').on('click', function () {
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox')
                .each(function () {
                    this.checked = that.checked;
                    $(this).closest('tr').toggleClass('selected');
                });

        });
    });

    function Delivery_Refund(obj, id) {

        layer.confirm('是否退款当前商品价格！', function (index) {
            $(obj).parents("tr").find(".td-manage").prepend('<a style=" display:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="已退款">退款</a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt  radius">已退款</span>');
            $(obj).remove();
            layer.msg('已退款!', {icon: 6, time: 1000});
        });


    };
    //面包屑返回值
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.iframeAuto(index);
    $('.Refund_detailed').on('click', function () {
        var cname = $(this).attr("title");
        var chref = $(this).attr("href");
        var cnames = parent.$('.Current_page').html();
        var herf = parent.$("#iframe").attr("src");
        parent.$('#parentIframe').html(cname);
        parent.$('#iframe').attr("src", chref).ready();
        ;
        parent.$('#parentIframe').css("display", "inline-block");
        parent.$('.Current_page').attr({"name": herf, "href": "javascript:void(0)"}).css({
            "color": "#4c8fbd",
            "cursor": "pointer"
        });
        //parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+" class='iframeurl'>" + cnames + "</a>");
        parent.layer.close(index);

    });
</script>
