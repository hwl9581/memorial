<%--
  Created by IntelliJ IDEA.
  User: 韩文龙
  Date: 2020/4/30 0030
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="bp" value="${pageContext.request.contextPath}" />
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>代办事项系统</title>
    <link rel="stylesheet" href="${bp}/static/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">代办事项系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a menu_url="${bp}/view/add" href="javascript:void(0);">添加代办事项</a></li>
            <li class="layui-nav-item"><a menu_url="${bp}/view/manager" href="javascript:void(0);">代办事项管理</a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    ${sessionScope.loginUser}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退出系统</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed layui-this">
                    <a class="" href="javascript:;">待办事项</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <iframe src="${bp}/view/manager" height="95%" width="100%" style="border: none;box-sizing: border-box" ></iframe>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © 备案号:123456789 阿里代办事项系统
    </div>
</div>
<script src="${bp}/static/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['element','jquery'], function(){
        var element = layui.element;
        var $ = layui.jquery;

        var topage = function (url) {
            $("iframe").attr("src",url);
        }

        $('.layui-layout-left>li>a').click(function () {
            topage($(this).get(0).getAttribute("menu_url"));
        })

    });
</script>
</body>
</html>
