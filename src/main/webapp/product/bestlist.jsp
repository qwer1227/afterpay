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
</head>
<body class="d-flex flex-column min-vh-100 ">
<%
  String menu = "홈";
%>
<%@ include file="../common/nav.jsp" %>
<div class="container pt-3">
  <div class="row mb-3">
  <%
    int catNo = Utils.toInt(request.getParameter("cat_no"));
    ProductDao productDao = new ProductDao();

    List<Product> products = null;
    if (catNo == 10 || catNo == 20) {
      products = productDao.getBestProducts(catNo);
    }
  %>
    <%
      for (Product product : products ) {
    %>
    <div class="col-3 mb-3">
      <div class="card" style="height: 500px; min-height: 500px;">
        <div class="card-body">
          <div>
            <a href="hit.jsp?pno=<%=product.getNo()%>">
              <img src="../common/images/<%=product.getImage().getName()%>" class="img-thumbnail" alt="">
            </a>
          </div>
          <h5 class="card-title" style="height: 60px; min-height: 60px;"><a href="hit.jsp?pno=<%=product.getNo()%>" class="text-dark text-decoration-none"><%=product.getName()%></a></h5>
          <div class="d-flex justify-content-between mb-2 small">
            <span ><%=product.getCategory().getName()%></span>
            <span ><%=product.getStatus()%></span>
          </div>
          <div class="d-flex justify-content-between">
            <span class="badge text-bg-light"><i class="bi bi-eye"><%=Utils.toCurrency(product.getViewCount())%></i></span>
            <span  class="text-danger"><strong><%=Utils.toCurrency(product.getPrice())%></strong> 원</span>
          </div>
        </div>
      </div>

    </div>
    <%
      }
    %>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>


