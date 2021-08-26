<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>${document.title!''}</title>
    <link rel="stylesheet" href="/js/layui/css/layui.css">
    <script src="/js/layui/layui.js"></script>
    <script src="/js/showdown/showdown.min.js"></script>
    <style>
    </style>
</head>
<body class="layui-layout-body" style="padding: 15px; height: 100%">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">
        <legend>${document.title!''}</legend>
</fieldset>
<div id="container" style="width: 100%; height: 100%"></div>
</body>

<script>

    layui.use(['jquery'], function(){
        //创建实例
        var converter = new showdown.Converter();
        //进行转换
        var html = converter.makeHtml(`${document.content}`);

        document.getElementById("container").innerHTML = html;
    });
</script>

</html>