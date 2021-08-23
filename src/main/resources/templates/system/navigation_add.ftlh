<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>工作台</title>
    <link rel="stylesheet" href="/js/layui/css/layui.css">
    <script src="/js/layui/layui.js"></script>
</head>
<body class="layui-layout-body" style="padding: 15px; height: 100%">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">
    <#if 0 < resourceId >
        <legend>编辑导航</legend>
    <#else>
        <legend>新建导航</legend>
    </#if>
</fieldset>

<form class="layui-form" action="/api/system/navigation/add">
    <div class="layui-form-item">
        <label class="layui-form-label">父级</label>
        <div class="layui-input-block">
            <select name="rootId" lay-verify="">
                <#list rootList as m>
                    <#if m.resourceId == resourceId >
                        <option value="${m.resourceId}" selected="selected">${m.name}</option>
                    <#else>
                        <option value="${m.resourceId}">${m.name}</option>
                    </#if>
                </#list>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-block">
            <input type="text" name="title" lay-verify="title" value="${resource.name!}" autocomplete="off"
                   placeholder="请输入标题"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">路径</label>
        <div class="layui-input-block">
            <input type="text" name="path" lay-verify="path" value="${resource.path!}" autocomplete="off"
                   placeholder="请输入路径" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">排序</label>
        <div class="layui-input-block">
            <input type="text" name="showOrder" lay-verify="showOrder" value="${resource.showOrder?c}"
                   autocomplete="off" placeholder="请输入排序值"
                   class="layui-input">
        </div>
    </div>

    <#--    <div class="layui-form-item">-->
    <#--        <label class="layui-form-label">是否启用</label>-->
    <#--        <div class="layui-input-block">-->
    <#--            <input type="checkbox" checked="" name="open" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">-->
    <#--        </div>-->
    <#--    </div>-->
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="formDemo">保存</button>
        </div>
    </div>
</form>

</div>


<script>
    layui.use(['form', 'jquery'], function () {
        let $ = layui.$;
        let form = layui.form;
        //监听提交
        form.on('submit(formDemo)', function (data) {
            $.ajax({
                url: '/api/system/navigation/add',
                data: data,
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
        });
    });
</script>
</body>
</html>