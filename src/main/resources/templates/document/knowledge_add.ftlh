<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>工作台</title>
    <link rel="stylesheet" href="/js/layui/css/layui.css">
    <script src="/js/layui/layui.js"></script>
    <script src="/js/monaco/vs/loader.js"></script>
</head>
<body class="layui-layout-body" style="padding: 15px; height: 100%">
<div class="layui-btn-container">
    <button type="button" class="layui-btn layui-btn-danger" onclick="addDocument()">取消</button>
    <button type="button" class="layui-btn layui-btn-danger" onclick="addDocument()">保存</button>
</div>

<input hidden="hidden" type="text" name="resourceId" value="${documentId}">

<div id="container" style="width: 100%; height: 560px; border: 1px solid grey"></div>

</div>

<script>
    let editor;

    require.config({paths: {'vs': '/js/monaco/vs'}});
    require(['vs/editor/editor.main'], function () {
            editor = monaco.editor.create(document.getElementById('container'), {
            value: [].join('\n'),
            language: 'markdown'
        });
    });

    layui.use(['form', 'jquery'], function () {
        let $ = layui.$;

        window.addDocument = function () {
            $.ajax({
                url: '/api/document/knowledge/add',
                data: {"documentId":"${documentId}","content":editor.getValue()},
                type: "POST",
                dataType: "json",
                success: function (data) {
                    if (data.status == 0) {
                        layer.msg(data.message, {icon: 6, time: 1000}, function () {
                            window.location.href = "/page/system/navigation/add?resourceId=" + data.resourceId;
                        });
                    } else {
                        layer.msg(data.message);
                    }
                }
            });
        }
    });
</script>
</body>
</html>