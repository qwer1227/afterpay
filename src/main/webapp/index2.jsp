<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>AFTER PAY</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/common/css/style.css">
    <style>
    .choicebtn {
        margin-top: 300px;
        text-align: center;
    }
    button {
        width: 25%;
    }
    </style>
</head>
<body class="d-flex flex-column min-vh-100 ">
<%
    String menu = "홈";
%>
<%@ include file="common/nav.jsp" %>
<div class="choicebtn">
    <button type="button" class="btn btn-outline-primary btn-lg" onclick="location.href='/product/list.jsp?cat_no=10'">남성</button>
    <button type="button" class="btn btn-outline-danger btn-lg" onclick="location.href='/product/list.jsp?cat_no=20'">여성</button>
</div>
<%@ include file="common/footer.jsp" %>
</body>
</html>
