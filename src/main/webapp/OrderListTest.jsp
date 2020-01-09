<%--
  Created by IntelliJ IDEA.
  User: VT Daniel
  Date: 2020/1/7
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" isErrorPage="true" %>
<% pageContext.setAttribute("ctx",request.getContextPath());%>
<% System.out.println(request.getContextPath()); %>
<html>
<head>
    <title>CustomerListTest</title>
</head>
<body>
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
                td9.innerText = item.endTime;
                tr.append(td9);
                var td10=document.writeln("<button class=\'layui-btn layui-btn-xs\'>修改</button>")
                tr.append(td10);



                table.append(tr);
            })
        });
    });

</script>
</body>
</html>
