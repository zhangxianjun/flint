<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>工作台</title>
    <link rel="stylesheet" href="/js/layui/css/layui.css">
    <script src="/js/layui/layui.js"></script>
</head>
<body class="layui-layout-body  close-footer" style="padding: 15px;">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">
    <legend>团队知识</legend>
</fieldset>

<div class="layui-btn-group">
    <button type="button" class="layui-btn" onclick="addDocument()">新增文档</button>
</div>

<table class="layui-hide" id="test"  lay-filter="test-filter"></table>

</div>

<script type="text/html" id="operation">
    <a class="layui-btn layui-btn-xs" lay-event="editEvent">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="deleteEvent">禁用</a>
</script>

<script>

    layui.use(['table', 'jquery'], function(){
        let $ = layui.$;
        let table = layui.table;
        table.render({
            elem: '#test'
            ,url:'/api/document/knowledge/list'
            ,cellMinWidth: 80
            ,cols: [[
                {field:'documentId', title: 'ID', width:80}
                ,{field:'title', title: '标题', width:80}
                ,{field:'staffName', title: '作者'}
                ,{field:'total', title: '阅读量'}
                ,{field:'createTime', title: '创建时间', align: 'center'}
                ,{field:'updateTime', title: '排序', align: 'center', width:80}
                ,{fixed: 'right', title:'操作', toolbar: '#operation', width:150, align: 'center'}
            ]]
        });

        //监听行工具事件
        table.on('tool(test-filter)', function(obj){
            var data = obj.data;
            window.console.log("====", data);
            if(obj.event === 'deleteEvent'){
                layer.confirm('禁用', function(index){
                    // obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'editEvent'){
                window.location.href = "/page/system/navigation/add?resourceId=" + data.resourceId;
            }
        });
        
        // 
        window.addDocument = function () {
            window.location.href = "/page/document/knowledge/add?documentId=0";
        }
    });

</script>
</body>
</html>