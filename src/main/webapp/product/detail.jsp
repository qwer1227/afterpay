<%@ page import="com.jhta.afterpay.util.DaoHelper" %>
<%@ page import="com.jhta.afterpay.util.RowMapper" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="product.ProductDao" %>
<%@ page import="product.Product" %>
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
<%--
  요청 파라미터 정보
  catNo = 해당 상품 카테고리 번호
  productNo = 해당 상품 번호
--%>
<%
  String menu = "홈";
%>
<%@ include file="../common/nav.jsp" %>
<%
  // 1. 요청 파라미터 정보 가져오기
  // int catNo = Integer.parseInt(request.getParameter("catNo")); // 상품 카테고리 번호
  // int productNo = Integer.parseInt(request.getParameter("productNo")); // 상품 번호

  // 2. 상품의 정보 가져오기
  // 상품 번호로 상품(productNo=?)의 모든 정보 반환
  ProductDao productDao = new ProductDao();
  Product product = productDao.getProductByNo(1);

  // 상품의 재고 수량 가져오기
%>
<div class="sub-container">
  <div class="row">
    <div class="col" style="justify-content: center; padding-left: 100px;">
      <img src="../img/main2.png" alt="" style="width: 300px; height:400px;"/>
      <div>
        상품명:<%=product.getName() %>,
        상품가격:<%=product.getPrice() %>
        <button onclick="fn1();">위시리스트</button>
      </div>
      <div>
        상품수량:<input type="number" min="1" max="">
        상품사이즈:
        <input type="radio" name="size" value="S">S
        <input type="radio" name="size" value="M">M
        <input type="radio" name="size" value="L">L
      </div>
      <div>
        <button onclick="fn2();">쇼핑백에 담기</button>
        <button>지금 구매하기</button>
      </div>
      <div>
        제품 세부 정보: <%=product.getContent() %>
      </div>
      <button>리뷰 작성하기</button>
    </div>
  </div>
</div>
<script type="text/javascript">
  function fn1() {
    alert("위시리스트에 추가되었습니다!");
  }

  function fn2() {
    alert("쇼핑백에 담았습니다!");
  }
</script>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
