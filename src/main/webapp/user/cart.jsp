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
  #cart{
    margin-left: 35px;
  }
  #prd-detail{
    border: 1px solid black;
  }
  #move-cart{
    border: 1px solid black;
  }
  #move-order{
    border: 1px solid black;
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
      <h2 class="m-3"><strong>Shopping List</strong></h2>
      <!-- Nav tabs -->
      <ul class="nav mt-3 nav-tabs justify-content-center">
        <li class="nav-item">
          <!-- 값을 뭐로 받는지에 따라 active 하는 코드 구현 필요 -->
          <a class="nav-link active" data-bs-toggle="tab" href="#cart">장바구니</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-bs-toggle="tab" href="#wishlist">위시리스트</a>
        </li>
      </ul>

      <div class="hstack gap-3 mt-1">
        <div class="p-2">
          <input type="checkbox" style="zoom:1.8">
        </div>
        <div class="p-2 ms-auto">
          <button>선택삭제</button>
        </div>
      </div>

      <!-- Tab panes -->
      <div class="row">
        <table class="table table-borderless tab-pane container active" id="cart">
          <colgroup>
            <col width="1%">
            <col width="15%">
            <col width="*">
            <col width="15%">
          </colgroup>
          <tr>
            <th>
              <input class="form-check-input" type="checkbox" style="zoom:1.5" value="check-item">
            </th>
            <th>
              <img src="../img/main2.png" class="rounded mx-auto d-block" width="170">
            </th>
            <td>
              <p></p>
              <p style="font-size: 20px"><strong>상품명</strong></p>
              <p>사이즈</p>
              <p>수량</p>
              <p>가격</p>
            </td>
            <th>
              <td rowspan="1" class="align-middle text-end">
                <button class="btn" id="prd-detail">상세보기</button>
              </td>
            </th>
          </tr>
        </table>
        <hr style="margin-left:35px; width:890px; border:solid 1px gray;"/>
      </div>

      <div class="row">
        <table class="table table-borderless tab-pane container fade" id="wishlist">
          <colgroup>
            <col width="1%">
            <col width="15%">
            <col width="*">
            <col width="15%">
          </colgroup>
          <tr>
            <th>
              <input class="form-check-input" type="checkbox" style="zoom:1.5" value="check-item">
            </th>
            <th>
              <img src="../img/main3.png" class="rounded mx-auto d-block" width="170">
            </th>
            <td>
              <p></p>
              <p style="font-size: 20px"><strong>상품명</strong></p>
              <p>사이즈</p>
              <p>수량</p>
              <p>가격</p>
            </td>
            <th>
              <td rowspan="1" class="align-middle text-end">
                <button class="btn" id="move-cart">장바구니 이동</button>
                <p></p>
                <button class="btn" id="move-order">주문하기</button>
              </td>
            </th>
          </tr>
        </table>
      </div>
    </div>
  </div>
</div>
<%@include file="../common/footer.jsp"%>
</body>
</html>
