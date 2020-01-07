<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" isErrorPage="true" %>
<% pageContext.setAttribute("ctx",request.getContextPath());%>
<% System.out.println(request.getContextPath()); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link href="${ctx}/layui/css/layui.css" rel="stylesheet">
</head>
<body>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md-offset4 layui-col-md4 ">
            <form class="layui-form" action="${ctx}/customer/login" method="post">
                <h1 class="layui-input-block">欢迎使用</h1>
                <div class="layui-form-item">
                    <input type="text" class="layui-input" name="email" placeholder="请输入用户名">
                </div>
                <div class="layui-form-item">
                    <input type="password" class="layui-input" name="password" placeholder="请输入密码">
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">登录</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
                <a href="out_dated/reg.jsp">注册</a>
            </form>
        </div>
    </div>
</div>


</body>
</html>
