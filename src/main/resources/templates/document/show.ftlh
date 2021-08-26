<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>${document.title!''}</title>
<#--    <link rel="stylesheet" href="/js/layui/css/layui.css">-->
<#--    <script src="/js/layui/layui.js"></script>-->
    <script src="/js/markdown-it/markdown-it.min.js"></script>
</head>
<body style="padding: 15px; height: 100%">
<#--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">-->
<#--        <legend>${document.title!''}</legend>-->
<#--</fieldset>-->
<div id="container" style="width: 100%; height: 100%"></div>
</body>

<script>

    window.onload=function(){
        let md = window.markdownit({
            html:         false,
            xhtmlOut:     false,
            breaks:       false,
            langPrefix:   'language-',
            linkify:      false,
            typographer:  false,
            quotes: '“”‘’',
            highlight: function (/*str, lang*/) { return ''; }
        });
        document.getElementById("container").innerHTML = md.render(`${document.content}`);
    }
</script>

</html>