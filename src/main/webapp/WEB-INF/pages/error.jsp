<%--
  Created by IntelliJ IDEA.
  User: VT Daniel
  Date: 2020/1/9
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" isErrorPage="true" %>
<% pageContext.setAttribute("ctx",request.getContextPath());%>
<% System.out.println(request.getContextPath()); %>
<html>
<head>
    <title>Title</title>

</head>
<body onload="PopMsg()">

<script>
    function PopMsg(){
        let msg ="${requestScope.msg}";
        if(msg=='information error!'){
            alert("个人信息有误！请检查！")
        }
        if(msg=="server error!") {
            alert("error!")
        }
        window.history.back(-1);
    }
</script>
</body>
</html>
