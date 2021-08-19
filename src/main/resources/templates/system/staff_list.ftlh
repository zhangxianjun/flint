<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>工作台</title>
    <link rel="stylesheet" href="/js/layui/css/layui.css">
    <script src="/js/layui/layui.js"></script>
</head>
<body class="layui-layout-body" style="padding: 15px;">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">
    <legend>员工列表</legend>
</fieldset>

<div class="layui-btn-group">
    <button type="button" class="layui-btn" onclick="addStaff()">新增员工</button>
</div>

<table class="layui-hide" id="test"></table>

</div>

<script type="text/html" id="operation">
    <a class="layui-btn layui-btn-xs" lay-event="editEvent">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="deleteEvent">删除</a>
</script>

<script>
    layui.use(['table', 'jquery'], function(){
        let $ = layui.$;
        let table = layui.table;
        table.render({
            elem: '#test'
            ,url:'/api/system/staff/list'
            ,cellMinWidth: 80
            ,cols: [[
                {field:'staffId', title: 'ID'}
                ,{field:'zhName', title: '名字'}
                ,{field:'phone', title: '手机号', align: 'center'}
                ,{field:'createTime', title: '创建时间', align: 'center'}
                ,{fixed: 'right', title:'操作', toolbar: '#operation', width:150}
            ]]
        });
        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            if(obj.event === 'deleteEvent'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'editEvent'){
                layer.prompt({
                    formType: 2
                    ,value: data.email
                }, function(value, index){
                    obj.update({
                        email: value
                    });
                    layer.close(index);
                });
            }
        });
        
        // 
        window.addStaff = function () {
            window.location.href = "/page/system/staff/add?staffId=0";
        }
    });

</script>
</body>
</html>