<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>AFTER PAY</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/common/css/style.css">
    <style>
        #thumbnail-image-box img {
            margin-top: 200px;
            width: 300px;
            height: 450px;
            opacity: 0.5;
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100 ">
<%
    String menu = "홈";
%>
<%@ include file="../common/nav.jsp" %>
<div id="thumbnail-image-box" class="row">
    <div class="col" style="text-align: center; padding-left: 500px;">
        <a href="/product/bestlist.jsp?cat_no=10" class="text-dark text-decoration-none">
            <img src="/img/main6.png" onmouseenter="fn1(event)" onmouseleave="fn2(event)">
            <p>남성 베스트</p>
        </a>
    </div>
    <div class="col" style="text-align: center; padding-right: 500px">
        <a href="/product/bestlist.jsp?cat_no=20" class="text-dark text-decoration-none">
            <img src="/img/main4.png" onmouseenter="fn1(event)" onmouseleave="fn2(event)">
            <p>여성 베스트</p>
        </a>
    </div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
<script>
    function fn1(event) {
        let thumbImg = event.target;
        thumbImg.style.opacity = "1.0";
    }

    function fn2(event) {
        let thumbImg = event.target;
        thumbImg.style.opacity = "0.5";
    }
</script>
</html>
