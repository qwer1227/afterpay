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
        .main-container {
            width: 100%;
            margin: 10px auto;
            position: relative;
        }

        .main-container img {
            width: 100%;
            height: 20%;
            vertical-align: middle;
        }

        .main-text {
            position: absolute;
            top: 90%;
            left: 50%;
            width: 100%;
            transform: translate(-50%, -50%);
            text-align: center;
            color: beige;
        }

        .sub-container {
            height: 450px;
        }

        .sub-container a {
            text-align: center;
        }

        .col {
            text-align: center;
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100 ">
<%@ include file="/common/nav.jsp" %>
<%
    String test = "844373802C0CF79BBF65C7EEABB3DBAFB739F15F566EBBB4BDDAB65275BA66A8";
    System.out.println(test.toLowerCase());
%>
<div class="main-container" style="min-width:1140px;">
    <div>
        <img src="/img/main.png" alt=""/>
    </div>
    <div class="main-text">
        <h5 style="font-size: 20px">2024 가을-겨울 컬렉션</h5>
        <h5>새로운 도착</h5>
        <h5>
            <a href="/index2.jsp" class="text-dark text-decoration-none" style="font-weight: bolder">구매하기</a>
        </h5>
    </div>
</div>
    <div class="sub-container" style="min-width:1140px; margin-right: 150px; margin-left: 150px">
        <div class="row">
            <div class="col">
                <a href="/product/list.jsp?cat_no=11&page=1" class="text-dark text-decoration-none">
                    <img src="/img/main2.png" alt="" style="width: 250px; height:350px;"/><br>
                    <p>남성 상의</p>
                </a>
            </div>
            <div class="col">
                <a href="/product/list.jsp?cat_no=21&page=1" class="text-dark text-decoration-none">
                    <img src="/img/main3.png" alt="" style="width: 250px; height:350px;"/><br>
                    <p>여성 상의</p>
                </a>
            </div>
            <div class="col">
                <a href="/product/list.jsp?cat_no=24&page=1" class="text-dark text-decoration-none">
                    <img src="/img/main4.png" alt="" style="width: 250px; height:350px;"/><br>
                    <p>여성 가방</p>
                </a>
            </div>
            <div class="col">
                <a href="/product/list.jsp?cat_no=13&page=1" class="text-dark text-decoration-none">
                    <img src="/img/main8.png" alt="" style="width: 250px; height:350px;"/><br>
                    <p>남성 슈즈</p>
                </a>
            </div>
        </div>
    </div>
</div>
<%@ include file="/common/footer.jsp" %>
</body>
</html>