<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>工作台</title>
    <link rel="stylesheet" href="/js/layui/css/layui.css">
    <script src="/js/layui/layui.js"></script>
    <script src="/js/monaco/vs/loader.js"></script>
    <style>
    </style>
</head>
<body class="layui-layout-body" style="padding: 15px; height: 100%">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">
    <#if documentId == 0>
        <legend>新建文档</legend>
    <#else>
        <legend>编辑 - ${document.title!''}"</legend>
    </#if>

</fieldset>

<input hidden="hidden" type="text" name="documentId" value="${documentId}">

<div id="container" style="width: 100%; height: 520px; border: 1px solid #cecece"></div>

<div class="layui-btn-container" style="padding-top: 10px; text-align: right">
    <button type="button" class="layui-btn layui-btn-danger" onclick="addDocument()">取消</button>
    <button type="button" class="layui-btn layui-btn-danger" style="margin-right: 0px;" onclick="addDocument()">保存
    </button>
</div>
</div>

<div id="alert">
    <div style="margin: 20px; width: 380px">
        <div class="layui-form-item">
            <input type="text" name="title" value="${document.title!''}" placeholder="请输入标题" class="layui-input">
        </div>
        <div class="layui-form-item">
            <input type="text" name="category" value="${document.category!''}" placeholder="请输入标签" class="layui-input">
        </div>
        <div class="layui-btn-container" style="margin-top:20px;text-align: center">
            <button type="button" class="layui-btn" onclick="saveDocument()">保存</button>
        </div>
    </div>
</div>

<script>
    let editor;

    require.config({paths: {'vs': '/js/monaco/vs'}});
    require(['vs/editor/editor.main'], function () {
        editor = monaco.editor.create(document.getElementById('container'), {
            value: [`${document.content!""}`].join("\n"),
            language: 'markdown'
        });
    });

    layui.use(['form', 'jquery'], function () {
        let $ = layui.$;
        window.addDocument = function () {
            // 弹窗
            layer.open({
                type: 1,
                area: ['420px', '240px'], //宽高
                content: $("#alert")
            });
        }

        window.saveDocument = function () {
            let title = $('input[name="title"]').val();
            let category = $('input[name="category"]').val();
            $.ajax({
                url: '/api/document/knowledge/add',
                data: {"documentId":"${documentId}","content":editor.getValue(), "title":title, "category":category},
                type: "POST",
                dataType: "json",
                success: function (data) {
                    if (data.status == 0) {
                        layer.msg(data.message, {icon: 6, time: 1000}, function () {
                            window.location.href = "/page/document/knowledge/list";
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