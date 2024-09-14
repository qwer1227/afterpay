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
  <title>AFTER PAY</title>
</head>
<style>
  h2{
    text-align: center;
  }
</style>
<body>
<%@include file="../common/nav.jsp"%>
<div class="container">
  <div class="row">
    <!-- 메뉴 nav 사용 -->
    <div class="col-2">
      <%@include file="../common/user-nav.jsp"%>
    </div>
      <!-- 컨텐츠 -->
      <div class="col-10">
        <h2 class="mt-3"><strong>Shopping List</strong></h2>

        <div class="btn-group" role="group" aria-label="Basic outlined example">
        <ul class="nav nav-tabs">
          <li class="nav-item">
            <a class="nav-link active" data-bs-toggle="tab" href="#cart">장바구니</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" href="#wishlist">위시리스트</a>
          </li>
        </ul>
        </div>

        <!-- Tab panes -->
        <div class="tab-content">
          <div class="tab-pane container active" id="cart">장바구니</div>
          <div class="tab-pane container fade" id="wishlist">위시리스트</div>

        </div>
      </div>
    </div>
  </div>
</div>
<%@include file="../common/footer.jsp"%>
</body>
</html>
