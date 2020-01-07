<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<% pageContext.setAttribute("ctx",request.getContextPath());%>
<%--<% System.out.println(request.getContextPath()); %>--%>
<!DOCTYPE html>
<html>
<head>
    <title>注册</title>
</head>
<body>
<form action="/user/reg" method="post">
    <input type="text" name="name" placeholder="请输入用户名">
    <input type="text" name="password" placeholder="请输入密码">
    <input type="text" name="cfmpassword" placeholder="请再次输入密码">
    <button>注册</button>
</form>

</body>
</html>
