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
<<<<<<< Updated upstream

=======
    <!-- 作者 -->
    <meta name="revised" content="穷在闹市.v3, 2019/05/01" />
    <!-- 定义页面的最新版本 -->
    <meta name="description" content="网站简介" />
    <!-- 网站简介 -->
    <meta name="keywords" content="搜索关键字，以半角英文逗号隔开" />
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
        .layui-form{
            margin-right: 30%;
        }
=======
>>>>>>> Stashed changes
    </style>

</head>

<body>
<div class="cBody">
<<<<<<< Updated upstream
    <form id="updateForm" class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">菜号</label>
            <div class="layui-input-block">
                <input type="text" name="menuId" required lay-verify="required" autocomplete="off" class="layui-input" readonly="readonly">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">菜品图片</label>
            <div class="layui-upload-drag" id="goodsPic">
                <i class="layui-icon"></i>
                <p>点击上传，或将文件拖拽到此处</p>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">菜名</label>
            <div class="layui-input-block">
                <input type="text" name="menuName" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">单价</label>
            <div class="layui-input-block">
                <input type="text" name="price" required lay-verify="required|number" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">状态（库存）</label>
            <div class="layui-input-block">
                <input type="password" name="password2" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">种类</label>
            <div class="layui-input-inline">
                <select name="provid" id="provid" lay-filter="provid">
                    <option value="">种类</option>
                    <option value="0">荤菜</option>
                    <option value="1">素菜</option>
                    <option value="2">水果</option>
                    <option value="3">汤类</option>
                    <option value="4">火锅</option>
                    <option value="4">饮品</option>
                </select>
            </div>

        </div>


        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="submitBut">立即添加</button>
=======
    <form id="addForm" class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">菜色号</label>
            <div class="layui-input-block">
                <input type="text" name="menuId" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">菜色名</label>
            <div class="layui-input-block">
                <input type="text" name="menuName" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">种类</label>
            <div class="layui-input-block">
                <input type="text" name="menuCategory" required lay-verify="required|number" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <input type="password" name="menuStatus" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">单价</label>
            <div class="layui-input-block">
                <input type="password" name="price" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">图片地址</label>
            <div class="layui-input-block">
                <input type="password" name="picture" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="submitBut">立即提交</button>
>>>>>>> Stashed changes
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>


    <script>
        layui.use(['upload','form'], function() {
            var form = layui.form;
            var upload = layui.upload;
            var layer = layui.layer;
            //监听提交
<<<<<<< Updated upstream
            form.on('submit(submitBut)', function(data) {
                return false;
            });
            form.verify({
=======
            //解决了layui.open弹窗从内部关闭这个弹窗的问题
            form.on('submit(submitBut)', function(data) {
                var updateFrame = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                parent.layer.close(updateFrame);  //再改变当前层的标题
            });
            form.verify({
                //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
>>>>>>> Stashed changes
                ZHCheck: [
                    /^[\u0391-\uFFE5]+$/
                    ,'只允许输入中文'
                ]
            });
<<<<<<< Updated upstream
=======
            //拖拽上传
>>>>>>> Stashed changes
            upload.render({
                elem: '#goodsPic',
                url: '/upload/',
                done: function(res) {
                    console.log(res)
                }
            });
        });
    </script>

</div>
</body>
<<<<<<< Updated upstream
<script>

    $(document).ready(function () {
        let customerId = "${requestScope.customerId}";

        $.get("${ctx}/menu/getMenuList",function(data,status) {

            $.each(data, function (index, item) {


                if (item.MenuId != MenuId) return true;
                console.log(item);
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
=======

</html>
>>>>>>> Stashed changes
