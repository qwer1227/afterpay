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
  <title>AFTER PAY</title>
</head>
<style>
  .list-group{
    border: 1px solid black;
    margin: 5px;
  }
</style>
<body>
<div class="container">
  <div class="row">
    <!-- 메뉴 -->
    <div class="col-2">
      <div class="list-group mt-3 mb-3">
        <a href="../user/orders.jsp" class="mb-1 p-2 list-group-item-action btn btn-outline">주문내역</a>
        <a href="../user/resolution.jsp" class="mb-1 p-2 list-group-item-action btn btn-outline">취소/반품/환불</a>
        <a href="../user/cart.jsp" class="mb-1 p-2 list-group-item-action btn btn-outline">장바구니</a>
        <a href="../user/wish-list.jsp" class="mb-1 p-2 list-group-item-action btn btn-outline">위시리스트</a>
      </div>
      <div class="list-group mt-3 mb-3">
        <a href="../user/point-history.jsp" class="mb-1 p-2 list-group-item-action btn btn-outline">적립금 내역</a>
        <a href="../user/review.jsp" class="mb-1 p-2 list-group-item-action btn btn-outline">리뷰 작성 내역</a>
        <a href="../user/qna.jsp" class="mb-1 p-2 list-group-item-action btn btn-outline">문의 내역</a>
        <a href="../user/info.jsp" class="mb-1 p-2 list-group-item-action btn btn-outline">회원정보 수정</a>
        <a href="../index.jsp" class="mb-1 p-2 list-group-item-action btn btn-outline">로그아웃</a>
      </div>
    </div>
  </div>
</div>
</body>
</html>
