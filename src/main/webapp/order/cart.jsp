<%@ page import="com.jhta.afterpay.order.CartDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.order.Cart" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
  <link href="/common/css/style.css" rel="stylesheet" >
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <title>AFTER PAY_Shopping List</title>
</head>
<style>
  h2 {
    text-align: center;
  }
  #cart-info{
    height: 120px;
  }
</style>
<body>
<%
  CartDao cartDao = new CartDao();
  List<Cart> carts = cartDao.getAllCartsByUserNo(7);
%>
<%@include file="../common/nav.jsp"%>
<div class="container">
  <div class="row">
    <!-- 메뉴 nav 사용 -->
    <div class="col-2">
      <%@include file="../common/user-nav.jsp"%>
    </div>

    <form action="order.jsp" method="post">
    <!-- 컨텐츠 -->
    <div class="col-10">
      <h2 class="m-4"><strong>장바구니</strong></h2>
      <div class="tab-content" id="nav-tabContent">
        <div class="hstack gap-3">
          <div class="p-2">
            <input type="checkbox" style="zoom:1.8">
          </div>
          <div class="p-3 ms-auto">
            <button class="btn btn-lg">
              <i class="bi bi-trash"></i>
            </button>
          </div>
        </div>

        <div class="tab-pane fade show active " id="nav-cart" role="tabpanel" aria-labelledby="nav-home-tab">
          <div class="table-responsive">
            <table class="table align-middle mt-2 md-2">
              <colgroup>
                <col width="1%">
                <col width="15%">
                <col width="*">
                <col width="15%">
              </colgroup>
<%--              주문내역 상품 보여주기--%>
              <%
                for (Cart cart: carts) {
                  // Stock, Product Dao 필요
              %>
              <tr>
                <td>
                  <input class="form-check-input" type="checkbox" style="zoom:1.5" value="check-item">
                </td>
                <td>
                  <img src="../img/main2.png" class="rounded mx-auto d-block" width="170">
                </td>
                <td class="align-top">
                  <p></p>
                  <p style="font-size: 20px"><strong>상품명></strong></p>
                  <p>
                    <input type="hidden" name="size" value="<%=cart.getStock().getNo() %>">
                    <%=cart.getStock() %>
                  </p>
                  <p>
                    <input type="hidden" name="amount" value=<%=cart.getAmount()%>"">
                    <%=cart.getAmount()%>>
                  </p>
                  <p>
                    <input type="hidden" name="price" value="">
<%--                    <%=cart.getStock().getProduct cart.getAmount() %>--%>
                  </p>
                </td>
                <td class="align-middle text-end">
                  <button class="btn btn-outline-primary">상세보기</button>
                </td>
              </tr>
              <%
                }
              %>
            </table>
          </div>
        </div>

        <!-- Item Total Info -->
        <div class="text-center mt-4 mb-5">
          <div class="row fs-5" id="cart-info">
            <!-- cart -->
            <table border="1">
              <tr class="fs-5">
                <td>총 선택 갯수</td>
                <td>배송비</td>
                <td>총 결제 금액</td>
                <td rowspan="2"><a href="" type="submit"><button class="btn btn-outline-success btn-lg">지금 주문하기</button></a></td>
              </tr>
              <tr>
                <td><strong>1 개</strong></td>
                <td><strong>3000 원</strong></td>
                <td><strong>20000 원</strong></td>
                <td></td>
              </tr>
            </table>
          </div>
        </div>
      </div>
    </div>
    </form>
  </div>
</div>
<%@include file="../common/footer.jsp"%>
</body>
</html>