<%@ page import="cn.lingnan.pojo.OrderItem" %>
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
    <form id="addForm" class="layui-form" action="${ctx}/orderList/addForm" method="get">
        <div class="layui-form-item">
            <label class="layui-form-label">订单号</label>
            <div class="layui-input-inline shortInput">
                <input type="text" id="orderNo" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">菜色号</label>
            <div class="layui-input-inline shortInput">
                <input type="text" id="customerName"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">菜色名</label>
            <div class="layui-input-inline shortInput">
                <input type="text" id="phone" autocomplete="off" class="layui-input" value="112233">
            </div>
            <i class="iconfont icon-huaban bt"></i>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">价格</label>
            <div class="layui-input-inline shortInput">
                <input type="text" id="tableName" autocomplete="off" class="layui-input" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">数量</label>
            <div class="layui-input-inline">
                <select name="orderStatus" id="orderStatus" lay-filter="orderStatus" >
                    <option value=1>1</option>

                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">总价</label>
            <div class="layui-input-inline shortInput">
                <input type="text" id="orderPrice" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" type="submit">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>

    <!-- 三级省市 插件 -->
    <%--    <script src="../../framework/area.js"></script>--%>
    <%--    <script src="../../framework/province.js"></script>--%>
</div>



</body>


</html>