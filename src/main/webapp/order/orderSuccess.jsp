<%@ page import="com.jhta.afterpay.delivery.DeliveryDao" %><%--
  Created by IntelliJ IDEA.
  User: cola
  Date: 2024-09-16
  Time: 오후 12:52
  To change this template use File | Settings | File Templates.
--%>
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
        <div class="bg-dark text-white text-center">
            <h1>주문 완료</h1>
        </div>
        <hr>
        <%-- 주문 정보 --%>
        <div class="row border justify-content-md-center mb-5 border-dark">
            <ul class="list-unstyled p-3">
                <li class="text-center">
                    <span><b>고객님의 주문이 정상적으로 완료되었습니다.</b></span>
                </li>
                <li>
                    <label class="col-10">주문번호</label>
                    <span>564546556</span>
                </li>
                <li>
                    <label class="col-10">결제금액</label>
                    <span>564546556</span>
                </li>
            </ul>
        </div>
<%
    DeliveryDao deliveryDao = new DeliveryDao();

%>
        <%-- 주문 상품 --%>
        <div class="row border mb-5 p-3 border-dark">
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
        <%-- 결제 정보 --%>
        <div class="row border mb-3 p-3 border-dark">
            <h3 class="mt-3">결제정보</h3>
                <ul class="list-unstyled">
                    <li>
                        <label class="col-10">주문상품</label>
                        <span>\199,000</span>
                    </li>
                    <li>
                        <label class="col-10">배송비</label>
                        <span>\3000</span>
                    </li>
                    <li>
                        <div class="bg-secondary bg-opacity-25">
                            <label class="col-10"><strong>결제금액</strong></label>
                            <span><strong>\202,000</strong></span>
                        </div>
                    </li>
                </ul>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col d-flex justify-content-end">
           <button onclick="location.href='orderDetail.jsp'" class="btn btn-white text-black border border-2">주문확인하기</button>
        </div>
        <div class="col-2"></div>
        <div class="col d-flex justify-content-start d-grid">
            <button onclick="location.href='orderList.jsp'" class="btn btn-dark text-white d-grid" type="button">쇼핑계속하기</button>
        </div>
    </div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
