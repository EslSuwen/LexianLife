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
    <script type="text/javascript" src="../../../js/manager/H-ui.js"></script>
    <script src="../../../assets/js/jquery.dataTables.min.js"></script>
    <script src="../../../assets/js/jquery.dataTables.bootstrap.js"></script>
    <script src="../../../assets/layer/layer.js" type="text/javascript"></script>
    <script src="../../../assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="../../../assets/js/jquery.easy-pie-chart.min.js"></script>
    <script src="../../../js/manager/lrtk.js" type="text/javascript"></script>
    <title>订单详细</title>
</head>

<body>
<div class="margin clearfix">
    <div class="Order_Details_style">
        <div class="Numbering">订单编号:<b>${order.orderNum}</b></div>
    </div>
    <div class="detailed_style">
        <!--收件人信息-->
        <div class="Receiver_style">
            <div class="title_name">收件人信息</div>
            <div class="Info_style clearfix">
                <div class="col-xs-3">
                    <label class="label_name" for="form-field-2"> 收件人姓名： </label>
                    <div class="o_content">${order.recAddr.recName}</div>
                </div>
                <div class="col-xs-3">
                    <label class="label_name" for="form-field-2"> 收件人电话： </label>
                    <div class="o_content">${order.recAddr.phone}</div>
                </div>
                <div class="col-xs-3">
                    <label class="label_name" for="form-field-2"> 收件地邮编： </label>
                    <div class="o_content">${order.recAddr.postcode}</div>
                </div>
                <div class="col-xs-3">
                    <label class="label_name" for="form-field-2"> 收件地址： </label>
                    <div class="o_content">${order.recAddr.province }${order.recAddr.city}${order.recAddr.district}${order.recAddr.addr}</div>
                </div>
            </div>
        </div>
        <!--订单信息-->
        <div class="product_style">
            <div class="title_name">产品信息</div>
            <div class="Info_style clearfix">
                <c:forEach items="${order.orderItems}" var="item">
                    <div class="product_info clearfix">
                        <img src="${item.goods.img}"/>
                        <span>
      <p class="name_link">${item.goods.name}</p>
      <p>规格：${item.goods.unitPrice}/${item.goods.unit}</p>
      <p>数量：${item.num}</p>
      </span>
                    </div>
                </c:forEach>

            </div>
        </div>
        <!--总价-->
        <div class="Total_style">
            <div class="Info_style clearfix">
                <div class="col-xs-3">
                    <label class="label_name" for="form-field-2"> 支付方式： </label>
                    <div class="o_content">${order.payWay.name}</div>
                </div>
                <div class="col-xs-3">
                    <label class="label_name" for="form-field-2"> 订单生成日期： </label>
                    <div class="o_content">${order.createTime}</div>
                </div>

            </div>
            <div class="Total_m_style"><span class="Total_price">总价：<b>${order.amount}</b>元</span></div>
        </div>


    </div>
</div>
</body>
</html>
