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
    <link rel="stylesheet" type="text/css" href="${ctx}/css/base.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/css/iconfont.css">
    <script type="text/javascript" src="${ctx}/framework/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/layui/css/layui.css">
    <script type="text/javascript" src="${ctx}/layui/layui.js"></script>
    <!-- 滚动条插件 -->
    <link rel="stylesheet" type="text/css" href="${ctx}/css/jquery.mCustomScrollbar.css">
    <script src="${ctx}/framework/jquery-ui-1.10.4.min.js"></script>
    <script src="${ctx}/framework/jquery.mousewheel.min.js"></script>
    <script src="${ctx}/framework/jquery.mCustomScrollbar.min.js"></script>
    <script src="${ctx}/framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
    <!-- 公共样式 结束 -->
    <style type="text/css">
        td{text-align: center;vertical-align:middle;}

    </style>
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
            <th>菜号</th>
            <th>菜名</th>
            <th>单价</th>
            <th>数量</th>
            <th>总价</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

        <script>
            //jquery代码都必须写在ready方法中
            $(document).ready(function () {
                let orderNo = "${requestScope.orderNo}";
                $.get("${ctx}/orderItem/getOrderItem",function(data,status){
                    console.log(data);
                    console.log("数据: " + data + "\n状态: " + status);
                    var id=0;
                        if(orderNo!=orderNo) return true;

                    $.each(data, function (index, item) {
                        console.log(index);
                        console.log(item);
                        var table = $("table");
                        var tr = document.createElement("tr");
                        var td1 = document.createElement("td");
                        td1.innerText = item.orderNo;
                        tr.append(td1);
                        var td2 = document.createElement("td");
                        td2.innerText = item.menuId;
                        tr.append(td2);
                        var td3 = document.createElement("td");
                        td3.innerText = item.menuName;
                        tr.append(td3);
                        var td4 = document.createElement("td");
                        td4.innerText = item.price;
                        tr.append(td4);
                        var td5 = document.createElement("td");
                        td5.innerText = item.quantity;
                        tr.append(td5);
                        var td6 = document.createElement("td");
                        td6.innerText = item.totalPrice;
                        tr.append(td6);

                        var btn1=document.createElement("input");
                        btn1.setAttribute("type","button");
                        btn1.setAttribute("name","update");
                        btn1.setAttribute("value","更新");
                        btn1.setAttribute("class","layui-btn layui-btn-sm");
                        btn1.setAttribute("onclick","window.location.href='${ctx}/orderItem/update'");


                        var btn2=document.createElement("input");
                        btn2.setAttribute("type","button");
                        btn2.setAttribute("name","more");
                        btn2.setAttribute("value","基本信息");
                        btn2.setAttribute("class","layui-btn layui-btn-sm");

                        var btn3=document.createElement("input");
                        btn3.setAttribute("type","button");
                        btn3.setAttribute("name","over");
                        btn3.setAttribute("value","订单完成");
                        btn3.setAttribute("class","layui-btn layui-btn-sm");
                        tr.append(btn1,btn2,btn3);

                        table.append(tr);


                    })
                });
            });
        <%--<script>--%>
        <%--    //jquery代码都必须写在ready方法中--%>
        <%--    $(document).ready(function () {--%>
        <%--        let orderNo = "${requestScope.orderNo}";--%>
        <%--        $.get("${ctx}/orderItem/getOrderItem",function(data,status){--%>
        <%--            console.log(data);--%>
        <%--            console.log("数据: " + data + "\n状态: " + status);--%>
        <%--            var id=0;--%>
        <%--            if(item.orderNo==null)--%>
        <%--            {--%>
        <%--            $.each(data, function (index, item) {--%>
        <%--                console.log(index);--%>
        <%--                console.log(item);--%>
        <%--                var table = $("table");--%>
        <%--                var tr = document.createElement("tr");--%>
        <%--                var td1 = document.createElement("td");--%>
        <%--                td1.innerText = item.orderNo;--%>
        <%--                tr.append(td1);--%>
        <%--                var td2 = document.createElement("td");--%>
        <%--                td2.innerText = item.menuId;--%>
        <%--                tr.append(td2);--%>
        <%--                var td3 = document.createElement("td");--%>
        <%--                td3.innerText = item.menuName;--%>
        <%--                tr.append(td3);--%>
        <%--                var td4 = document.createElement("td");--%>
        <%--                td4.innerText = item.price;--%>
        <%--                tr.append(td4);--%>
        <%--                var td5 = document.createElement("td");--%>
        <%--                td5.innerText = item.quantity;--%>
        <%--                tr.append(td5);--%>
        <%--                var td6 = document.createElement("td");--%>
        <%--                td6.innerText = item.totalPrice;--%>
        <%--                tr.append(td6);--%>

        <%--                var btn1=document.createElement("input");--%>
        <%--                btn1.setAttribute("type","button");--%>
        <%--                btn1.setAttribute("name","update");--%>
        <%--                btn1.setAttribute("value","更新");--%>
        <%--                btn1.setAttribute("class","layui-btn layui-btn-sm");--%>
        <%--                btn1.setAttribute("onclick","window.location.href='${ctx}/orderItem/update'");--%>


        <%--                var btn2=document.createElement("input");--%>
        <%--                btn2.setAttribute("type","button");--%>
        <%--                btn2.setAttribute("name","more");--%>
        <%--                btn2.setAttribute("value","基本信息");--%>
        <%--                btn2.setAttribute("class","layui-btn layui-btn-sm");--%>

        <%--                var btn3=document.createElement("input");--%>
        <%--                btn3.setAttribute("type","button");--%>
        <%--                btn3.setAttribute("name","over");--%>
        <%--                btn3.setAttribute("value","订单完成");--%>
        <%--                btn3.setAttribute("class","layui-btn layui-btn-sm");--%>
        <%--                tr.append(btn1,btn2,btn3);--%>

        <%--                table.append(tr);--%>


        <%--            })}--%>
        <%--            else--%>
        <%--            {--%>
        <%--                if(item.orderNo != orderNo) return true;--%>
        <%--                $.each(data, function (index, item) {--%>
        <%--                    console.log(index);--%>
        <%--                    console.log(item);--%>
        <%--                    var table = $("table");--%>
        <%--                    var tr = document.createElement("tr");--%>
        <%--                    var td1 = document.createElement("td");--%>
        <%--                    td1.innerText = item.orderNo;--%>
        <%--                    tr.append(td1);--%>
        <%--                    var td2 = document.createElement("td");--%>
        <%--                    td2.innerText = item.menuId;--%>
        <%--                    tr.append(td2);--%>
        <%--                    var td3 = document.createElement("td");--%>
        <%--                    td3.innerText = item.menuName;--%>
        <%--                    tr.append(td3);--%>
        <%--                    var td4 = document.createElement("td");--%>
        <%--                    td4.innerText = item.price;--%>
        <%--                    tr.append(td4);--%>
        <%--                    var td5 = document.createElement("td");--%>
        <%--                    td5.innerText = item.quantity;--%>
        <%--                    tr.append(td5);--%>
        <%--                    var td6 = document.createElement("td");--%>
        <%--                    td6.innerText = item.totalPrice;--%>
        <%--                    tr.append(td6);--%>

        <%--                    var btn1=document.createElement("input");--%>
        <%--                    btn1.setAttribute("type","button");--%>
        <%--                    btn1.setAttribute("name","update");--%>
        <%--                    btn1.setAttribute("value","更新");--%>
        <%--                    btn1.setAttribute("class","layui-btn layui-btn-sm");--%>
        <%--                    btn1.setAttribute("onclick","window.location.href='${ctx}/orderItem/update'");--%>


        <%--                    var btn2=document.createElement("input");--%>
        <%--                    btn2.setAttribute("type","button");--%>
        <%--                    btn2.setAttribute("name","more");--%>
        <%--                    btn2.setAttribute("value","基本信息");--%>
        <%--                    btn2.setAttribute("class","layui-btn layui-btn-sm");--%>

        <%--                    var btn3=document.createElement("input");--%>
        <%--                    btn3.setAttribute("type","button");--%>
        <%--                    btn3.setAttribute("name","over");--%>
        <%--                    btn3.setAttribute("value","订单完成");--%>
        <%--                    btn3.setAttribute("class","layui-btn layui-btn-sm");--%>
        <%--                    tr.append(btn1,btn2,btn3);--%>

        <%--                    table.append(tr);--%>
        <%--                })}--%>
        <%--        });--%>
        <%--    });--%>



        </script>

        </tbody>
    </table>
    <script type="text/javascript" src="${ctx}/js/jquery-2.1.4.min.js"></script>

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

<%--<script>--%>
<%--    $(document).ready(function () {--%>
<%--        let orderNo = "${requestScope.orderNo}";--%>
<%--        $.get("${ctx}/orderItem/getOrderItem", function (data, status) {--%>

<%--            $.each(data, function (index, item) {--%>
<%--                if (item.orderNo != orderNo) return true;--%>
<%--                console.log(item);--%>
<%--                $("#orderNo").prop("readonly",orderNo);--%>
<%--                $("#orderNo").prop("value",orderNo);--%>
<%--                $("#menuId").prop("value",item.menuId);--%>
<%--                $("#menuName").prop("value",item.menuName);--%>
<%--                $("#tableId").prop("value",item.tableId);--%>
<%--                $("#price").prop("value",item.price);--%>
<%--                $("#quantity").prop("value",item.quantity);--%>
<%--                $("#totalPrice").prop("value",item.totalPrice);--%>
<%--            });--%>
<%--        });--%>
<%--        // Map data-->--%>

<%--    });--%>
<%--</script>--%>

</html>
