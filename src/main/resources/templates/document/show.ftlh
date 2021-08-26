<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>${document.title!''}</title>
    <script src="/js/markdown-it/markdown-it.min.js"></script>
    <style>
        body { margin: 0;  background-color: #EFEFEF; }
        table { border-collapse: collapse; table-layout: fixed; }
        tr th, tr td { height: 40px; padding: 0 10px; border: 1px solid #EEEEEE; word-break: break-all; word-wrap:break-word;}

    </style>
</head>
<body>
<div style="margin: 0px 220px; padding: 20px 60px; background-color: white">
    <div id="container" style="width: 100%; height: 100%;"></div>
</div>
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