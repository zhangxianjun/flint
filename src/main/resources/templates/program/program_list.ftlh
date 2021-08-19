<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>工作台</title>
    <link rel="stylesheet" href="/js/layui/layui.css">
    <script src="/js/layui/layui.js"></script>
</head>
<body class="layui-layout-body" style="padding: 15px;">
<div style="padding-bottom: 15px">项目列表</div>

<div class="site-demo-button" style="margin-bottom: 15px;">
    <button class="layui-btn site-demo-active" data-type="tabAdd">新增项目</button>
    <button class="layui-btn site-demo-active" data-type="tabDelete"></button>
    <button class="layui-btn site-demo-active" data-type="tabChange"></button>
</div>

<table class="layui-hide" id="test"></table>

</div>

<script type="text/html" id="operation">
    <a class="layui-btn layui-btn-xs" lay-event="editEvent">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="deleteEvent">删除</a>
</script>

<script>
    layui.use('table', function(){
        var table = layui.table;
        table.render({
            elem: '#test'
            ,url:'/api/program/list'
            ,cellMinWidth: 80
            ,cols: [[
                {field:'programId', title: '项目ID'}
                ,{field:'name', title: '项目名字'} //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
                ,{field:'isForbid', title: '进行状态', align: 'center'}
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
    });
    // layui.use('element', function(){
    //     let $ = layui.jquery
    //     let element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
    //
    //     //触发事件
    //     let active = {
    //         tabAdd: function(){
    //             window.console.log("======");
    //         }
    //     };
    //
    //
    //
    // });

</script>
</body>
</html>