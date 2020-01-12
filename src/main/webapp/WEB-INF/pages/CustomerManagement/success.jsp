<%--
  Created by IntelliJ IDEA.
  User: VT Daniel
  Date: 2020/1/6
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" isErrorPage="true" %>
<% pageContext.setAttribute("ctx",request.getContextPath());%>
<% System.out.println(request.getContextPath()); %>

<html>
<head>
    <title>success</title>
    <meta http-equiv="refresh" content="5;url=">
</head>
<body onload="init()">
customer success!
</a>


<script language="javascript" type="text/javascript">
    // 以下方式直接跳转

    function init(){

        let id="${requestScope.customer}";
        console.log(id);
        sessionStorage.setItem("customerId",id);
        window.location.href="${ctx}/CustomerManagement/";

        // 以下方式定时跳转
        //setTimeout("javascript:location.href='hello.html'", 5000);

    }

</script>
</body>
</html>
