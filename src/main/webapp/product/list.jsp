<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.product.Product" %>
<%@ page import="com.jhta.afterpay.product.ProductDao" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.product.Category" %>
<%@ page import="com.jhta.afterpay.util.Pagination" %>

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

    Pagination pagination = null;
    List<Product> products = null;
    if (catNo == 10 || catNo == 20) {
      int totalRows = productDao.getTotalRows(catNo);
      pagination = new Pagination(pageNo, totalRows);
      products = productDao.getProducts(catNo, pagination.getBegin(), pagination.getEnd());
    } else {
      int totalRows = productDao.getTotalRowsByCatNo(catNo);
      pagination = new Pagination(pageNo, totalRows);
      products = productDao.getProductsByCatNo(catNo, pagination.getBegin(), pagination.getEnd());
    }
  %>
  <table class="table">
    <colgroup>
      <col width="*">
      <col width="10%">
      <col width="15%">
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
      </tr>
    </thead>
    <tbody>
    <%
      for (Product product : products ) {
    %>
      <tr>
        <td></td>
        <td><%=product.getCategory().getName()%></td>
        <td><a href="detail.jsp?pno=<%=product.getNo()%>"><%=product.getName()%></a></td>
        <td><%=Utils.toCurrency(product.getPrice())%></td>
        <td><%=product.getStatus()%></td>
      </tr>
    <%
      }
    %>
    </tbody>
  </table>
  <%
    if (pagination.getTotalRows() > 0) {
  %>
  <div>
    <ul class="pagination justify-content-center">
      <li class="page-item <%=pagination.isFirst() ? "disabled" : ""%>">
        <a href="list.jsp?cat_no=<%=catNo%>&page=<%=pagination.getPrev() %>" class="page-link">이전</a>
      </li>
      <%
        for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
      %>
      <li class="page-item <%=num == pageNo ? "active" : ""%>">
        <a href="list.jsp?cat_no=<%=catNo%>&page=<%=num %>" class="page-link"><%=num %></a>
      </li>
      <%
        }
      %>
      <li class="page-item <%=pagination.isLast() ? "disabled" : "" %>">
        <a href="list.jsp?cat_no=<%=catNo%>&page=<%=pagination.getNext() %>" class="page-link">다음</a>
      </li>
    </ul>
  </div>
  <%
    }
  %>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
