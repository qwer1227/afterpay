<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.util.Pagination" %>
<%@ page import="com.jhta.afterpay.product.*" %>
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
  <link rel="stylesheet" href="../common/css/style.css">
  <style>
    a {
      text-decoration-line: none;
    }
    img {
      width: 100px;
      height: 100px;
    }
  </style>
</head>
<body class="d-flex flex-column min-vh-100 ">
<%
  String menu = "홈";
%>
<%@ include file="../common/nav.jsp" %>
<div class="container">
  <%
    int catNo = Utils.toInt(request.getParameter("cat_no"));
    int pageNo = Utils.toInt(request.getParameter("page"),1);
    ProductDao productDao = new ProductDao();

    List<Product> products = null;
    if (catNo == 10 || catNo == 20) {
      int totalRows = productDao.getTotalRows(catNo);

      products = productDao.getBestProducts(catNo);
    }
  %>
  <table class="table">
    <colgroup>
      <col width="*">
      <col width="10%">
      <col width="20%">
      <col width="10%">
      <col width="10%">
      <col width="10%">
    </colgroup>
    <thead>
    <tr>
      <th>이미지</th>
      <th>카테고리</th>
      <th>상품명</th>
      <th>가격</th>
      <th>상태</th>
      <th>조회수</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <%
        for (Product product : products ) {
      %>
      <td>
        <a href="hit.jsp?pno=<%=product.getNo()%>">
          <img src="../common/images/<%=product.getImage().getName()%>" alt="">
        </a>
      </td>
      <td><%=product.getCategory().getName()%></td>
      <td><a href="hit.jsp?pno=<%=product.getNo()%>"><%=product.getName()%></a></td>
      <td><%=Utils.toCurrency(product.getPrice())%></td>
      <td><%=product.getStatus()%></td>
      <td><%=Utils.toCurrency(product.getViewCount())%></td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>


