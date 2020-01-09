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
<div>
    <table>
        <thead>
        <tr>
            <th>id</th>
            <th>用户名</th>
            <th>手机</th>
            <th>邮箱</th>
            <th>生日</th>
            <th>注册时间</th>
            <th>登陆时间</th>
            <th>用户密码</th>
        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>

<script type="text/javascript" src="${ctx}/js/jquery-2.1.4.min.js"></script>
<script>
    //jquery代码都必须写在ready方法中
    $(document).ready(function () {
        $.get("${ctx}/customer/getCustomerList",function(data,status){
            console.log(data);
            console.log("数据: " + data + "\n状态: " + status);
            $.each(data, function (index, item) {
                console.log(index);
                console.log(item);
                var table = $("table");
                var tr = document.createElement("tr");
                var td1 = document.createElement("td");
                td1.innerText = item.customerId;
                tr.append(td1);
                var td2 = document.createElement("td");
                td2.innerText = item.customerName;
                tr.append(td2);
                var td3 = document.createElement("td");
                td3.innerText = item.phone;
                tr.append(td3);
                var td4 = document.createElement("td");
                td4.innerText = item.email;
                tr.append(td4);
                var td5 = document.createElement("td");
                td5.innerText = item.birthday;
                tr.append(td5);
                var td6 = document.createElement("td");

                td6.innerText = item.registerTime;
                tr.append(td6);
                var td7 = document.createElement("td");
                td7.innerText = item.loginTime;
                tr.append(td7);
                var td8 = document.createElement("td");
                td8.innerText = item.customerPassword;
                tr.append(td8);
                table.append(tr);
            })
        });
    });

</script>
</body>
</html>
