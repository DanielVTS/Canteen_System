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
        <form class="layui-form" action="${ctx}/menu/customerSearch" method="post">
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
            </div>
        </form>
        <button class="layui-btn" onclick="addItem()">添加购物车</button>
        <button class="layui-btn" onclick="addItem()">下一步，确认订单</button>

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

    <table class="layui-table" id="table">
        <thead>
        <tr>
            <th>菜号</th>
            <th>菜图</th>
            <th>菜名</th>
            <th>单价</th>
            <th>数量</th>
            <th>种类</th>
<%--            <th>勾选框</th>--%>
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
    localStorage.setItem("menuCategory",menuCategory);
    console.log(menuCategory);


    let locationURL="";

    if (locationurl == "") {
        locationURL = "${ctx}/menu/customerGetMenuList";
    } else locationURL = "${ctx}" + locationurl;



    //jquery代码都必须写在ready方法中
            $(document).ready(function () {

                console.log(locationURL);
                $.post(locationURL,{menuName:menuName,menuCategory:menuCategory},function(data){
                    $.each(data, function (index, item) {
                        if(item.menuStatus!=1) return true;
                        // console.log(index);
                        // console.log(item);
                        var table = $("table");
                        var tr = document.createElement("tr");

                        var td2 = document.createElement("td");
                        td2.innerText = item.menuId;
                        td2.setAttribute("name","menuId");
                        tr.append(td2);

                        var td3 = document.createElement("td");
                        //图片？？？？
                        td3.innerText = item.picture;

                        tr.append(td3);

                        var td4 = document.createElement("td");
                        td4.innerText = item.menuName;
                        tr.append(td4);

                        var td5 = document.createElement("td");
                        td5.innerText = item.price;
                        td5.setAttribute("name","price");
                        tr.append(td5);

                        var td6 = document.createElement("td");
                        td6.innerHTML="<input type='number' id='itemValue' max='99' min='0'>";
                        td6.setAttribute("name","count");
                        tr.append(td6);

                        var td7 = document.createElement("td");
                        td7.innerText = item.menuCategory;
                        tr.append(td7);

                        table.append(tr);

                    })
                });
            });

        </script>
        </tbody>
    </table>

    <script type="text/javascript" src="${ctx}/js/jquery-2.1.4.min.js"></script>
    <script>
        function addItem(){
            const table = document.getElementById("table");
            console.log(table);
            var list=[];
            let tr=table.getElementsByTagName("tr");
            for (var i=1;i<tr.length;i++){
                let target=tr[i].querySelectorAll("[name]"),obj={};
                console.log(target);
                for (var j=0;j<target.length;j++){
                    if(target[j].getAttribute("name")=="menuId"){
                        let cell=target[j].childNodes.item(0);
                        obj[target[j].getAttribute("name")]=cell.data;
                    }else if(target[j].getAttribute("name")=="price"){
                        let cell=target[j].childNodes.item(0);
                        obj[target[j].getAttribute("name")]=cell.data;
                    }else{
                        let inputElement=target[j].childNodes.item(0);
                        obj[target[j].getAttribute("name")]=inputElement.value;
                    }
                }
                list.push(obj);
            }
            let CustomerId=sessionStorage.getItem("customerId");
            obj={"id":CustomerId};
            list.push(obj);
            console.log(list);

            //提交数据，处理回传data(总价)，跳转至确认订单页

            $.ajax({
                url:"${ctx}/shoppingCar/getTotalPrice",
                success:function(data){console.log(data);},
                dataType:"json"
            })





            

        }
    </script>





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
