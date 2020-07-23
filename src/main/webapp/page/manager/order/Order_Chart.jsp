<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <title>订单</title>
    <script src="../../../js/manager/jquery-1.9.1.min.js"></script>
    <script src="../../../assets/dist/echarts.js"></script>
</head>

<body>
<div id="map" style="width:100%; overflow:auto; overflow:hidden" ;></div>
</body>
</html>
<script>
    //初始化宽度、高度
    $("#map").height($(window).height() - 20);

    //当文档窗口发生改变时 触发  
    $(window).resize(function () {
        $("#map").height($(window).height() - 20);
    });
    //统计
    require.config({
        paths: {
            echarts: '../../../assets/dist'
        }
    });
    require(
        [
            'echarts',
            'echarts/theme/macarons',
            'echarts/chart/map',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
            //'echarts/chart/bar'
        ],
        function (ec, theme) {
            var myChart = ec.init(document.getElementById('map'), theme);

            option = {
                title: {
                    text: '订单量',
                    subtext: '纯属虚构',
                    x: 'center'
                },
                tooltip: {
                    trigger: 'item'
                },
                legend: {
                    orient: 'vertical',
                    x: 'left',
                    data: ['订单量']
                },
                dataRange: {
                    x: 'left',
                    y: 'bottom',
                    splitList: [
                        {start: 1500},
                        {start: 900, end: 1500},
                        {start: 310, end: 1000},
                        {start: 200, end: 300},
                        {start: 10, end: 200, label: '10 到 200'},
                        {start: 5, end: 5, label: '5', color: 'black'},
                        {end: 10}
                    ],
                    color: ['#E0022B', '#E09107', '#A3E00B']
                },
                toolbox: {
                    show: true,
                    orient: 'vertical',
                    x: 'right',
                    y: 'center',
                    feature: {
                        mark: {show: true},
                        dataView: {show: true, readOnly: false},
                        restore: {show: true},
                        saveAsImage: {show: true}
                    }
                },
                roamController: {
                    show: true,
                    x: 'right',
                    mapTypeControl: {
                        'china': true
                    }
                },
                series: [
                    {
                        name: '订单量',
                        type: 'map',
                        mapType: 'china',
                        roam: false,
                        itemStyle: {
                            normal: {
                                label: {
                                    show: true,
                                    textStyle: {
                                        color: "rgb(249, 249, 249)"
                                    }
                                }
                            },
                            emphasis: {label: {show: true}}
                        },
                        data: [
                            {name: '北京', value: Math.round(Math.random() * 2000)},
                            {name: '天津', value: Math.round(Math.random() * 2000)},
                            {name: '上海', value: Math.round(Math.random() * 2000)},
                            {name: '重庆', value: Math.round(Math.random() * 2000)},
                            {name: '河北', value: 0},
                            {name: '河南', value: Math.round(Math.random() * 2000)},
                            {name: '云南', value: 5},
                            {name: '辽宁', value: 305},
                            {name: '黑龙江', value: Math.round(Math.random() * 2000)},
                            {name: '湖南', value: 200},
                            {name: '安徽', value: Math.round(Math.random() * 2000)},
                            {name: '山东', value: Math.round(Math.random() * 2000)},
                            {name: '新疆', value: Math.round(Math.random() * 2000)},
                            {name: '江苏', value: Math.round(Math.random() * 2000)},
                            {name: '浙江', value: Math.round(Math.random() * 2000)},
                            {name: '江西', value: Math.round(Math.random() * 2000)},
                            {name: '湖北', value: Math.round(Math.random() * 2000)},
                            {name: '广西', value: Math.round(Math.random() * 2000)},
                            {name: '甘肃', value: Math.round(Math.random() * 2000)},
                            {name: '山西', value: Math.round(Math.random() * 2000)},
                            {name: '内蒙古', value: Math.round(Math.random() * 2000)},
                            {name: '陕西', value: Math.round(Math.random() * 2000)},
                            {name: '吉林', value: Math.round(Math.random() * 2000)},
                            {name: '福建', value: Math.round(Math.random() * 2000)},
                            {name: '贵州', value: Math.round(Math.random() * 2000)},
                            {name: '广东', value: Math.round(Math.random() * 2000)},
                            {name: '青海', value: Math.round(Math.random() * 2000)},
                            {name: '西藏', value: Math.round(Math.random() * 2000)},
                            {name: '四川', value: Math.round(Math.random() * 2000)},
                            {name: '宁夏', value: Math.round(Math.random() * 2000)},
                            {name: '海南', value: Math.round(Math.random() * 2000)},
                            {name: '台湾', value: Math.round(Math.random() * 2000)},
                            {name: '香港', value: Math.round(Math.random() * 2000)},
                            {name: '澳门', value: Math.round(Math.random() * 2000)}
                        ]
                    }
                ]
            };


            myChart.setOption(option);
        })
</script>
