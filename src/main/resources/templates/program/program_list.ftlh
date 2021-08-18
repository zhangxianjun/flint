<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>工作台</title>
    <link rel="stylesheet" href="/js/layui/layui.css">
    <script src="/js/layui/layui.js"></script>
</head>
<body class="layui-layout-body">
<table class="layui-hide" id="test"></table>
</div>
<script>
    layui.use('table', function(){
        var table = layui.table;
        table.render({
            elem: '#test'
            ,url:'/api/program/list'
            ,cellMinWidth: 80
            ,cols: [
                {field:'data.program_id', title: '项目ID'}
                ,{field:'name', title: '用户名'}
                ,{field:'sex', title: '性别'}
                ,{field:'city', title: '城市'}
                ,{field:'sign', title: '签名'}
                ,{field:'classify', title: '职业', align: 'center'} //单元格内容水平居中
                ,{field:'experience', title: '积分', align: 'right'} //单元格内容水平居右
                ,{field:'score', title: '评分', align: 'right'}
                ,{field:'wealth', title: '财富', align: 'right'}
            ]
        });
    });
</script>
</body>
</html>