<%--
  Created by IntelliJ IDEA.
  User: chenyubin
  Date: 2020/1/12
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" type="text/css" href="../css/base.css">
    <link rel="stylesheet" type="text/css" href="../css/iconfont.css">
    <script type="text/javascript" src="../framework/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../js/base.js"></script>
    <link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
    <script type="text/javascript" src="../layui/layui.js"></script>
    <!-- 滚动条插件 -->
    <link rel="stylesheet" type="text/css" href="../css/jquery.mCustomScrollbar.css">
    <script src="../framework/jquery-ui-1.10.4.min.js"></script>
    <script src="../framework/jquery.mousewheel.min.js"></script>
    <script src="../framework/jquery.mCustomScrollbar.min.js"></script>
    <script src="../framework/cframe.js"></script>
    <!-- 仅供所有子页面使用 -->
    <!-- 公共样式 结束 -->

    <style>
        textarea{
            width: 100%;
            height: 100px;
            /*max-height: 200px;*/
            text-align: left;
            margin: 10px 0;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #CCC;
            color: #555;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
    </style>

</head>

<body>
<div class="cBody">

    <div class="layui-collapse">
        <!--模块 开始-->
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">欢迎使用订餐系统</h2>
            <div class="layui-colla-content">
                <button class="layui-btn" onmouseenter="getTips(this, '我是tips提示内容1')" onmouseleave="layer.closeAll('tips')">本店招牌</button>
                <textarea>小鸡炖蘑菇￥1&#10;爆炒鱿鱼￥1&#10;金牌炖冬菇￥1</textarea>
                <button class="layui-btn" onmouseenter="getTips(this, '我是tips提示内容1')" onmouseleave="layer.closeAll('tips')">今日特价</button>
                <textarea>香蕉炖牛肉￥1&#10;白饭任装</textarea>
                <div>
                    <b><<--点击左方进行点餐</b><br/>

                </div>
            </div>
        </div>
        <!--模块 结束-->
        <!--模块 开始-->
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">留言板</h2>
            <div class="layui-colla-content">
                <p id="test2"></p>
                <script>
                    $(function(){
                        //时间计时器
                        setInterval(function(){
                            $("#test2").html(getDate());
                        },500);
                    })
                </script>
                <textarea style="height: 140px;">
                </textarea>
                <button class="layui-btn" onmouseenter="getTips(this, '我是tips提示内容1')" onmouseleave="layer.closeAll('tips')">提交</button>
            </div>
        </div>
        <!--模块 结束-->
    </div>



    <script>
        //注意：折叠面板 依赖 element 模块，否则无法进行功能性操作
        layui.use('element', function() {
            var element = layui.element;
        });
    </script>

</div>
</body>

</html>