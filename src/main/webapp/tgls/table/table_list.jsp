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
        <form class="layui-form" >
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <input type="text" id="getTableName"  placeholder="输入桌名" autocomplete="off" class="layui-input">
                </div>
                <button class="layui-btn" onclick="setTableStatus0()" lay-submit lay-filter="formDemo">检索</button>
                <button class="layui-btn" onclick="setTableStatus2()">查看订单未完成的桌子</button>
                <button class="layui-btn" onclick="setTableStatus1()">查看订单已完成的桌子</button>
            </div>
        </form>

<%--        <script>            --%>
<%--            layui.use('form', function() {--%>
<%--            var form = layui.form;--%>

<%--            //监听提交--%>
<%--            form.on('submit(formDemo)', function(data) {--%>
<%--                layer.msg(JSON.stringify(data.field));--%>
<%--                return false;--%>
<%--            });--%>
<%--        });--%>
<%--        </script>--%>
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
            let listData;
            //let orderStatus=0;
            let tableName=sessionStorage.getItem("tableName");
            let tableStatus = Number(sessionStorage.getItem("tableStatus"));
            console.log(tableStatus);
            console.log(tableName);
            //jquery代码都必须写在ready方法中
            $(document).ready(function () {
                getListData();
                //console.log(orderStatus);
                //console.log(listData);
                filter(tableStatus,tableName);
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
            function filter(tableStatus,tableName) {
                console.log(listData);
                if(tableName==null && tableStatus==0){
                    for(let item of listData) {
                        loadList(item);
                    }
                }else{
                    for(let item of listData) {
                        if(tableName==item.tableName||tableStatus==item.tableStatus){
                            loadList(item);
                        }
                    }
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
                var td4 = document.createElement("td");
                td4.innerText = item.tableStatus;
                tr.append(td4);
                var td5 = document.createElement("td");
                td5.innerText = item.phone;
                tr.append(td5);
                var td6 = document.createElement("td");
                td6.innerText = item.tableTime;
                tr.append(td6);



                const url1 = "window.location.href='${ctx}/menu/update?menuId=" +item.menuId+"'";
                console.log(url1)
                var btn1=document.createElement("input");
                btn1.setAttribute("type","submit");
                btn1.setAttribute("name","update");
                btn1.setAttribute("value","更新");
                btn1.setAttribute("class","layui-btn layui-btn-sm");
                btn1.setAttribute("onclick",url1);

                const url2 = "window.location.href='${ctx}/menu/down?menuId=" +item.menuId+"'";
                console.log(url2)
                var btn2=document.createElement("input");
                btn2.setAttribute("type","submit");
                btn2.setAttribute("name","delete");
                btn2.setAttribute("value","下架");
                btn2.setAttribute("class","layui-btn layui-btn-sm");
                btn2.setAttribute("onclick",url2);

                const url3 = "window.location.href='${ctx}/menu/up?menuId=" +item.menuId+"'";
                console.log(url3)
                var btn3=document.createElement("input");
                btn3.setAttribute("type","submit");
                btn3.setAttribute("name","delete");
                btn3.setAttribute("value","上架");
                btn3.setAttribute("class","layui-btn layui-btn-sm");
                btn3.setAttribute("onclick",url3);

                tr.append(btn1,btn2,btn3);
                table.append(tr);

            }
            function setTableStatus0() {
                sessionStorage.setItem("tableStatus","0");
                var Name=$("#getTableName").val();
                console.log(Name);
                sessionStorage.setItem("tableName",Name);
            }

            function setTableStatus1() {
                sessionStorage.setItem("tableStatus","1");
            }
            function setTableStatus2() {
                sessionStorage.setItem("tableStatus","2");
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