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
    <script src="framework/html5shiv.min.js"></script>
    <script src="framework/respond.min.js"></script>
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
        <img src="images/logo.png"/>
        <div class="logoText">
            <h1>穷在闹市出品</h1>
            <p>qiongzainaoshi</p>
        </div>
    </div>
    <div class="menu">
        <ul>
            <li>
                <a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-liuliangyunpingtaitubiao03 left"></i>订单管理<i class="iconfont icon-dajiantouyou right"></i></a>
                <dl>
<%--                    <dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/agent/orderlist_add.jsp',this)">订单添加</a></dt>--%>
                    <dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/agent/order_list.jsp',this);reset()">订单信息</a></dt>
<%--                    <dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/agent/order_item_add.jsp',this)">录入明细</a></dt>--%>
                    <dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/agent/order_item.jsp',this)">订单明细</a></dt>

                </dl>
            </li>
            <li>
                <a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-shangpin left"></i>菜品管理<i class="iconfont icon-dajiantouyou right"></i></a>
                <dl>
                    <dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/menu/menuType_list.jsp',this)">菜品种类</a></dt>
                    <dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/menu/menu_list.jsp',this)">菜品库</a></dt>
<%--                    <dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/menu/menu_add.jsp',this)">添加菜色</a></dt>--%>
                </dl>
            </li>
            <li>
                <a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-shangpin left"></i>菜桌管理<i class="iconfont icon-dajiantouyou right"></i></a>
                <dl>
                    <dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/table/table_list.jsp',this);reset()">菜桌信息</a></dt>
<%--                    <dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/table/table_add.jsp',this)">新增菜桌</a></dt>--%>
                </dl>
            </li>
<%--            <li>--%>
<%--                <a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-yunying left"></i>基础库内容<i class="iconfont icon-dajiantouyou right"></i></a>--%>
<%--                <dl>--%>
<%--                    <dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/base/base_add.html',this)">表单含编辑器</a></dt>--%>
<%--                    <dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/base/base_list.html',this)">常用列表</a></dt>--%>
<%--                    <dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/base/base_customList.html',this)">可新增的列表</a></dt>--%>
<%--                    <dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/base/base_customNewList.html',this)">可新增的列表(手写)</a></dt>--%>
<%--                    <dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/base/pages.html',this)">页签切换Table</a></dt>--%>
<%--                    <dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/base/maintain.html',this)">维护中页面</a></dt>--%>
<%--                </dl>--%>
<%--            </li>--%>
            <li>
                <a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-icon left"></i>员工管理<i class="iconfont icon-dajiantouyou right"></i></a>
                <dl>
                    <dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/staff/staff_list.jsp',this)">员工信息</a></dt>
                    <dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/staff/staff_add.jsp',this)">员工录入</a></dt>
                </dl>
            </li>
            <li>
                <a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-caiwu left"></i>顾客管理<i class="iconfont icon-dajiantouyou right"></i></a>
                <dl>
                    <dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/customer/customer_list.jsp',this)">顾客信息</a></dt>
                    <dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/customer/customer_add.jsp',this)">添加用户</a></dt>
                </dl>
            </li>
<%--            <li>--%>
<%--                <a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-icon left"></i>报表模块<i class="iconfont icon-dajiantouyou right"></i></a>--%>
<%--                <dl>--%>
<%--                    <dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/reportForm/reportForm1.html',this)">订单统计报表</a></dt>--%>
<%--                </dl>--%>
<%--            </li>--%>
        </ul>
    </div>
</div>
<!-- 左侧菜单 - 结束 -->

<div class="main">
    <!-- 头部栏 - 开始 -->
    <div class="frameTop">
        <img class="jt" src="images/top_jt.png"/>
        <div class="topMenu">
            <ul>
<%--                <li><a href="javascript:void(0)" onclick="menuCAClick('tgls/modify_password.html',this)"><i class="iconfont icon-yonghu1"></i>管理员</a></li>--%>
<%--                <li><a href="javascript:void(0)" onclick="menuCAClick('tgls/modify_password.html',this)"><i class="iconfont icon-xiugaimima"></i>修改密码</a></li>--%>
                <li><a onclick="logout()" href="#"><i class="iconfont icon-084tuichu"></i>注销</a></li>
            </ul>
        </div>
    </div>
    <!-- 头部栏 - 结束 -->

    <!-- 核心区域 - 开始 -->
    <div class="frameMain">
        <div class="title" id="frameMainTitle">
            <span><i class="iconfont icon-xianshiqi"></i>后台首页</span>
        </div>
        <div class="con">
            <iframe id="mainIframe" src="tgls/qdAPI.jsp" scrolling="no"></iframe>
        </div>
    </div>
    <!-- 核心区域 - 结束 -->
</div>
</body>
<script>
    function logout() {
        sessionStorage.clear();
        localStorage.clear();
        alert("logout success!");
        window.location.href="${ctx}";
    }
    function reset(){
        window.localStorage.setItem("orderStatus","0");
        window.localStorage.setItem("orderNo","");

        sessionStorage.removeItem("tableName");
        sessionStorage.setItem("tableStatus","0");
    }
</script>
</html>
