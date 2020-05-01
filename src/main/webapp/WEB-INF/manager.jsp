<%--
  Created by IntelliJ IDEA.
  User: 韩文龙
  Date: 2020/4/30 0030
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="bp" value="${pageContext.request.contextPath}" />
<html>
<head>
    <link rel="stylesheet" href="${bp}/static/layui/css/layui.css" />
    <style type="text/css">
        .layui-btn {
            width: 70px;
            height: 27px;
            font-size: 10px;
            text-align: center;
            line-height: 30px;
        }
    </style>
</head>
<body>
    <table id="manager" lay-filter="manager"></table>

    <div id="open" style="display: none; padding: 15px">
        <form class="layui-form layui-form-pane" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">事项主题</label>
                <div class="layui-input-block">
                    <input type="text" name="thingName" required  lay-verify="required" placeholder="请输入主题" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">事项状态</label>
                <div class="layui-input-block">
                    <select name="state" lay-verify="required">
                        <option value=""></option>
                        <option value="1">待完成</option>
                        <option value="2">已完成</option>
                        <option value="3">已过期</option>
                        <option value="4">已删除</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">事项内容</label>
                <div class="layui-input-block">
                    <textarea name="thingDetail" placeholder="请输入内容" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">结束时间:</label>
                <div class="layui-input-block"> <!-- 注意：这一层元素并不是必须的 -->
                    <input type="text" name="endTime" autocomplete="off" class="layui-input" id="endTime">
                </div>
            </div>
        </form>
    </div>
<script src="${bp}/static/layui/layui.js"></script>
<script>
    layui.use(['table','layer','jquery','laydate','form'],function () {
        var table = layui.table;
        var layer = layui.layer;
        var $ = layui.jquery;
        var laydate = layui.laydate;
        var form = layui.form;

        table.render({
            elem:'#manager'
            ,height: 630
            ,url: '/memorial/thing' //数据接口
            ,page: true //开启分页
            ,parseData:function (obj) {
                console.log(obj);
                return {
                    "code":obj.code,
                    "msg":obj.msg,
                    "data":obj.data.list,
                    "count":obj.data.total
                }
            }
            ,cols: [[ //表头
            {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
            ,{field: 'thingName', title: '代办事项主题', width:200}
            ,{field: 'thingDetail', title: '代办事项内容', width:200}
            ,{field: 'startTime', title: '创建时间', width:200, templet:'<div>{{ layui.util.toDateString(d.startTime, "yyyy-MM-dd HH:mm:ss") }}</div>'}
            ,{field: 'endTime', title: '结束时间', width: 200, templet:'<div>{{ layui.util.toDateString(d.endTime, "yyyy-MM-dd HH:mm:ss") }}</div>'}
            ,{field: 'state', title: '状态',align: 'center' , width: 200, templet:'#state'}
            ,{title: '操作', toolbar:'#bar',align:'center'}
        ]]
    });

        laydate.render({
            elem:'#endTime',
            type:'datetime',
            trigger:'click',
            theme:'grid'
        })

        table.on('tool(manager)',function (obj) {
            let data = obj.data;
            console.log(data);
            if (obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    $.ajax({
                        url:'/memorial/thing/delete',
                        type:'post',
                        data:{"id":data.id},
                        dataType:'json',
                        success:function (obj) {
                            if (obj.code == 200){
                                location.reload();
                            }
                        }
                    })
                });
            } else {
                $('#endTime').val(format(data.endTime));
                $('[name="thingName"]').val(data.thingName);
                $('[name="thingDetail"]').val(data.thingDetail);
                for (let i = 0; i < $('[name="state"] > option').length; i++){
                    if ($('[name="state"] > option').get(i).value == data.state ){
                        console.log($('[name="state"] > option').get(i).value);
                        $($('[name="state"] > option').get(i)).attr("selected","selected");
                    }
                    form.render();
                }
                layer.open({
                    type: 1,
                    area:['400px','500px'],
                    title: '修改代办事项',
                    content: $('#open'),
                    anim: 4,
                    shadeClose:true,
                    btn:['提交','关闭'],
                    yes: function () {
                        let id = data.id;
                        let thingName = $('[name="thingName"]').val();
                        let thingDetail = $('[name="thingDetail"]').val();
                        let state = $('[name="state"] option:selected').val();
                        console.log($('[name="state"] option:selected'));
                        let endTime = $('[name="endTime"]').val();
                        let startTime = data.startTime;
                        $.ajax({
                            url:'/memorial/thing/update',
                            type:'post',
                            data: {
                                "id":id,
                                "thingName":thingName,
                                "thingDetail":thingDetail,
                                "state":state,
                                "endTime":endTime,
                                "startTime":startTime
                            },
                            dataType:'json',
                            success:function (obj) {
                                if(obj.code == 200){
                                    location.reload();
                                }
                            }
                        })
                    }
                })
            }
        })

    })
</script>
<script>
    function format(timestamp) {
        var time = new Date(timestamp);
        var y = time.getFullYear();
        var m = time.getMonth() + 1;
        var d = time.getDate();
        var h = time.getHours();
        var mm = time.getMinutes();
        var s = time.getSeconds();
        return y + '-' + m + '-' + d  + ' ' + h + ':' + mm + ':' +s;
    }
</script>
<script type="text/html" id="state">
{{# if(d.state == 1){ }}
    <a class="layui-btn layui-btn-normal">待完成</a>
{{# }else if(d.state == 2){ }}
    <a class="layui-btn">已完成</a>
{{# }else if(d.state == 3){ }}
    <a class="layui-btn layui-btn-warm">已过期</a>
{{# }else if(d.state == 4){ }}
    <a class="layui-btn layui-btn-danger">已删除</a>
{{# } }}
</script>
<script type="text/html" id="bar">
    <a class="layui-btn layui-btn-xs"  lay-event="edit" style="height: 20px;  width: 30px ; line-height: 22px">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" style="height: 20px;  width: 30px; line-height: 22px">删除</a>
</script>
</body>
</html>
