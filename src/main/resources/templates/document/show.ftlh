<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>${document.title!''}</title>
    <script src="/js/markdown-it/markdown-it.min.js"></script>
    <script src="/js/markdown-it/md-it-enter.js"></script>
    <style>
        body { margin: 0;  background-color: #EFEFEF; }
        table { border-collapse: collapse; table-layout: fixed; width: 100%}
        tr th, tr td { height: 40px; padding: 0 10px; border: 1px solid #EEEEEE;}

    </style>
</head>
<body>
<div style="margin: 0px 220px; padding: 20px 60px; background-color: white">
    <div id="container" style="width: 100%; height: 100%;"></div>
</div>
</body>

<script>
    window.onload=function(){
        document.getElementById("container").innerHTML = window.demo(HTMLDecode(`${document.content}`));
    }

    function HTMLEncode(html) {
        var temp = document.createElement("div");
        (temp.textContent != null) ? (temp.textContent = html) : (temp.innerText = html);
        var output = temp.innerHTML;
        temp = null;
        return output;
    }

    function HTMLDecode(text) {
        var temp = document.createElement("div");
        temp.innerHTML = text;
        var output = temp.innerText || temp.textContent;
        temp = null;
        return output;
    }
</script>

</html>