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
    <link rel="stylesheet" type="text/css" href="../../css/base.css">
    <link rel="stylesheet" type="text/css" href="../../css/iconfont.css">
    <script type="text/javascript" src="../../framework/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../layui/css/layui.css">
    <script type="text/javascript" src="../../layui/layui.js"></script>
    <!-- 滚动条插件 -->
    <link rel="stylesheet" type="text/css" href="../../css/jquery.mCustomScrollbar.css">
    <script src="../../framework/jquery-ui-1.10.4.min.js"></script>
    <script src="../../framework/jquery.mousewheel.min.js"></script>
    <script src="../../framework/jquery.mCustomScrollbar.min.js"></script>
    <script src="../../framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
    <!-- 公共样式 结束 -->

    <style>
        .layui-table img {
            max-width: none;
        }
    </style>

</head>

<body>
<div class="cBody">
    <div class="console">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <input type="text" name="name" required lay-verify="required" placeholder="输入菜品名称" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-input-inline">
                    <select name="provid" id="provid" lay-filter="provid">
                        <option value="">种类</option>
                    </select>
                </div>
                <button class="layui-btn" lay-submit lay-filter="formDemo">检索</button>
                <a class="layui-btn">导入商品</a>
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
            <th>菜号</th>
            <th>菜图</th>
            <th>菜名</th>
            <th>单价</th>
            <th>种类</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>HTML5</td>
            <td><img src="../../images/goodsPIC1.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
            <td>10</td>
            <td>斤</td>
            <td>技术</td>
            <td>CSS3</td>
            <td>
                <button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
                <button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
            </td>
        </tr>
        <tr>
            <td>HTML5</td>
            <td><img src="../../images/goodsPIC2.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
            <td>10</td>
            <td>斤</td>
            <td>技术</td>
            <td>CSS3</td>
            <td>
                <button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
                <button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
            </td>
        </tr>
        <tr>
            <td>HTML5</td>
            <td><img src="../../images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
            <td>10</td>
            <td>斤</td>
            <td>技术</td>
            <td>CSS3</td>
            <td>
                <button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
                <button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
            </td>
        </tr>
        </tbody>


        <script>
            //jquery代码都必须写在ready方法中
            $(document).ready(function () {
                $.get("${ctx}/menu/getMenu",function(data,status){
                    console.log(data);
                    console.log("数据: " + data + "\n状态: " + status);
                    $.each(data, function (index, item) {
                        console.log(index);
                        console.log(item);
                        var table = $("table");
                        var tr = document.createElement("tr");
                        var td1 = document.createElement("td");
                        td1.innerText = item.menuId;
                        tr.append(td1);
                        var td2 = document.createElement("td");
                        //图片？？？？
                        td2.innerText = item.picture;
                        tr.append(td2);
                        var td3 = document.createElement("td");
                        td3.innerText = item.menuName;
                        tr.append(td3);
                        var td4 = document.createElement("td");
                        td4.innerText = item.price;
                        tr.append(td4);
                        var td5 = document.createElement("td");
                        td5.innerText = item.menuCategory;
                        tr.append(td5);
                        var td6 = document.createElement("td");
                        td6.innerText = item.menuStatus;
                        tr.append(td6);

                        var btn1=document.createElement("input");
                        btn1.setAttribute("type","submit");
                        btn1.setAttribute("name","update");
                        btn1.setAttribute("value","更新");
                        btn1.setAttribute("class","layui-btn layui-btn-sm");

                        var btn2=document.createElement("input");
                        btn2.setAttribute("type","submit");
                        btn2.setAttribute("name","delete");
                        btn2.setAttribute("value","删除");
                        btn2.setAttribute("class","layui-btn layui-btn-sm");
                        tr.append(btn1,btn2);
                        table.append(tr);

                    })
                });
            });

        </script>


    </table>







    <!-- layUI 分页模块 -->
    <div id="pages"></div>
    <script>
        layui.use('laypage', function() {
            var laypage = layui.laypage;

            //总页数大于页码总数
            laypage.render({
                elem: 'pages'
                ,count: 100
                ,layout: ['count', 'prev', 'page', 'next', 'limit', 'skip']
                ,jump: function(obj){
//					      console.log(obj)
                }
            });
        });
        //修改规格
        function specificationsBut(){
            layui.use('layer', function() {
                var layer = layui.layer;

                //iframe层-父子操作
                layer.open({
                    type: 2,
                    area: ['70%', '60%'],
                    fixed: false, //不固定
                    maxmin: true,
                    content: 'specifications_list.html'
                });
            });

        }
        //修改按钮
        var updateFrame = null;
        function updateBut(){
            layui.use('layer', function() {
                var layer = layui.layer;

                //iframe层-父子操作
                updateFrame = layer.open({
                    title: "商品信息修改",
                    type: 2,
                    area: ['70%', '60%'],
                    scrollbar: false,	//默认：true,默认允许浏览器滚动，如果设定scrollbar: false，则屏蔽
                    maxmin: true,
                    content: 'goods_update.html'
                });
            });

        }
    </script>
</div>
</body>

</html>
