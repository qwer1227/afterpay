<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <title>주문 내역</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
  <link rel="stylesheet" href="/common/css/style.css">
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<div class="container ">
  <h3 class="mb-5 pt-3">주문상세조회</h3>
  <%-- 주문 정보 --%>
  <h4>주문정보</h4>
  <div class="row border justify-content-md-center mb-5">
    <div class="col-3 border-top border-5 bg-secondary bg-opacity-10 p-3 ps-4">
      주문번호
    </div>
    <div class="col-9 border-top border-5 p-3">
      23123123023
    </div>
    <div class="col-3 border-top bg-secondary bg-opacity-10 p-3 ps-4">
      주문일자
    </div>
    <div class="col-9 border-top p-3">
      23123123023
    </div>
    <div class="col-3 border-top bg-secondary bg-opacity-10 p-3 ps-4">
      주문자
    </div>
    <div class="col-9 border-top p-3">
      23123123023
    </div>
    <div class="col-3 border-top bg-secondary bg-opacity-10 p-3 ps-4">
      주문처리상태
    </div>
    <div class="col-9 border-top p-3">
      23123123023
    </div>
  </div>
  <h4>결제정보</h4>
  <div class="row border justify-content-md-center mb-5">
    <div class="col-3 border-top border-5 bg-secondary bg-opacity-10 p-3 ps-4">
      총 주문금액
    </div>
    <div class="col-9 border-top border-5 p-3">
      23123123023
    </div>
    <div class="col-3 border-top bg-secondary bg-opacity-10 p-3 ps-4">
      총 결제금액
    </div>
    <div class="col-9 border-top p-3">
      23123123023
    </div>
  </div>

  <%-- 주문 상품 --%>
  <div class="row border mb-5 p-3">
    <h3 class="mb-3">주문상품</h3>
    <hr>
    <div class="col-2">
      <img src="sample.jpg" class="rounded float-start" style="width: 170px; height:130px;">
    </div>
    <div class="col-7">
      <ul class="list-unstyled">
        <li>
          <span>564546556</span>
        </li>
        <li>
          옵션
        </li>
        <li>
          수량:
        </li>
        <li>
          상품구매금액:
        </li>
      </ul>
      <%--                    <p><%=products.get(0).getName() %>></p>--%>
      <%--                <p>[옵션: <%= products.get(0).getStock().getSize()%>]</p>--%>
    </div>
  </div>

  <h4>최종 결제 정보</h4>
  <div class="row border justify-content-md-center mb-5">
    <div class="col-3 border-top border-5 bg-secondary bg-opacity-10 p-3 ps-4">
      총 결제금액
    </div>
    <div class="col-9 border-top border-5 p-3">
      23123123023
    </div>
    <div class="col-3 border-top bg-secondary bg-opacity-10 p-3 ps-4">
      상품구매금액
    </div>
    <div class="col-9 border-top p-3">
      23123123023
    </div>
    <div class="col-3 border-top bg-secondary bg-opacity-10 p-3 ps-4">
      배송비
    </div>
    <div class="col-9 border-top p-3">
      23123123023
    </div>
    <div class="col-3 border-top bg-secondary bg-opacity-10 p-3 ps-4">
      결제예정금액
    </div>
    <div class="col-9 border-top p-3">
      23123123023
    </div>
  </div>

  <h4>배송지정보</h4>
  <div class="row border justify-content-md-center mb-3">
    <div class="col-3 border-top border-5 bg-secondary bg-opacity-10 p-3 ps-4">
      받으시는분
    </div>
    <div class="col-9 border-top border-5 p-3">
      23123123023
    </div>
    <div class="col-3 border-top bg-secondary bg-opacity-10 p-3 ps-4">
      우편번호
    </div>
    <div class="col-9 border-top p-3">
      23123123023
    </div>
    <div class="col-3 border-top bg-secondary bg-opacity-10 p-3 ps-4">
      주소
    </div>
    <div class="col-9 border-top p-3">
      23123123023
    </div>
    <div class="col-3 border-top bg-secondary bg-opacity-10 p-3 ps-4">
      휴대전화
    </div>
    <div class="col-9 border-top p-3">
      23123123023
    </div>
    <div class="col-3 border-top bg-secondary bg-opacity-10 p-3 ps-4">
      배송메세지
    </div>
    <div class="col-9 border-top p-3">
      23123123023
    </div>
  </div>
<div class="row mb-3">
  <div class="col d-flex justify-content-end d-grid">
    <button onclick="location.href='orderList.jsp'" class="btn btn-dark text-white d-grid" type="button">주문목록보기</button>
  </div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>