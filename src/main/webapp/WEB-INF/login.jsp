<%--
  Created by IntelliJ IDEA.
  User: 韩文龙
  Date: 2020/4/30 0030
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="bp" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>登陆页</title>
    <link rel="stylesheet" href="${bp}/static/style/login.css">
</head>
<body>
<div class="wrapper">
    <div class="container">
        <h1>代办事项</h1>

        <form class="form">
            <input name="username" type="text" placeholder="Username">
            <input name="password" type="password" placeholder="Password">
            <button type="button" id="login-button">Login</button>
        </form>
    </div>

    <ul class="bg-bubbles">
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</div>
<script src='${bp}/static/style/jquery.min.js'></script>
<script  src="${bp}/static/style/login.js"></script>
</body>
</html>
