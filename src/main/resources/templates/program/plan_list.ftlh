<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>工作台</title>
    <link rel="stylesheet" href="/js/layui/css/layui.css">
    <link rel="stylesheet" href="/js/handsontable/handsontable.full.css">
    <script src="/js/layui/layui.js"></script>
    <script src="/js/handsontable/handsontable.full.js"></script>
</head>
<body class="layui-layout-body" style="padding: 15px;">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">
    <legend>项目列表</legend>
</fieldset>

<div class="layui-btn-group">
    <button type="button" class="layui-btn" onclick="addProgram()">新增项目</button>
</div>
<div id="excel"></div>

</div>
<script>
    layui.use(['jquery'], function(){
        let $ = layui.$;

        const data = [
            ['', 'Tesla', 'Volvo', 'Toyota', 'Ford'],
            ['2019', 10, 11, 12, 13],
            ['2020', 20, 11, 14, 13],
            ['2021', 30, 15, 12, 13]
        ];

        const container = window.document.getElementById('excel');
        const hot = new Handsontable(container, {
            data: data,
            rowHeaders: true,
            colHeaders: true,
            licenseKey: 'non-commercial-and-evaluation'
        });

        window.addProgram = function () {
            window.location.href = "/page/program/add?programId=0";
        }
    });

</script>
</body>
</html>