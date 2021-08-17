<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>工作台</title>
    <link rel="stylesheet" href="/js/layui/layui.css">
    <script src="/js/layui/layui.js"></script>
    <style>
        .layui-body {
            bottom: 0 !important;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">Flint</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left" id="top">
            <#list topList as model>
                <#if model.resourceId == topIndex>
                    <li class="layui-nav-item layui-nav-itemed" id="top_${model.resourceId}">
                        <a href="javascript:void(0);" onclick="getLeftMenu('${model.resourceId}')">${model.name}</a>
                    </li>
                <#else>
                    <li class="layui-nav-item" id="top_${model.resourceId}">
                        <a href="javascript:void(0);" onclick="getLeftMenu('${model.resourceId}')">${model.name}</a>
                    </li>
                </#if>
            </#list>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test" id="left">
                <#list leftList as model>
                    <#if model.resourceId == firstPageModel.resourceId>
                        <li class="layui-nav-item layui-nav-itemed">
                            <a href="javascript:void(0);" onclick="pushClick('${model.path}')">${model.name}</a>
                        </li>
                    <#else>
                        <li class="layui-nav-item">
                            <a href="javascript:void(0);" onclick="pushClick('${model.path}')">${model.name}</a>
                        </li>
                    </#if>
                </#list>
            </ul>
        </div>
    </div>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <iframe id="content" src="${(firstPageModel.path)!'http://www.baidu.com/'}" style="width: 100%; height: 100%"></iframe>
    </div>
</div>
<script>
    layui.use(['jquery'], function () {
        let $ = layui.$;

        // 切换页面
        window.pushClick = function (url) {
            $("#content", parent.document.body).attr("src", url);
        };

        // 生成右边菜单
        window.getLeftMenu = function(resourceId) {

            // 修改一级导航选中状态
            $("#top li").removeClass("layui-nav-itemed");
            $("#top_" + resourceId).addClass("layui-nav-itemed");

            // 清空右侧菜单
            $("left").empty();
            // 生成右边菜单
            let leftMap = ${leftMap?no_esc};
            console.log(leftMap);
            let list = leftMap[0];

            console.log("list" + list.length);

            for (let i = 0; i < list.length; i++) {
                var map = list[i];
                console.log(map)
            }

        }
    });

</script>
</body>
</html>