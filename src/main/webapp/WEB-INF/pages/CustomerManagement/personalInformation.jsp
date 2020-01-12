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
        .layui-form-label{
            width: 100px;
        }
        .layui-input-block{
            margin-left: 130px;
        }
    </style>

</head>

<body>
<div class="cBody">
    <form id="addForm" class="layui-form" action="${ctx}/CustomerManagement/updateForm" method="get">
        <div class="layui-form-item">
            <label class="layui-form-label">顾客号</label>
            <div class="layui-input-block">
                <input type="text" name="customerId" id="customerId"  autocomplete="off" class="layui-input" readonly="readonly" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="customerName" id="customerName" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">电话</label>
            <div class="layui-input-block">
                <input type="text" name="phone" id="phone" required lay-verify="required" autocomplete="off" class="layui-input" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-block">
                <input type="text" name="email" id="email" required lay-verify="required" autocomplete="off" class="layui-input" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">生日</label>
            <div class="layui-input-block">
                <input type="text" name="birthday" id="birthday" autocomplete="off" class="layui-input" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="text" name="customerPassword" required lay-verify="required" id="customerPassword" autocomplete="off" class="layui-input" >
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="submitBut" onclick="">修改信息</button>
            </div>>
        </div>
    </form>

</div>
</body>


<%--    <script>--%>
<%--        layui.use(['upload','form'], function() {--%>
<%--            var form = layui.form;--%>
<%--            var upload = layui.upload;--%>
<%--            var layer = layui.layer;--%>
<%--            //监听提交--%>
<%--            //解决了layui.open弹窗从内部关闭这个弹窗的问题--%>
<%--            form.on('submit(submitBut)', function(data) {--%>
<%--                var updateFrame = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引--%>
<%--                parent.layer.close(updateFrame);  //再改变当前层的标题--%>
<%--            });--%>
<%--            form.verify({--%>
<%--                //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]--%>
<%--                ZHCheck: [--%>
<%--                    /^[\u0391-\uFFE5]+$/--%>
<%--                    ,'只允许输入中文'--%>
<%--                ]--%>
<%--            });--%>
<%--            //拖拽上传--%>
<%--            upload.render({--%>
<%--                elem: '#goodsPic',--%>
<%--                url: '/upload/',--%>
<%--                done: function(res) {--%>
<%--                    console.log(res)--%>
<%--                }--%>
<%--            });--%>
<%--        });--%>
<%--    </script>--%>


<script>

    $(document).ready(function () {
        let customerId = Number(sessionStorage.getItem("customerId"));

        console.log(customerId);


        $.post("${ctx}/customer/getCustomerById",{id:customerId},function(data,status) {

            $.each(data, function (index, item) {


                if (item.customerId != customerId) return true;
                console.log(item);
                $("#customerId").prop("value",item.customerId);

                $("#customerName").prop("value",item.customerName);

                $("#phone").prop("value",item.phone);

                $("#email").prop("value",item.email);

                $("#birthday").prop("value",item.birthday);

                $("#customerPassword").prop("value",item.customerPassword);

            });
        });
        // Map data-->

    });
</script>




</html>
