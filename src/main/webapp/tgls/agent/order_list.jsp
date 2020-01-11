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
<%--                <div class="layui-input-inline">--%>
<%--                    <input type="text" name="name" required lay-verify="required" placeholder="输入订单状态" autocomplete="off" class="layui-input">--%>
<%--                </div>--%>
<%--                <button class="layui-btn" lay-submit lay-filter="formDemo">检索</button>--%>
                <button class="layui-btn" onclick="setOrderStatus1()">查看未完成订单</button>
                <button class="layui-btn" onclick="setOrderStatus2()">查看已完成订单</button>
            </div>
        </form>

<%--        <script>--%>
<%--            layui.use('form', function() {--%>
<%--                var form = layui.form;--%>
<%--                //监听提交--%>
<%--                form.on('submit(formDemo)', function(data) {--%>
<%--                    layer.msg(JSON.stringify(data.field));--%>
<%--                    return false;--%>
<%--                });--%>
<%--            });--%>
<%--        </script>--%>
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

        <script>
            let listData;
            //let orderStatus=0;
            let orderStatus = Number(localStorage.getItem("orderStatus"));
            //jquery代码都必须写在ready方法中
            $(document).ready(function () {
                getListData();
                console.log(orderStatus);
                //console.log(listData);
                filter(orderStatus);
            });
            //拿数据
            function getListData() {
                $.ajaxSettings.async = false;
                $.get("${ctx}/orderList/getOrderList",function(data){
                    //调试用
                    // console.log(data);
                    listData=data;

                    // console.log("数据: " + data + "\n状态: " + status);
                });

                $.ajaxSettings.async = true;
            }
            //根据status筛选
            function filter(orderStatus) {
                // console.log(orderStatus);
                //console.log(listData[1]);
                for(let item of listData){
                    if(orderStatus==0||item.orderStatus==orderStatus){
                        //console.log(i);
                        // console.log(listData[i]);
                        loadList(item);
                    }
                }
            }
            //加载List
            function loadList(item) {
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
                    td9.innerText = item.endTime;
                    tr.append(td9);

                    const url1 = "window.location.href='${ctx}/orderList/update?orderNo=" +item.orderNo+"'";
                    console.log(url1);

                    var btn1=document.createElement("input");
                    btn1.setAttribute("type","button");
                    btn1.setAttribute("name","update");
                    // btn1.setAttribute("id","btn"+id.toString());
                    btn1.setAttribute("value","更新");
                    btn1.setAttribute("class","layui-btn layui-btn-sm");
                    btn1.setAttribute("onclick",url1);


                    const url2 = "window.location.href='${ctx}/orderList/showList?orderNo=" +item.orderNo+"'";
                    console.log(url2);
                    var btn2=document.createElement("input");
                    btn2.setAttribute("type","button");
                    btn2.setAttribute("name","more");
                    btn2.setAttribute("value","基本信息");
                    btn2.setAttribute("class","layui-btn layui-btn-sm");
                    btn2.setAttribute("onclick",url2);


                    const url3 = "window.location.href='${ctx}/orderList/finish?orderNo=" +item.orderNo+"'";
                    console.log(url3);
                    var btn3=document.createElement("input");
                    btn3.setAttribute("type","button");
                    btn3.setAttribute("name","over");
                    btn3.setAttribute("value","订单完成");
                    btn3.setAttribute("class","layui-btn layui-btn-sm");
                    btn3.setAttribute("onclick",url3);
                    tr.append(btn1,btn2,btn3);

                    table.append(tr);



            }

            function setOrderStatus1() {
                orderNo=document.getElementsByName("input1").values()
                localStorage.setItem("orderStatus","1")
            }
            function setOrderStatus2() {
                localStorage.setItem("orderStatus","2")
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
    </script>

<%--    <script>--%>
<%--        function update(){--%>
<%--        $.ajax({--%>
<%--            type: "POST",--%>
<%--            url: "/customer/register",--%>
<%--            data: form,--%>
<%--            // data: $('#addProductForm').serialize(),--%>
<%--            processData:false,--%>
<%--            contentType:false,--%>
<%--            success: function (result) {--%>
<%--                console.log(result);--%>
<%--                if (result.result == "success") {--%>
<%--                    alert("注册成功！");--%>
<%--                    window.location.href = "${ctx}/login.jsp";--%>
<%--                }--%>
<%--            },--%>
<%--            error: function() {--%>

<%--                alert("注册失败！请重试");--%>
<%--            }--%>
<%--        });--%>
<%--        }--%>
<%--    </script>--%>
<%--    <script>--%>
<%--        function btn(id) {--%>


<%--                $.ajax({--%>
<%--                    url: "/customer/update",--%>
<%--                    type: 'POST',--%>
<%--                    data: {--%>
<%--                        'orderId':id--%>
<%--                    },--%>
<%--                    success: function (arg) {--%>
<%--                    }--%>
<%--                })--%>


<%--        }--%>
<%--    </script>--%>
<%--    <script>--%>
<%--        function bt1(value, id) {--%>
<%--            //判断点击的按钮的id是否存在,不存在则创建,存在则alert--%>
<%--            if(!document.getElementById(id)) {--%>
<%--                //创建input元素--%>
<%--                var inp = document.createElement("input");--%>
<%--                inp.type = "button";--%>
<%--                //传入点击按钮的value值到新的按钮--%>
<%--                inp.value = value;--%>
<%--                //传入点击按钮的id到新的按钮(传入是id+1防止重复)--%>
<%--                inp.id = id;--%>
<%--                //当方法有参数时，用onclick = 方法名(参数)时就有错了，需要在方法名前面加function()--%>
<%--                inp.onclick = function() {--%>
<%--                    b1(id);--%>
<%--                };--%>
<%--                document.getElementById("div").appendChild(inp);--%>
<%--            } else {--%>
<%--                alert("已存在")--%>
<%--            }--%>
<%--        }--%>

<%--    </script>--%>

</div>
</body>

</html>
