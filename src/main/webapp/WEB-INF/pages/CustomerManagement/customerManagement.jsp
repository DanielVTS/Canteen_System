<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" isErrorPage="true" %>
<% pageContext.setAttribute("ctx",request.getContextPath());%>
<% System.out.println(request.getContextPath()); %>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
    <!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
    <meta name="renderer" content="webkit">
    <!--国产浏览器高速模式-->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="网站简介" />
    <!-- 网站简介 -->
    <meta name="keywords" content="搜索关键字，以半角英文逗号隔开" />
    <title>穷在闹市出品</title>

    <!-- 公共样式 开始 -->
    <link rel="shortcut icon" href="${ctx}/images/favicon.ico"/>
    <link rel="bookmark" href="${ctx}/images/favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/css/base.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/css/iconfont.css">
    <script type="text/javascript" src="${ctx}/framework/jquery-1.11.3.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/layui/css/layui.css">
    <!--[if lt IE 9]>
    <script src="${ctx}framework/html5shiv.min.js"></script>
    <script src="${ctx}framework/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="${ctx}/layui/layui.js"></script>
    <!-- 滚动条插件 -->
    <link rel="stylesheet" type="text/css" href="${ctx}/css/jquery.mCustomScrollbar.css">
    <script src="${ctx}/framework/jquery-ui-1.10.4.min.js"></script>
    <script src="${ctx}/framework/jquery.mousewheel.min.js"></script>
    <script src="${ctx}/framework/jquery.mCustomScrollbar.min.js"></script>
    <script src="${ctx}/framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
    <!-- 公共样式 结束 -->

    <link rel="stylesheet" type="text/css" href="${ctx}/css/frameStyle.css">
    <script type="text/javascript" src="${ctx}/framework/frame.js" ></script>

</head>

<body>
<!-- 左侧菜单 - 开始 -->
<div class="frameMenu">
    <div class="logo">
        <img src="${ctx}/images/logo.png"/>
        <div class="logoText">
            <h1>穷在闹市出品</h1>
            <p>qiongzainaoshi</p>
        </div>
    </div>
    <div class="menu">
        <ul>
            <li>
                <a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-liuliangyunpingtaitubiao03 left"></i>我的订单<i class="iconfont icon-dajiantouyou right"></i></a>
                <dl>
                    <dt><a href="javascript:void(0)" onclick="reset();menuCAClick('${ctx}/CustomerManagement/OrderList',this)">查看订单</a></dt>
                    <dt><a href="javascript:void(0)" onclick="menuCAClick('${ctx}/CustomerManagement/showOrderItem',this);reset()">查看订单明细</a></dt>
                </dl>
            </li>
            <li>
                <a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-shangpin left"></i>预定就餐<i class="iconfont icon-dajiantouyou right"></i></a>
                <dl>
                    <dt><a href="javascript:void(0)" onclick="menuCAClick('${ctx}/CustomerManagement/addOrder',this)">预定座位时间</a></dt>
                    <dt><a href="javascript:void(0)" onclick="menuCAClick('${ctx}/CustomerManagement/menuList',this)">预定菜品</a></dt>
                </dl>
            </li>
            <li>
                <a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-shangpin left"></i>个人信息<i class="iconfont icon-dajiantouyou right"></i></a>
                <dl>
                    <dt><a href="javascript:void(0)" onclick="menuCAClick('${ctx}/CustomerManagement/personalInformation',this)">查看我的信息</a></dt>
<%--                    <dt><a href="javascript:void(0)" onclick="menuCAClick('customerManagement.jsp',this)">返回首页</a></dt>--%>
                </dl>
            </li>

        </ul>
    </div>
</div>
<!-- 左侧菜单 - 结束 -->

<div class="main">
    <!-- 头部栏 - 开始 -->
    <div class="frameTop">
        <img class="jt" src="${ctx}/images/top_jt.png"/>
        <div class="topMenu">
            <ul>
                <li><a href="javascript:void(0)"><i class="iconfont icon-yonghu1"></i>客户</a></li>
<%--                <li><a href="javascript:void(0)" onclick="menuCAClick('tgls/modify_password.html',this)"><i class="iconfont icon-xiugaimima"></i>修改密码</a></li>--%>
                <li><a onclick="logout()" href="#" ><i class="iconfont icon-084tuichu"></i>注销</a></li>
            </ul>
        </div>
    </div>
    <!-- 头部栏 - 结束 -->

    <!-- 核心区域 - 开始 -->
    <div class="frameMain">
        <div class="title" id="frameMainTitle">
            <span><i class="iconfont icon-xianshiqi"></i>欢迎使用混吃等死订餐系统</span>
        </div>
        <div class="con">
            <iframe id="mainIframe" src="tgls/qdAPI.html" scrolling="no"></iframe>
        </div>
    </div>
    <!-- 核心区域 - 结束 -->
</div>
</body>
<script>
    if(sessionStorage.getItem("customerId")==null){
        alert("login require!");
        window.location.href="${ctx}";
    }

    function logout() {
        sessionStorage.clear();
        localStorage.clear();
        alert("logout success!");
        window.location.href="${ctx}";
    }
    function reset(){window.localStorage.setItem("orderStatus","0");}
</script>
</html>
