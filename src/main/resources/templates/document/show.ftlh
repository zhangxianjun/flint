<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>${document.title!''}</title>
    <script src="/js/markdown-it/markdown-it.min.js"></script>
    <style>
        body {
            margin: 0;
            background-color: #EFEFEF;
        }
    </style>
</head>
<body>
<div style="margin: 0px 200px; padding: 20px 40px; background-color: white">
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