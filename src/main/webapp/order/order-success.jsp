<%@ page import="com.jhta.afterpay.delivery.DeliveryDao" %>
<%@ page import="com.jhta.afterpay.order.OrderDao" %>
<%@ page import="com.jhta.afterpay.order.Order" %>
<%@ page import="com.jhta.afterpay.delivery.Delivery" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.product.Stock" %>
<%@ page import="com.jhta.afterpay.product.StockDao" %>
<%@ page import="com.jhta.afterpay.product.Product" %>
<%@ page import="com.jhta.afterpay.product.ProductDao" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
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
<%
    // 가장 최근 주문내역 가져오기
    OrderDao orderDao = new OrderDao();
    Order order = orderDao.getMostLatelyOrderNoByUserNo(7);
%>
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
                    <span><%=order.getNo()%></span>
                </li>
                <li>
                    <label class="col-10">결제금액</label>
                    <span><%=Utils.toCurrency(order.getPaymentPrice())%></span>
                </li>
            </ul>
        </div>
<%
    DeliveryDao deliveryDao = new DeliveryDao();
    StockDao stockDao = new StockDao();
    ProductDao productDao = new ProductDao();
    int totalPrice = 0;
    int deliveryPrice = 3000;

    // 주문내역중 가장 최근 주문 가져오기

    List<Delivery> deliveries = deliveryDao.getAllDeliveryByOrderNo(order.getNo());
    for (Delivery delivery : deliveries) {
        int stockNo = delivery.getStock().getNo();
        Stock stock = stockDao.getStockByNo(stockNo);
        int productNo  = delivery.getProduct().getNo();
        Product product = productDao.getProductByNo(productNo);
        totalPrice += delivery.getAmount() * product.getPrice();
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
                            [옵션:<%=stock.getSize()%>]
                        </li>
                        <li>
                            수량: <%=delivery.getAmount()%>
                        </li>
                        <li>
                            상품구매금액: <%=Utils.toCurrency(delivery.getAmount() * product.getPrice())%>
                        </li>
                    </ul>
<%
    }
%>
                </div>
        </div>
        <%-- 결제 정보 --%>
        <div class="row border mb-3 p-3 border-dark">
            <h3 class="mt-3">결제정보</h3>
                <ul class="list-unstyled">
                    <li>
                        <label class="col-10">주문상품</label>
                        <span><%=Utils.toCurrency(totalPrice)%></span>
                    </li>
                    <li>
                        <label class="col-10">배송비</label>
                        <span><%=Utils.toCurrency(deliveryPrice)%></span>
                    </li>
                    <li>
                        <div class="bg-secondary bg-opacity-25">
                            <label class="col-10"><strong>결제금액</strong></label>
                            <span><strong><%=Utils.toCurrency(deliveryPrice + totalPrice)%></strong></span>
                        </div>
                    </li>
                </ul>
        </div>
    </div>
    <div class="row mb-3">
        <form action="order-detail.jsp?orderNo=<%=order.getNo()%>" method="get">
        <div class="col d-flex justify-content-end">
           <button onclick="location.href='order-detail.jsp'" class="btn btn-white text-black border border-2">주문확인하기</button>
        </div>
        </form>
        <div class="col-2"></div>
        <div class="col d-flex justify-content-start d-grid">
            <button onclick="location.href='order-list.jsp'" class="btn btn-dark text-white d-grid" type="button">쇼핑계속하기</button>
        </div>
    </div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
