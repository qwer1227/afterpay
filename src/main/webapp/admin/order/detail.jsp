<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.user.UserDao" %>
<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>
<%@ page import="com.jhta.afterpay.order.OrderDao" %>
<%@ page import="com.jhta.afterpay.order.Order" %>
<%@ page import="com.jhta.afterpay.addr.AddrDao" %>
<%@ page import="com.jhta.afterpay.addr.Addr" %>
<%@ page import="com.jhta.afterpay.payment.PaymentDao" %>
<%@ page import="com.jhta.afterpay.payment.Payment" %>
<%@ page import="com.jhta.afterpay.delivery.DeliveryDao" %>
<%@ page import="com.jhta.afterpay.delivery.Delivery" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>AFTER PAY</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/common/css/style.css">
</head>
<body>
<%
    String menu = "주문 상세정보";
%>
<%@ include file="../../common/nav.jsp" %>

<div class="container mt-4 mb-5">
    <h1>주문 상세정보</h1>

    <!-- 주문정보 -->
    <%
        //  조회할 상품 정보
        //  int orderNo = Integer.parseInt(request.getParameter("orderNo"));
        OrderDao orderDao = new OrderDao();
        Order order = orderDao.getOrderByNo(8);
        AddrDao addrDao = new AddrDao();
        User user = new User();
        user.setNo(7);
        order.setUser(user);

        Addr addr = addrDao.getAddrByNo(order.getAddr().getNo());
    %>
    <h3 class="mb-3">주문정보</h3>
    <div class="row border-top justify-content-md-center mb-3">
        <div class="col-3 bg-dark text-white p-3 ps-4">
            주문번호
        </div>
        <div class="col-9 p-3">
            <%=order.getNo() %>
        </div>
        <div class="col-3 border-top bg-dark text-white p-3 ps-4">
            주문일자
        </div>
        <div class="col-9 border-top p-3">
            <%=order.getOrderDate() %>
        </div>
        <div class="col-3 border-top bg-dark text-white p-3 ps-4">
            주문인
        </div>
        <div class="col-9 border-top p-3">
            <%=order.getUser().getName() %>
        </div>
        <div class="col-3 border-top border-bottom bg-dark text-white p-3 ps-4">
            주문상태
        </div>
        <div class="col-9 border-top border-bottom p-3">
            <%=order.getStatus()%>
        </div>
    </div>

    <!-- 주문 상품 -->
    <h3 class="mb-3">주문상품</h3>
    <div class="row mb-5 p-3">
        <hr>
        <div class="col-2 mb-2">
            <img src="sample.jpg" class="rounded float-start" style="width: 170px; height:130px;">
        </div>
        <div class="col-7">
            <ul class="list-unstyled">
                <li>상품명: </li>
                <li>옵션: </li>
                <li>수량: </li>
                <li>상품금액: </li>
            </ul>
        </div>
        <div class="border-bottom"></div>
    </div>

    <!-- 결제 정보 -->
    <%
        // 결제 정보 가져오기
        PaymentDao paymentDao = new PaymentDao();
        Payment payment = paymentDao.getPaymentByOrderNo(8);
        payment.setOrder(order);

    %>
    <h3 class="mb-3">결제정보</h3>
    <div class="row border-top justify-content-md-center mb-3">
        <div class="col-3 bg-dark text-white p-3 ps-4">
            총 주문금액
        </div>
        <div class="col-9 p-3">
            <%=payment.getOrder().getPrice() %>
        </div>
        <div class="col-3 border-top bg-dark text-white p-3 ps-4">
            배송비
        </div>
        <div class="col-9 border-top p-3">
            <%=payment.getOrder().getDeliveryPrice()%>
        </div>
        <div class="col-3 border-top border-bottom bg-dark text-white p-3 ps-4">
            총 결제금액
        </div>
        <div class="col-9 border-top border-bottom p-3">
            <%=payment.getPrice() + payment.getOrder().getDeliveryPrice()%>
        </div>
    </div>

    <!-- 배송 정보 -->
    <%
        // 배송지 정보 가져오기
        DeliveryDao deliveryDao = new DeliveryDao();
        Delivery delivery = deliveryDao.getDeliveryByOrderNo(8);
        delivery.setOrder(order);
    %>
    <h3 class="mb-3">배송정보</h3>
    <div class="row border-top justify-content-md-center mb-3">
        <div class="col-3 bg-dark text-white p-3 ps-4">
            수령인
        </div>
        <div class="col-9 p-3">
            <%=delivery.getRecipient() %>
        </div>
        <div class="col-3 border-top bg-dark text-white p-3 ps-4">
            우편번호
        </div>
        <div class="col-9 border-top p-3">
            <%=delivery.getOrder().getAddr().getZipCode() %>
        </div>
        <div class="col-3 border-top bg-dark text-white p-3 ps-4">
            주소
        </div>
        <div class="col-9 border-top p-3">
            <%=delivery.getOrder().getAddr().getAddr1() %>
        </div>
        <div class="col-3 border-top bg-dark text-white p-3 ps-4">
            휴대전화
        </div>
        <div class="col-9 border-top p-3">
            <%=delivery.getOrder().getUser().getTel() %>
        </div>
        <div class="col-3 border-top border-bottom bg-dark text-white p-3 ps-4">
            배송메세지
        </div>
        <div class="col-9 border-top border-bottom p-3">
            <%=delivery.getOrder().getDeliveryMessage() %>
        </div>
    </div>

    <!--버튼-->
    <div class="text-end my-2">
        <a href="delete.jsp" class="btn btn-danger">주문삭제</a>
        <a href="modify-form.jsp" class="btn btn-primary">주문수정</a>
        <a href="order.jsp" class="btn btn-success">주문목록</a>
    </div>
</div>
<%@ include file="../../common/footer.jsp" %>
</body>
</html>