<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>工作台</title>
    <link rel="stylesheet" href="/js/layui/css/layui.css">
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
                        <li class="layui-nav-item layui-nav-itemed" id="left_${model.resourceId}">
                            <a href="javascript:void(0);" onclick="pushClick('${model.resourceId}','${model.path}')">${model.name}</a>
                        </li>
                    <#else>
                        <li class="layui-nav-item" id="left_${model.resourceId}">
                            <a href="javascript:void(0);" onclick="pushClick('${model.resourceId}','${model.path}')">${model.name}</a>
                        </li>
                    </#if>
                </#list>
            </ul>
        </div>
    </div>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <iframe src="${(firstPageModel.path)!'http://www.baidu.com/'}" frameborder="0" id="content" style="width: 100%; height: 100%; border-radius: 2px;"></iframe>
    </div>
</div>
<script>
    layui.use(['jquery'], function () {
        let $ = layui.$;

        // 切换页面
        window.pushClick = function (resourceId, url) {
            // 修改二级导航选中状态
            $("#left li").removeClass("layui-nav-itemed");
            $("#left_" + resourceId).addClass("layui-nav-itemed");
            $("#content", parent.document.body).attr("src", url);
        };

        // 生成右边菜单
        window.getLeftMenu = function(resourceId) {
            // 修改一级导航选中状态
            $("#top li").removeClass("layui-nav-itemed");
            $("#top_" + resourceId).addClass("layui-nav-itemed");
            // 清空右侧菜单
            $("#left").empty();
            // 生成右边菜单
            let leftMap = ${leftMap?no_esc};
            let list = leftMap[resourceId];
            let url = "";
            let innerHtml = "";
            for (let i = 0; i < list.length; i++) {
                let map = list[i];
                if (i == 0) {
                    url = map.path;
                    innerHtml = innerHtml + "<li class=\"layui-nav-item layui-nav-itemed\"";
                } else {
                    innerHtml = innerHtml + "<li class=\"layui-nav-item\"";
                }
                let tmp = `id="left_id">
                            <a href="javascript:void(0);" onclick="pushClick('rResourceId','rPath')">rName</a>
                        </li>`;
                // 进行替换替换字符比拼接容易处理
                innerHtml = innerHtml + tmp.replace("left_id", "left_" + map.resourceId)
                    .replace("rResourceId", map.resourceId)
                    .replace("rPath", map.path)
                    .replace("rName", map.name);
            }
            $("#left").append(innerHtml);
            // 默认打开页面
            $("#content", parent.document.body).attr("src", url);
        }
    });
</script>
</body>
</html>