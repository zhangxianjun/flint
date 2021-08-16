<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>工作台</title>
    <link rel="stylesheet" href="/js/layui/layui.css">
    <script src="/js/layui/layui.js"></script>
</head>
<body class="layui-layout-body close-footer">
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

            <#--            <li class="layui-nav-item"><a href="">商品管理</a></li>-->
            <#--            <li class="layui-nav-item"><a href="">用户</a></li>-->
            <#--            <li class="layui-nav-item">-->
            <#--                <a href="javascript:;">其它系统</a>-->
            <#--                <dl class="layui-nav-child">-->
            <#--                    <dd><a href="">邮件管理</a></dd>-->
            <#--                    <dd><a href="">消息管理</a></dd>-->
            <#--                    <dd><a href="">授权管理</a></dd>-->
            <#--                </dl>-->
            <#--            </li>-->
        </ul>
        <#--        <ul class="layui-nav layui-layout-right">-->
        <#--            <li class="layui-nav-item">-->
        <#--                <a href="javascript:;">-->
        <#--                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">-->
        <#--                    贤心-->
        <#--                </a>-->
        <#--                <dl class="layui-nav-child">-->
        <#--                    <dd><a href="">基本资料</a></dd>-->
        <#--                    <dd><a href="">安全设置</a></dd>-->
        <#--                </dl>-->
        <#--            </li>-->
        <#--            <li class="layui-nav-item"><a href="">退出</a></li>-->
        <#--        </ul>-->
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <#list leftList as model>
                    <#if model_index == 0>
                        <li class="layui-nav-item layui-nav-itemed"><a href="javascript:void(0);"
                                                                       onclick="pushClick(${model.path})">${model.name}</a>
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
        <iframe id="content" src="${firstPage.path}" style="width: 100%; height: 100%">

        </iframe>
    </div>
</div>
<script>
    // iframe
    function pushClick(url) {
        $("#content", parent.document.body).attr("src", url);
    }
</script>
</body>
</html>