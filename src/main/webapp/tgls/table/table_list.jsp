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
                    <input type="text" name="name" required lay-verify="required" placeholder="输入桌名" autocomplete="off" class="layui-input">
                </div>
                <button class="layui-btn" lay-submit lay-filter="formDemo">检索</button>
            </div>
        </form>

        <script>            layui.use('form', function() {
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
            <th>桌号</th>
            <th>桌名</th>
            <th>座位数</th>
            <th>状态</th>
            <th>客户电话</th>
            <th>预定时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

        <script>
            //jquery代码都必须写在ready方法中
            $(document).ready(function () {
                $.get("${ctx}/table/getTableList",function(data,status){
                    console.log(data);
                    console.log("数据: " + data + "\n状态: " + status);
                    $.each(data, function (index, item) {
                        console.log(index);
                        console.log(item);
                        var table = $("table");
                        var tr = document.createElement("tr");
                        var td1 = document.createElement("td");
                        td1.innerText = item.tableId;
                        tr.append(td1);
                        var td2 = document.createElement("td");
                        td2.innerText = item.tableName;
                        tr.append(td2);
                        var td3 = document.createElement("td");
                        td3.innerText = item.tableSeat;
                        tr.append(td3);
                        var td4 = document.createElement("td");
                        td4.innerText = item.tableStatus;
                        tr.append(td4);
                        var td5 = document.createElement("td");
                        td5.innerText = item.phone;
                        tr.append(td5);
                        var td6 = document.createElement("td");
                        td6.innerText = item.tableTime;
                        tr.append(td6);

                        <%--const url = "window.location.href='${ctx}/customer/update?customerId=" +item.customerId+"'";--%>
                        <%--console.log(url);--%>

                        const url1 = "window.location.href='${ctx}/table/update?tableId=" +item.tableId+"'";
                        var btn1=document.createElement("input");
                        btn1.setAttribute("type","button");
                        btn1.setAttribute("name","update");
                        btn1.setAttribute("value","修改");
                        btn1.setAttribute("class","layui-btn layui-btn-sm");
                        btn1.setAttribute("onclick",url1);

                        const url2 = "window.location.href='${ctx}/table/delete?tableId=" +item.tableId+"'";
                        var btn2=document.createElement("input");
                        btn2.setAttribute("type","button");
                        btn2.setAttribute("name","more");
                        btn2.setAttribute("value","删除");
                        btn2.setAttribute("class","layui-btn layui-btn-sm");
                        btn2.setAttribute("onclick",url2);
                        tr.append(btn1,btn2);

                        table.append(tr);

                    })
                });
            });



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

        //修改按钮
        var updateFrame = null;
        function updateBut(){
            layui.use('layer', function() {
                var layer = layui.layer;

                //iframe层-父子操作
                updateFrame = layer.open({
                    title: "商品信息修改",
                    type: 2,
                    area: ['70%', '60%'],
                    scrollbar: false,	//默认：true,默认允许浏览器滚动，如果设定scrollbar: false，则屏蔽
                    maxmin: true,
                    content: 'goods_update.html'
                });
            });

        }
    </script>
</div>
</body>

</html>