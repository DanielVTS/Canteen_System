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
    <div class="console"></div>

    <table class="layui-table">
        <thead>
        <tr>
            <th>桌号</th>
            <th>桌名</th>
            <th>座位数</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

        <script>
            let listData;
            let tableStatus=1;
            console.log(tableStatus);
            //console.log(tableName);
            //jquery代码都必须写在ready方法中
            $(document).ready(function () {
                getListData();

                filter(tableStatus);
            });

            function getListData() {
                $.ajaxSettings.async = false;
                $.get("${ctx}/table/getTableList",function(data){
                    //调试用
                    //console.log(data);
                    //console.log("数据: " + data + "\n状态: " + status);
                    listData=data;
                });
                $.ajaxSettings.async = true;
            }

            function filter(tableStatus) {

                    for(let item of listData) {
                        if(tableStatus=item.tableStatus)
                        loadList(item);

                }

            }

            function loadList(item) {
                var table = $("table");
                var tr = document.createElement("tr");
                var td1 = document.createElement("td");
                td1.innerText = item.tableId;
                tr.append(td1);
                var td2 = document.createElement("td");
                //图片？？？？
                td2.innerText = item.tableName;
                tr.append(td2);
                var td3 = document.createElement("td");
                td3.innerText = item.tableSeat;
                tr.append(td3);
                var btn1=document.createElement("input");
                btn1.setAttribute("type","submit");
                btn1.setAttribute("name","update");
                btn1.setAttribute("value","订台");
                btn1.setAttribute("class","layui-btn layui-btn-sm");
                btn1.setAttribute("onclick","setTableId("+item.tableId+");window.location.href='${ctx}/CustomerManagement/addOrder'");
                tr.append(btn1);
                table.append(tr);

            }


            function setTableId(id) {
                console.log(id);
                if (sessionStorage.getItem("tableId")!=null) sessionStorage.removeItem("tableId")
                sessionStorage.setItem("tableId",id);

            }

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