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
        .layui-table img {
            max-width: none;
        }
    </style>

</head>

<body>
<div class="cBody">
    <div class="console">
        <form class="layui-form" action="${ctx}/menu/search" method="post">
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <input type="text" name="menuName" placeholder="输入菜品名称" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-input-inline">
                    <select name="menuCategory" id="menuCategory">
                        <option value="">种类</option>
                        <option value="荤菜">荤菜</option>
                        <option value="素菜">素菜</option>
                        <option value="水果">水果</option>
                        <option value="汤类">汤类</option>
                        <option value="火锅">火锅</option>
                        <option value="饮品">饮品</option>
                    </select>

                </div>
                <button class="layui-btn" type="submit">检索</button>

                <a href="${ctx}/tgls/menu/menu_add.jsp" class="layui-btn">导入商品</a>
            </div>
        </form>

<%--        <script>--%>
<%--            layui.use('form', function() {--%>
<%--                var form = layui.form;--%>

<%--                //监听提交--%>
<%--                form.on('submit(formDemo)', function(data) {--%>
<%--                    layer.msg(JSON.stringify(data.field));--%>
<%--                    return false;--%>
<%--                });--%>
<%--            });--%>
<%--        </script>--%>
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


        <script>
    let locationurl="${requestScope.locationurl}"
    localStorage.setItem("locationurl",locationurl);
    console.log(locationurl);

    let menuName = "${requestScope.menuName}";
    localStorage.setItem("menuName",menuName);
    console.log(menuName);

    let menuCategory = "${requestScope.menuCategory}";
    localStorage.setItem("menuName",menuCategory);
    console.log(menuCategory);


    let locationURL="";

   if(locationurl=="")
    {
    locationURL="${ctx}/menu/getMenuList";
    }
    else locationURL="${ctx}"+locationurl;



    //jquery代码都必须写在ready方法中
            $(document).ready(function () {
                //let locationURL=locationurl ||"${ctx}/menu/getMenuList";
                console.log(locationURL);
                $.post(locationURL,{menuName:menuName,menuCategory:menuCategory},function(data){
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


                        const url1 = "window.location.href='${ctx}/menu/update?menuId=" +item.menuId+"'";
                        console.log(url1)
                        var btn1=document.createElement("input");
                        btn1.setAttribute("type","submit");
                        btn1.setAttribute("name","update");
                        btn1.setAttribute("value","更新");
                        btn1.setAttribute("class","layui-btn layui-btn-sm");
                        btn1.setAttribute("onclick",url1);

                        const url2 = "window.location.href='${ctx}/menu/down?menuId=" +item.menuId+"'";
                        console.log(url2)
                        var btn2=document.createElement("input");
                        btn2.setAttribute("type","submit");
                        btn2.setAttribute("name","delete");
                        btn2.setAttribute("value","下架");
                        btn2.setAttribute("class","layui-btn layui-btn-sm");
                        btn2.setAttribute("onclick",url2);

                        const url3 = "window.location.href='${ctx}/menu/up?menuId=" +item.menuId+"'";
                        console.log(url3)
                        var btn3=document.createElement("input");
                        btn3.setAttribute("type","submit");
                        btn3.setAttribute("name","delete");
                        btn3.setAttribute("value","上架");
                        btn3.setAttribute("class","layui-btn layui-btn-sm");
                        btn3.setAttribute("onclick",url3);

                        tr.append(btn1,btn2,btn3);
                        table.append(tr);

                    })
                });
            });

        </script>
        </tbody>
    </table>

    <script type="text/javascript" src="${ctx}/js/jquery-2.1.4.min.js"></script>





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


    </script>
</div>
</body>

</html>
