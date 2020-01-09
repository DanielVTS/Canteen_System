<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" isErrorPage="true" %>
<% pageContext.setAttribute("ctx", request.getContextPath()); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
    <!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
    <meta name="renderer" content="webkit">
    <!--国产浏览器高速模式-->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>混吃等死</title>

    <!-- 公共样式 开始 -->
    <link rel="stylesheet" type="text/css" href="../../css/base.css">
    <link rel="stylesheet" type="text/css" href="../../css/iconfont.css">
    <script type="text/javascript" src="../../framework/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../layui/css/layui.css">
    <script type="text/javascript" src="../../layui/layui.js"></script>
    <!-- 滚动条插件 -->
    <link rel="stylesheet" type="text/css" href="../../css/jquery.mCustomScrollbar.css">
    <script src="../../framework/jquery-ui-1.10.4.min.js"></script>
    <script src="../../framework/jquery.mousewheel.min.js"></script>
    <script src="../../framework/jquery.mCustomScrollbar.min.js"></script>
    <script src="../../framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
    <!-- 公共样式 结束 -->

</head>

<body>
<div class="cBody">
    <div class="console">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <input type="text" name="name" required lay-verify="required" placeholder="输入订单状态" autocomplete="off" class="layui-input">
                </div>
                <button class="layui-btn" lay-submit lay-filter="formDemo">检索</button>
            </div>
        </form>

        <script>
            layui.use('form', function() {
                var form = layui.form;

                //监听提交
                form.on('submit(formDemo)', function(data) {
                    layer.msg(JSON.stringify(data.field));
                    return false;
                });
            });
        </script>
    </div>

    <table class="layui-table">
        <thead>
        <tr>
            <th>订单号</th>
            <th>客户名</th>
            <th>客户电话</th>
            <th>台号</th>
            <th>台名</th>
            <th>订单状态</th>
            <th>订单价格</th>
            <th>订台时间</th>
            <th>结束时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
    <script type="text/javascript" src="${ctx}/js/jquery-2.1.4.min.js"></script>
    <script>
        //jquery代码都必须写在ready方法中
        $(document).ready(function () {
            $.get("${ctx}/orderList/getOrderList",function(data,status){
                console.log(data);
                console.log("数据: " + data + "\n状态: " + status);
                $.each(data, function (index, item) {
                    console.log(index);
                    console.log(item);
                    var table = $("table");
                    var tr = document.createElement("tr");
                    var td1 = document.createElement("td");
                    td1.innerText = item.orderNo;
                    tr.append(td1);
                    var td2 = document.createElement("td");
                    td2.innerText = item.customerName;
                    tr.append(td2);
                    var td3 = document.createElement("td");
                    td3.innerText = item.phone;
                    tr.append(td3);
                    var td4 = document.createElement("td");
                    td4.innerText = item.tableId;
                    tr.append(td4);
                    var td5 = document.createElement("td");
                    td5.innerText = item.tableName;
                    tr.append(td5);
                    var td6 = document.createElement("td");

                    td6.innerText = item.orderStatus;
                    tr.append(td6);
                    var td7 = document.createElement("td");
                    td7.innerText = item.orderPrice;
                    tr.append(td7);
                    var td8 = document.createElement("td");
                    td8.innerText = item.tableTime;
                    tr.append(td8);
                    var td9 = document.createElement("td");
                    td8.innerText = item.endTime;
                    tr.append(td9);
                    var td10=document.writeln("<button class=\'layui-btn layui-btn-xs\'>修改</button>")



                    table.append(tr);
                })
            });
        });

    </script>

    <!-- layUI 分页模块 -->
    <div id="pages"></div>
    <script>
        layui.use(['laypage', 'layer'], function() {
            var laypage = layui.laypage,
                layer = layui.layer;

            //总页数大于页码总数
            laypage.render({
                elem: 'pages'
                ,count: 100
                ,layout: ['count', 'prev', 'page', 'next', 'limit', 'skip']
                ,jump: function(obj){
                    console.log(obj)
                }
            });
        });
    </script>
</div>
</body>

</html>