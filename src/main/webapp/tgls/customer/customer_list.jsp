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

    <title>混吃等死</title>

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
    <style type="text/css">
        td{text-align: center;vertical-align:middle;}

    </style>
</head>

<body>
<div class="cBody">
    <div class="console">
        <form class="layui-form" action="${ctx}/customer/search" method="post">
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <input type="text" name="customerName"  placeholder="输入姓名" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-input-inline">
                <input type="text" name="phone"  placeholder="电话" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-input-inline">
                <input type="text" name="email"  placeholder="邮箱" autocomplete="off" class="layui-input">
                </div>
                <button class="layui-btn">检索</button>
            </div>
        </form>

    </div>

    <table class="layui-table">
        <thead>
        <tr>
            <th>顾客号</th>
            <th>顾客名</th>
            <th>顾客电话</th>
            <th>顾客邮箱</th>
            <th>顾客生日</th>
            <th>注册时间</th>
            <th>登录时间</th>
            <th>账号密码</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

        <script>
            let locationurl="${requestScope.locationurl}"
            localStorage.setItem("locationurl",locationurl);
            console.log(locationurl);

            let customerName = "${requestScope.customerName}";
            localStorage.setItem("customerName",customerName);
            console.log(customerName);

            let email = "${requestScope.email}";
            localStorage.setItem("email",email);
            console.log(email);
            
            let phone = "${requestScope.phone}";
            localStorage.setItem("phone",phone);
            console.log(phone);


            let locationURL="";

            if(locationurl=="")
            {
                locationURL="${ctx}/customer/getCustomerList";
            }
            else locationURL="${ctx}"+locationurl;


            
            //jquery代码都必须写在ready方法中
            $(document).ready(function () {
                console.log(locationURL);
                $.post(locationURL,{customerName: customerName,email:email,phone:phone},function(data){
                    console.log(data);
                    console.log("数据: " + data + "\n状态: " + status);
                    var id=0
                    $.each(data, function (index, item) {
                        console.log(index);
                        console.log(item);
                        var table = $("table");
                        var tr = document.createElement("tr");
                        var td1 = document.createElement("td");
                        td1.innerText = item.customerId;
                        tr.append(td1);
                        var td2 = document.createElement("td");
                        td2.innerText = item.customerName;
                        tr.append(td2);
                        var td3 = document.createElement("td");
                        td3.innerText = item.phone;
                        tr.append(td3);
                        var td4 = document.createElement("td");
                        td4.innerText = item.email;
                        tr.append(td4);

                        var td5 = document.createElement("td");
                        var date =getDate(item.birthday);
                        td5.innerText =date;
                        tr.append(td5);

                        var td6 = document.createElement("td");
                        td6.innerText = item.registerTime;
                        tr.append(td6);

                        var td7 = document.createElement("td");
                        td7.innerText = item.loginTime;
                        tr.append(td7);
                        var td8 = document.createElement("td");
                        td8.innerText = item.customerPassword;
                        tr.append(td8);

                        const url1 = "window.location.href='${ctx}/customer/update?customerId=" +item.customerId+"'";
                        console.log(url1);
                        var btn1=document.createElement("input");
                        btn1.setAttribute("type","button");
                        btn1.setAttribute("name","update");
                        btn1.setAttribute("value","修改信息");
                        btn1.setAttribute("class","layui-btn layui-btn-sm");
                        btn1.setAttribute("onclick",url1);

                        const url2 = "window.location.href='${ctx}/customer/delete?customerId=" +item.customerId+"'";
                        console.log(url2);
                        var btn2=document.createElement("input");
                        btn2.setAttribute("type","button");
                        btn2.setAttribute("name","more");
                        btn2.setAttribute("value","删除用户");
                        btn2.setAttribute("class","layui-btn layui-btn-sm");
                        btn2.setAttribute("onclick",url2);

                        tr.append(btn1,btn2);

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
    <script>
        function getTime(second,getDateType) {
            var date =new Date(second);
            if(getDateType==0){
                return date.getFullYear();
            }else if(getDateType==1){
                if((date.getMonth()+1)<=9){
                    return "0"+(date.getMonth()+1);
                }else {
                    return date.getMonth()+1;
                }
            }else if(getDateType==2){
                if(date.getDate()<=9){
                    return "0"+date.getDate();
                }else {
                    return date.getDate();
                }
            }else if(getDateType==3){
                if(date.getHours()<=9){
                    return "0"+date.getHours();
                }else {
                    return date.getHours();
                }
            }else if(getDateType==4){
                if(date.getMinutes()<=9){
                    return "0"+date.getMinutes();
                }else {
                    return date.getMinutes();
                }
            }else if(getDateType==5){
                return date.getSeconds ();
            }else {
                alert("输入时间格式有误!");
                return;
            }


        }
    </script>
    <script>
        function getDate(second)
        {
            var time=second;
            console.log(getTime(second,0));
            console.log(getTime(second,1));
            console.log(getTime(second,2));
            var day=getTime(second,0)+"-"+getTime(second,1)+"-"+getTime(second,2);
            return day;

        }
    </script>
</div>
</body>

</html>


