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
    <form id="updateForm" class="layui-form" action="${ctx}/table/updateForm" method="get">
        <div class="layui-form-item">
            <label class="layui-form-label">台号</label>
            <div class="layui-input-block">
                <input type="text" name="tableId" id="tableId"  autocomplete="off" class="layui-input" readonly="readonly" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">台名</label>
            <div class="layui-input-block">
                <input type="text" name="tableName" id="tableName" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">座位数</label>
            <div class="layui-input-inline">
                <select name="tableSeat" lay-filter="provid" id="tableSeat">
                    <option value="2">2</option>
                    <option value="4">4</option>
                    <option value="6">6</option>
                    <option value="8">8</option>
                    <option value="10">10</option>
                    <option value="12">12</option>
                    <option value="20">20</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-inline">
                <select name="tableStatus" lay-filter="provid" id="menuStatus">
                    <option value="1">1</option>
                    <option value="2">2</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户电话</label>
            <div class="layui-input-block">
                <input type="text" name="phone" id="phone" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">预定时间</label>
            <div class="layui-input-block">
                <input type="text" name="tableTime" id="tableTime" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="submitBut">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>




</div>
</body>


    <script>


        $(document).ready(function () {
            let tableId = "${requestScope.tableId}";

            $.get("${ctx}/table/getTableList",function(data,status) {

                $.each(data, function (index, item) {


                    if (item.tableId != tableId) return true;
                    console.log(item);
                    $("#tableId").prop("value",item.tableId)

                    $("#tableName").prop("value",item.tableName);

                    $("#tableSeat").prop("value",item.tableSeat);

                    $("#tableStatus").prop("value",item.tableStatus);

                    $("#phone").prop("value",item.phone);

                    $("#tableTime").prop("value",item.tableTime);

                });
            });
            // Map data-->

        });
    </script>



</html>
