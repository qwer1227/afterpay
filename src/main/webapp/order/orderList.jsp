<%@ page import="com.jhta.afterpay.order.OrderDao" %>
<%@ page import="com.jhta.afterpay.order.OrderDto" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-09-13
  Time: 오후 2:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href=common/css/style.css rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
    <link href="/common/css/style.css" rel="stylesheet">
  <style>
    #order {
     padding: 10px;
      margin: 50px;
    }
  </style>
</head>
<body>
<body>
<%@include file="../common/nav.jsp" %>
<%
  OrderDao orderDao = new OrderDao();
  List<OrderDto> orders = orderDao.getAllOrderByUserNo(1);

  for(OrderDto order : orders) {
%>
  <div id="order" class="container">
    <div class="rows">
    </div>
    <div class="rows">
      <div class="col-3 border">
        이미지
      </div>
      <div class="col-3 border">
          <%=order.getAddr()%>
      </div>
    </div>
  </div>

<%
  }
%>

<%@include file="../common/footer.jsp" %>
</body>
</html>
