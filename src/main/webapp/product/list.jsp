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
    /*
      요청 Url
        http://localhost/product/list.jsp?cat=11

     */
//    int catNo = Utils.toInt(request.getParameter("cat_no"));
//    int pageNo = Utils.toInt(request.getParameter("page"),1);
//
//    ProductDao productDao = new ProductDao();
//    int totalRows = 0;
//    Pagination pagination = null;
//    List<Product> products = null;
//    if (catNo == 30) {
//      totalRows = productDao.getAllTotalRows();
//      pagination = new Pagination(pageNo, totalRows);
//      products = productDao.getAllProducts(pagination.getBegin(), pagination.getEnd());
//      /*
//      select *
//      from products;
//       */
//    } else if (catNo == 10 || catNo == 20) {
//      totalRows = productDao.getAllTotalRowsByParentCatNo(catNo);
//      pagination = new Pagination(pageNo, totalRows);
//      products = productDao.getAllProductsByParentCatNo(catNo, pagination.getBegin(), pagination.getEnd());
//      /*
//      select *
//      from products
//      where parent_cat_no = ?
//       */
//    } else {
//      totalRows = productDao.getAllTotalRowsByCatNo(catNo);
//      pagination = new Pagination(pageNo, totalRows);
//      products = productDao.getAllProductsByCatNo(catNo, pagination.getBegin(), pagination.getEnd());
//       /*
//      select *
//      from products
//      where cat_no = ?
//       */
//    }
    int catNo = Utils.toInt(request.getParameter("cat_no"));
    int pageNo = Utils.toInt(request.getParameter("page"),1);

    ProductDao productDao = new ProductDao();

    List<Product> products = productDao.getAllProducts(catNo);
  %>
  <table class="table">
    <colgroup>
      <col width="10%">
      <col width="*%">
      <col width="15%">
      <col width="10%">
    </colgroup>
    <thead>
      <tr>
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
        <%
          if (product.getCategory().getNo() == 10) {

        %>
        <td>남성전체</td>
        <%
        } else if (product.getCategory().getNo() == 20) {

        %>
        <td>여성전체</td>
        <%
          } else if (product.getCategory().getNo() == 11) {

        %>
        <td>남성상의</td>
        <%
          } else if (product.getCategory().getNo() == 21) {

        %>
        <td>여성상의</td>
        <%
          } else if (product.getCategory().getNo() == 12) {

        %>
        <td>남성하의</td>
        <%
          } else if (product.getCategory().getNo() == 22) {

        %>
        <td>여성하의</td>
        <%
          } else if (product.getCategory().getNo() == 13) {

        %>
        <td>남성슈즈</td>
        <%
          } else if (product.getCategory().getNo() == 23) {

        %>
        <td>여성슈즈</td>
        <%
        } else if (product.getCategory().getNo() == 14) {

        %>
        <td>남성가방</td>
        <%
        } else if (product.getCategory().getNo() == 24) {

        %>
        <td>여성가방</td>
        <%
          }
        %>
        <td><a href="detail.jsp"><%=product.getName()%></a></td>
        <td><%=Utils.toCurrency(product.getPrice())%></td>
        <td><%=product.getStatus()%></td>
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
