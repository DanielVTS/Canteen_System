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
        .layui-form{
            margin-right: 30%;
        }
    </style>

</head>

<body>
<div class="cBody">
    <form id="updateForm" class="layui-form" action="${ctx}/menu/updateForm" method="get">
        <div class="layui-form-item">
            <label class="layui-form-label">菜号</label>
            <div class="layui-input-block">
                <input type="text" name="menuId" id="menuId"  autocomplete="off" class="layui-input" readonly="readonly" >
            </div>
        </div>

<%--        <div class="layui-form-item">--%>
<%--            <label class="layui-form-label">菜品图片</label>--%>
<%--            <div class="layui-upload-drag" id="goodsPic">--%>
<%--                <i class="layui-icon"></i>--%>
<%--                <p>点击上传，或将文件拖拽到此处</p>--%>
<%--            </div>--%>
<%--        </div>--%>

        <div class="layui-form-item">
            <label class="layui-form-label">图片地址</label>
            <div class="layui-input-block">
                <input type="text" name="picture" id="picture" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">菜名</label>
            <div class="layui-input-block">
                <input type="text" name="menuName" id="menuName" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">单价</label>
            <div class="layui-input-block">
                <input type="text" name="price" id="price" required lay-verify="required|number" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-inline">
                <select name="menuStatus" lay-filter="provid" id="menuStatus">
                    <option value="1">1</option>
                    <option value="2">2</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">种类</label>
            <div class="layui-input-inline">
                <select name="menuCategory" lay-filter="provid" id="menuCategory">
                    <option value="">种类</option>
                    <option value="荤菜">荤菜</option>
                    <option value="素菜">素菜</option>
                    <option value="水果">水果</option>
                    <option value="汤类">汤类</option>
                    <option value="火锅">火锅</option>
                    <option value="饮品">饮品</option>
                </select>
            </div>
    </div>


        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="submitBut" type="submit">立即更改</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
    </div>




</body>

<%--        <script>--%>
<%--            layui.use(['upload','form'], function() {--%>
<%--                var form = layui.form;--%>
<%--                var upload = layui.upload;--%>
<%--                var layer = layui.layer;--%>
<%--                //监听提交--%>
<%--                form.on('submit(submitBut)', function(data) {--%>
<%--                    return false;--%>
<%--                });--%>
<%--                form.verify({--%>
<%--                    ZHCheck: [--%>
<%--                        /^[\u0391-\uFFE5]+$/--%>
<%--                        ,'只允许输入中文'--%>
<%--                    ]--%>
<%--                });--%>
<%--                upload.render({--%>
<%--                    elem: '#goodsPic',--%>
<%--                    url: '/upload/',--%>
<%--                    done: function(res) {--%>
<%--                        console.log(res)--%>
<%--                    }--%>
<%--                });--%>
<%--            });--%>
<%--        </script>--%>
<script>

    $(document).ready(function () {
        let menuId = "${requestScope.menuId}";

        $.post("${ctx}/menu/getMenuList",function(data,status) {

            $.each(data, function (index, item) {


                if (item.menuId != menuId) return true;

                    console.log(item);
                $("#menuId").prop("value",item.menuId);
                //$("#orderNo").prop("value",orderNo);
                $("#menuName").prop("value",item.menuName);
                // $("#customerName").prop("readonly",customerName);

                $("#menuCategory").prop("value",item.menuCategory);
                // $("#phone").prop("readonly",phone);

                $("#menuStatus").prop("value",item.menuStatus);
                // $("#email").prop("readonly",email);

                $("#price").prop("value",item.price);

                $("#picture").prop("value",item.picture);

            });
        });
        // Map data-->

    });
</script>

</html>
