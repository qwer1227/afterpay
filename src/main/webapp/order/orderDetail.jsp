<%@ page import="com.jhta.afterpay.order.OrderDao" %>
<%@ page import="com.jhta.afterpay.order.Order" %>
<%@ page import="com.jhta.afterpay.payment.PaymentDao" %>
<%@ page import="com.jhta.afterpay.payment.Payment" %>
<%@ page import="com.jhta.afterpay.delivery.DeliveryDao" %>
<%@ page import="com.jhta.afterpay.delivery.Delivery" %>
<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page import="com.jhta.afterpay.addr.AddrDao" %>
<%@ page import="com.jhta.afterpay.addr.Addr" %>
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

<%
  // 조회할 상품 정보
//  int orderNo = Integer.parseInt(request.getParameter("orderNo"));
  OrderDao orderDao = new OrderDao();
  Order order = orderDao.getOrderByNo(8);
  AddrDao addrDao = new AddrDao();
  User user = new User();
  user.setNo(7);
  order.setUser(user);

  Addr addr = addrDao.getAddrByNo(order.getAddr().getNo());
%>
<div class="container ">
  <h3 class="mb-5 pt-3">주문상세조회</h3>
  <%-- 주문 정보 --%>
  <h4>주문정보</h4>
  <div class="row border-top border-4 border-dark justify-content-md-center mb-5 ">
    <div class="col-3 border-dark bg-secondary bg-opacity-10 p-3 ps-4">
      주문번호
    </div>
    <div class="col-9 p-3">
      <%=order.getNo() %>
    </div>
    <div class="col-3 border bg-secondary bg-opacity-10 p-3 ps-4">
      주문 일자
    </div>
    <div class="col-9 border-top p-3">
      <%=order.getOrderDate() %>
    </div>
    <div class="col-3 border-top bg-secondary bg-opacity-10 p-3 ps-4">
      주문자
    </div>
    <div class="col-9 border-top p-3">
      <%=order.getUser().getName() %>
    </div>
    <div class="col-3 border-top border-bottom  bg-secondary bg-opacity-10 p-3 ps-4">
      주문처리 상태
    </div>
    <div class="col-9 border-top border-bottom  p-3">
      <%=order.getStatus()%>
    </div>
  </div>
<%--  <h4>결제정보</h4>--%>
<%--  <div class="row border justify-content-md-center mb-5">--%>
<%--    <div class="col-3 border-top border-5 bg-secondary bg-opacity-10 p-3 ps-4">--%>
<%--      총 주문금액--%>
<%--    </div>--%>
<%--    <div class="col-9 border-top border-5 p-3">--%>
<%--      23123123023--%>
<%--    </div>--%>
<%--    <div class="col-3 border-top bg-secondary bg-opacity-10 p-3 ps-4">--%>
<%--      총 결제금액--%>
<%--    </div>--%>
<%--    <div class="col-9 border-top p-3">--%>
<%--      23123123023--%>
<%--    </div>--%>
<%--  </div>--%>

  <%-- 주문 상품 --%>
  <h3 class="mb-3">주문상품</h3>
  <div class="row mb-5 p-3 border-top border-4 border-dark">
    <hr>
    <div class="col-2 mb-2">
      <img src="sample.jpg" class="rounded float-start" style="width: 170px; height:130px;">
    </div>
    <div class="col-7">
      <ul class="list-unstyled">
        <li>주문 상품명</li>
        <li>옵션</li>
        <li>수량:</li>
        <li>상품 가격:</li>
      </ul>
    </div>
    <div class="border-bottom"></div>
  </div>
<%
    // 결제 정보 가져오기
    PaymentDao paymentDao = new PaymentDao();
    Payment payment = paymentDao.getPaymentByOrderNo(8);
    payment.setOrder(order);

%>
  <h4>최종 결제 정보</h4>
  <div class="row justify-content-md-center mb-5 border-top border-4 border-dark">
    <div class="col-3 border-top bg-secondary bg-opacity-10 p-3 ps-4">
      총 주문금액
    </div>
    <div class="col-9 border-top p-3">
      23123123023
    </div>
    <div class="col-3 border-top bg-secondary bg-opacity-10 p-3 ps-4">
      배송비
    </div>
    <div class="col-9 border-top p-3">
      <%=payment.getOrder().getDeliveryPrice()%>
    </div>
    <div class="col-3 border-top border-bottom bg-secondary bg-opacity-10 p-3 ps-4">
      결제예정금액
    </div>
    <div class="col-9 border-top border-bottom p-3">
      <%=payment.getPrice() + payment.getOrder().getDeliveryPrice()%>
    </div>
  </div>
<%
    // 배송지 정보 가져오기
    DeliveryDao deliveryDao = new DeliveryDao();
    Delivery delivery = deliveryDao.getDeliveryByOrderNo(8);
    delivery.setOrder(order);
%>
  <h4>배송지정보</h4>
  <div class="row border-top border-4 border-dark justify-content-md-center mb-3">
    <div class="col-3 bg-secondary bg-opacity-10 p-3 ps-4">
      받으시는 분
    </div>
    <div class="col-9 p-3">
      <%=delivery.getRecipient() %>
    </div>
    <div class="col-3 border-top bg-secondary bg-opacity-10 p-3 ps-4">
      우편번호
    </div>
    <div class="col-9 border-top p-3">
      <%=delivery.getOrder().getAddr().getZipCode() %>
    </div>
    <div class="col-3 border-top bg-secondary bg-opacity-10 p-3 ps-4">
      주소
    </div>
    <div class="col-9 border-top p-3">
      <%=delivery.getOrder().getAddr().getAddr1() %>
    </div>
    <div class="col-3 border-top bg-secondary bg-opacity-10 p-3 ps-4">
      휴대전화
    </div>
    <div class="col-9 border-top p-3">
      <%=delivery.getOrder().getUser().getTel() %>
    </div>
    <div class="col-3 border-top border-bottom bg-secondary bg-opacity-10 p-3 ps-4">
      배송 메세지
    </div>
    <div class="col-9 border-top border-bottom p-3">
      ddd
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