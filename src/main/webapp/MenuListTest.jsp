<%--
  Created by IntelliJ IDEA.
  User: VT Daniel
  Date: 2020/1/7
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" isErrorPage="true" %>
<% pageContext.setAttribute("ctx",request.getContextPath());%>
<% System.out.println(request.getContextPath()); %>
<html>
<head>
    <title>CustomerListTest</title>
</head>
<body>
<table class="layui-table">
    <thead>
    <tr>
        <th>id</th>
        <th>菜名</th>
        <th>菜类</th>
        <th>状态</th>
        <th>价格</th>
        <th>图片位置</th>
    </tr>
    </thead>
    <tbody>

    </tbody>
</table>
<script type="text/javascript" src="${ctx}/js/jquery-2.1.4.min.js"></script>
<script>
    //jquery代码都必须写在ready方法中
    var obj;
    $(document).ready(function () {
        $.get("${ctx}/menu/getMenuList",function(data,status){
            // console.log(data);
            // console.log("数据: " + data + "\n状态: " + status);
            $.each(data, function (index, item) {
                // console.log(index);
                // console.log(item);
                var table = $("table");
                var tr = document.createElement("tr");
                var td1 = document.createElement("td");
                td1.innerText = item.menuId;
                tr.append(td1);
                var td2 = document.createElement("td");
                td2.innerText = item.menuName;
                tr.append(td2);
                var td3 = document.createElement("td");
                td3.innerText = item.menuCategory;
                tr.append(td3);
                var td4 = document.createElement("td");
                td4.innerText = item.menuStatus;
                tr.append(td4);
                var td5 = document.createElement("td");
                td5.innerText = item.price;
                tr.append(td5);
                var td6 = document.createElement("td");
                td6.innerText = item.picture;
                tr.append(td6);

                // var td10=document.writeln("<button class=\'layui-btn layui-btn-xs\'>修改</button>");
                // tr.append(td10);



                table.append(tr);
            })
            // Map data-->

            $.ajax(
                {
                    type:"get",
                    dataType:"json",
                    url:"${ctx}/menu/getMenuList",
                    success:function(result){
                        //alert(result);
                        //iG.items = result;
                        obj = eval(result);
                        alert(obj.constructor);
                        //init();//ajax成功后执行init();
                    }
                }
            )

            setTimeout(function () {

                //console.log(iG);
                // for(var key in iG){
                //     console.log("属性：" + key + ",值：" + iG.items[key]);
                // }

                // alert(obj.constructor);
                console.log(obj);


                //init();//ajax成功后执行init();
            }, 20);//模拟ajax请求时间



        });
    });

</script>
</body>
</html>
