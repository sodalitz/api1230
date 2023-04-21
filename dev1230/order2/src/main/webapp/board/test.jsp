<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Banner</title>
<style>
    #banner {
        width: 500px;
        height: 200px;
        overflow: hidden;
    }
    #banner img {
        width: 500px;
        height: 200px;
    }
</style>
</head>
<body>
    <div id="banner">
        <img src="/order2/image/main1.jpg" alt="Banner 1">
        <img src="/order2/image/main2.jpg" alt="Banner 2">
        <img src="/order2/image/main3.jpg" alt="Banner 3">
    </div>
    <script>
        var banner = document.getElementById('banner');
        var index = 0;
        var interval = setInterval(function() {
            var images = banner.getElementsByTagName('img');
            images[index].style.display = 'none';
            index++;
            if (index >= images.length) {
                index = 0;
            }
            images[index].style.display = 'block';
        }, 3000);
    </script>
</body>
</html>
