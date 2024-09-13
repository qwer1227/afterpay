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
</head>
<body class="d-flex flex-column min-vh-100 ">
<%
  String menu = "홈";
%>
<%@ include file="common/nav.jsp" %>
<div class="main-container">
  <div>
    <img src="../img/main.png" alt=""/>
  </div>
  <div class="main-text" style="color: beige" >
    <h3 >2024 Fall-Winter Collection</h3>
    <h5>New Arrivals</h5>
    <h5>
      <a href="#">shop</a>
    </h5>
  </div>
</div>
<div>
  <div class="sub-container">
    <div class="row">
      <div class="col" style="justify-content: center">
        <img src="../img/main2.png" alt="" style="width: 250px; height:350px;"/>
        <a href="/product/men-list.jsp">남성 상의</a>
      </div>
      <div class="col" style="justify-content: center">
        <img src="../img/main3.png" alt="" style="width: 250px; height:350px;"/>
        <a href="/product/women-list.jsp">여성 상의</a>
      </div>
      <div class="col" style="justify-content: center">
        <img src="../img/main4.png" alt="" style="width: 250px; height:350px;"/>
        <p style="text-align: center">가방</p>
      </div>
      <div class="col" style="justify-content: center">
        <img src="../img/main5.png" alt="" style="width: 250px; height:350px;"/>
        <p style="text-align: center">슈즈</p>
      </div>
    </div>
  </div>
</div>
<%@ include file="common/footer.jsp" %>
</body>
</html>