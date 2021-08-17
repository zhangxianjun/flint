<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>工作台</title>
    <link rel="stylesheet" href="/js/layui/layui.css">
    <script src="/js/layui/layui.js"></script>
    <style>
        .layui-body{bottom: 0 !important;}
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">Flint</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <#list topList as model>
                <#if model_index == 0>
                    <li class="layui-nav-item layui-nav-itemed"><a href="${model.path}">${model.name}</a></li>
                <#else>
                    <li class="layui-nav-item"><a href="${model.path}">${model.name}</a></li>
                </#if>
            </#list>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <#list leftList as model>
                    <#if model_index == 0>
                        <li class="layui-nav-item layui-nav-itemed"><a href="javascript:void(0);"
                                                                       onclick="pushClick('${model.path}')">${model.name}</a>
                        </li>
                    <#else>
                        <li class="layui-nav-item"><a href="${model.path}">${model.name}</a></li>
                    </#if>
                </#list>
            </ul>
        </div>
    </div>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <iframe id="content" src="${firstPage.path}" style="width: 100%; height: 100%"></iframe>
    </div>
</div>
<script>
    layui.use(['jquery'],function(){
            var $ = layui.$
        var form = layui.form
            , $ = layui.jquery
            , layer = layui.layer;
        window.pushClick =  function (url) {
            console.log("=============");
            $("#content", parent.document.body).attr("src", url);
        }
    });

</script>
</body>
</html>