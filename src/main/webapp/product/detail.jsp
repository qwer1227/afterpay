<%@ page import="com.jhta.afterpay.util.DaoHelper" %>
<%@ page import="com.jhta.afterpay.util.RowMapper" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="product.ProductDao" %>
<%@ page import="product.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="product.Stock" %>
<%@ page import="product.Review" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="ko">
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

  // 상품 번호로 상품(productNo=?)의 재고 상황 반환
  List<Stock> stocks = productDao.getAllStocksByNo(1);

  // 상품 번호로 상품(productNo=?)의 모든 리뷰 반환
  List<Review> reviews = productDao.getAllReviewsByNo(1);
%>
<div class="container">
  <div class="row mb-3">
    <div class="col-4">
      <img src="../img/main2.png" alt="" class="img-thumbnail"/>
    </div>
    <div class="col-8">
      <div class="row mb-5">
        <div class="col-12">
          <h4>상품 상세 정보</h4>
          <table class="table">
            <colgroup >
              <col width="15%" />
              <col width="35%" />
              <col width="15%" />
              <col width="35%" />
            </colgroup>
            <tr>
              <th>상품이름</th><td><%=product.getName() %></td>
              <th>상품가격</th><td><%=product.getPrice() %></td>
            </tr>
          </table>
          <div class="text-end">
            <a href="../wish/wish.jsp" class="btn btn-outline-primary">위시 리스트 추가</a>
          </div>
        </div>
      </div>
      <div class="row mb-3">
        <div class="col-12 text-end">
          <form class="row row-cols-lg-auto g-3 align-items-center" method="get" action="order.jsp">
            <div class="col-12">
              <div >
                <%
                  for (Stock stock : stocks) {
                %>
                  <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="stockNo" value="<%=stock.getNo()%>">
                    <label class="form-check-label" ><%=stock.getSize()%></label>
                  </div>
                <%
                  }
                %>
              </div>
            </div>
            <%
              for (Stock stock : stocks) {
            %>
              <div class="col-12">
                <input type="number" class="form-control" name="amount" value="1" min="1" max="<%=stock.getAmount() %>">
              </div>
            <%
              }
            %>
            <div class="col-12  text-end">
              <div>
                <button type="button" class="btn btn-outline-primary">장바구니 담기</button>
                <button type="button" class="btn btn-outline-primary">구매하기</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <div class="row mb-3">
    <div class="col-12">
      <a href="review.jsp" class="btn btn-primary">리뷰 작성하기</a>
    </div>
  </div>

  <div class="col-12">
    <h4>리뷰 목록</h4>
    <table class="table">
      <colgroup >
        <col width="15%" />
        <col width="35%" />
        <col width="15%" />
        <col width="35%" />
      </colgroup>
      <%
        for (Review review : reviews) {
      %>
        <tr>
          <th>리뷰 제목</th><td><%=review.getTitle() %></td>
        </tr>
        <tr>
          <th>리뷰내용</th><td><%=review.getContent() %></td>
        </tr>
        <tr>
          <th>작성자이름</th><td><%=review.getUser().getName() %></td>
          <th>평점</th><td><%=review.getRating() %></td>
          <th>작성일</th><td><%=review.getCreatedDate() %></td>
        </tr>
      <%
        }
      %>
    </table>
  </div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
