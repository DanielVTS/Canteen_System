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

</head>

<body>
<div class="cBody">
    <div class="console">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <input type="text" name="name" required lay-verify="required" placeholder="输入菜色品种" autocomplete="off" class="layui-input">
                </div>
                <button class="layui-btn" lay-submit lay-filter="formDemo">检索</button>
            </div>
        </form>

        <script>
            layui.use('form', function() {
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
            <th>名称</th>
            <th>描述</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>荤菜</td>
            <td>例：肉类、鱼</td>
            <td>
                <button class="layui-btn layui-btn-xs">修改</button>
                <button class="layui-btn layui-btn-xs layui-btn-normal">添加新种类</button>
            </td>
        </tr>
        <tr>
            <td>素菜</td>
            <td>例：时令菜、土豆、冬瓜</td>
            <td>
                <button class="layui-btn layui-btn-xs">修改</button>
                <button class="layui-btn layui-btn-xs layui-btn-normal">添加新种类</button>
            </td>
        </tr>
        <tr>
            <td>水果</td>
            <td>例：苹果、西瓜</td>
            <td>
                <button class="layui-btn layui-btn-xs">修改</button>
                <button class="layui-btn layui-btn-xs layui-btn-normal">添加新种类</button>
            </td>
        </tr>
        <tr>
            <td>汤类</td>
            <td>例：罗宋汤、番茄汤</td>
            <td>
                <button class="layui-btn layui-btn-xs">修改</button>
                <button class="layui-btn layui-btn-xs layui-btn-normal">添加新种类</button>
            </td>
        </tr>
        <tr>
            <td>火锅</td>
            <td>例：麻辣锅、鸳鸯锅</td>
            <td>
                <button class="layui-btn layui-btn-xs">修改</button>
                <button class="layui-btn layui-btn-xs layui-btn-normal">添加新种类</button>
            </td>
        </tr>
        <tr>
            <td>饮品</td>
            <td>例：果汁、汽水</td>
            <td>
                <button class="layui-btn layui-btn-xs">修改</button>
                <button class="layui-btn layui-btn-xs layui-btn-normal">添加新种类</button>
            </td>
        </tr>
        </tbody>
    </table>

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
</div>
</body>

</html>