<%--
  Created by IntelliJ IDEA.
  User: 韩文龙
  Date: 2020/4/30 0030
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="bp" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${bp}/static/layui/css/layui.css">
</head>
<body>
<form class="layui-form">
    <div class="layui-form-item">
        <label class="layui-form-label">输入标题:</label>
        <div class="layui-input-block">
            <input type="text" name="thingName" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">事项内容:</label>
        <div class="layui-input-block">
            <textarea name="thingDetail" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">开始时间:</label>
        <div class="layui-inline"> <!-- 注意：这一层元素并不是必须的 -->
            <input type="text" name="startTime" autocomplete="off" class="layui-input" id="startTime">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">结束时间:</label>
        <div class="layui-inline"> <!-- 注意：这一层元素并不是必须的 -->
            <input type="text" name="endTime" autocomplete="off" class="layui-input" id="endTime">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" id="submit" type="button" >立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script src="${bp}/static/layui/layui.js"></script>
<script>
    layui.use(['laydate','form','jquery','layer'], function(){
        var laydate = layui.laydate;
        var $ = layui.jquery;
        var layer = layui.layer;


        //执行一个laydate实例
        laydate.render({
            elem: '#startTime' //指定元素
            ,type: 'datetime'
            ,trigger: 'click'
        });

        laydate.render({
            elem: '#endTime' //指定元素
            ,type: 'datetime'
            ,trigger: 'click'
        });

        $('#submit').click(function () {
            let thingName = $('[name="thingName"]').val();
            let thingDetail = $('[name="thingDetail"]').val();
            let startTime = $('[name="startTime"]').val();
            let endTime = $('[name="endTime"]').val();
            console.log(thingName);
            $.ajax({
                url: '/memorial/thing/add',
                type:'post',
                data: {
                    'thingName':thingName,
                    'thingDetail':thingDetail,
                    'startTime':startTime,
                    'endTime':endTime
                },
                dataType:'json',
                success:function (obj) {
                    console.log(obj);
                    if (obj.code == 200){
                        location.href="/memorial/view/manager";
                    } else {
                        layer.msg("添加失败！");
                    }
                }
            })
        });

    });
</script>
</body>
</html>
