<%@ page import="cn.lingnan.pojo.Customer" %>
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
    <meta name="author" content="穷在闹市" />
    <!-- 作者 -->
    <meta name="revised" content="穷在闹市.v3, 2019/05/01" />
    <!-- 定义页面的最新版本 -->
    <meta name="description" content="网站简介" />
    <!-- 网站简介 -->
    <meta name="keywords" content="搜索关键字，以半角英文逗号隔开" />
    <title>穷在闹市出品</title>

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

    <style>
        .layui-form{
            margin-right: 30%;
        }
    </style>

</head>

<body>
<div class="cBody">
    <form id="updateForm" class="layui-form" action="${ctx}/customer/updateForm" method="get">
        <div class="layui-form-item">
            <label class="layui-form-label">用户号</label>
            <div class="layui-input-inline shortInput">
                <input type="text" id="customerId" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline shortInput">
                <input type="text" id="customerName"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">电话</label>
            <div class="layui-input-inline shortInput">
                <input type="text" id="phone" autocomplete="off" class="layui-input" >
            </div>
            <i class="iconfont icon-huaban bt"></i>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-inline shortInput">
                <input type="text" id="email" autocomplete="off" class="layui-input">
            </div>
            <i class="iconfont icon-huaban bt"></i>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户生日</label>
            <div class="layui-input-inline shortInput">
                <input type="text" id="birthday" autocomplete="off" class="layui-input">
            </div>
            <i class="iconfont icon-huaban bt"></i>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">注册时间</label>
            <div class="layui-input-inline shortInput">
                <input type="text" id="registerTime" autocomplete="off" class="layui-input">
            </div>
            <i class="iconfont icon-huaban bt"></i>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">登录时间</label>
            <div class="layui-input-inline shortInput">
                <input type="text" id="loginTime" autocomplete="off" class="layui-input" >
            </div>
            <i class="iconfont icon-huaban bt"></i>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">账户密码</label>
            <div class="layui-input-inline shortInput">
                <input type="text" id="customerPassword" autocomplete="off" class="layui-input" >
            </div>
            <i class="iconfont icon-huaban bt"></i>
        </div>
<%--        <div class="layui-form-item">--%>
<%--            <label class="layui-form-label">台号</label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <select name="tableId" id="tableId" lay-filter="orderStatus">--%>
<%--                    <option value="1">1</option>--%>
<%--                    <option value="2">2</option>--%>
<%--                    <option value="3">3</option>--%>
<%--                    <option value="4">4</option>--%>
<%--                    <option value="5">5</option>--%>
<%--                    <option value="6">6</option>--%>
<%--                    <option value="7">7</option>--%>
<%--                </select>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="layui-form-item">--%>
<%--            <label class="layui-form-label">台号名</label>--%>
<%--            <div class="layui-input-inline shortInput">--%>
<%--                <input type="text" id="tableName" autocomplete="off" class="layui-input">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="layui-form-item">--%>
<%--            <label class="layui-form-label">订单状态</label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <select name="orderStatus" id="orderStatus" lay-filter="orderStatus">--%>
<%--                    <option value=1>1</option>--%>
<%--                    <option value=2>2</option>--%>
<%--                    <option value=3>3</option>--%>
<%--                </select>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="layui-form-item">--%>
<%--            <label class="layui-form-label">订单金额</label>--%>
<%--            <div class="layui-input-inline shortInput">--%>
<%--                <input type="text" id="orderPrice" autocomplete="off" class="layui-input" >--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="layui-form-item layui-form-text">--%>
<%--            <label class="layui-form-label">备注</label>--%>
<%--            <div class="layui-input-block">--%>
<%--                <textarea id="ps" placeholder="请输入内容" class="layui-textarea"></textarea>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="layui-form-item">--%>
<%--            <div class="layui-input-block">--%>
<%--                <button class="layui-btn" lay-submit lay-filter="submitBut">立即提交</button>--%>
<%--                <button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
<%--            </div>--%>
<%--        </div>--%>
    </form>

    <!-- 三级省市 插件 -->
    <%--    <script src="../../framework/area.js"></script>--%>
    <%--    <script src="../../framework/province.js"></script>--%>
</div>



</body>

<script>

    $(document).ready(function () {
        let orderNo = "${requestScope.orderNo}";

        $.get("${ctx}/orderList/getOrderList", function (data, status) {
            // console.log(data);
            // console.log("数据: " + data + "\n状态: " + status);
            $.each(data, function (index, item) {
                // console.log(index);
                // console.log(item);

                if (item.customerId != customerId) return true;
                console.log(item);

                //$("#orderNo").prop("value",orderNo);
                $("#customerId").prop("readonly",customerId);
                $("#customerId").prop("value",customerId);
                $("#customerName").prop("value",item.customerName);
                $("#phone").prop("value",item.phone);
                $("#email").prop("value",item.email);
                $("#birthday").prop("value",item.birthday);
                $("#registerTime").prop("value",item.registerTime);
                $("#loginTime").prop("value",item.loginTime);
                $("#customerPassword").prop("value",item.customerPassword);
            });
        });
        // Map data-->

    });
</script>

</html>