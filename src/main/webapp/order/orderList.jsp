<%@ page import="com.jhta.afterpay.order.OrderDao" %>
<%@ page import="com.jhta.afterpay.order.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.delivery.DeliveryDao" %>
<%@ page import="com.jhta.afterpay.delivery.Delivery" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>주문 내역</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/common/css/style.css">
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<%
    OrderDao orderDao = new OrderDao();
    List<Order> orders = orderDao.getAllOrderByUserNo(6); // 세션이용

%>
<div class="container">
    <div class="row">
        <div class="text-center">
            <h1 class="my-5">주문 내역</h1>
        </div>
        <div class="col-2 pt-5">
            <!-- 메뉴목록 -->
            <ul class="list-group mb-5">
                <li class="list-group-item"><strong>나의 쇼핑정보</strong></li>
                <li class="list-group-item"><a href="#" class="text-decoration-none">주문내역 조회</a></li>
                <li class="list-group-item"><a href="#" class="text-decoration-none">쿠폰 내역</a></li>
                <li class="list-group-item"><a href="#" class="text-decoration-none">적립금 내역</a></li>
            </ul>
        </div>
        <div class="col-9 my-1">
            <!--상품목록-->
            <table class="table">
                <thead>
                <tr>
                    <th>주문번호</th>
                    <th>결제금액</th>
                    <th>상품이름</th>
                    <th>주문일자</th>
                    <th>주문수량</th>
                    <th>배송상태</th>
                </tr>
                </thead>
                <tbody>
<%
    DeliveryDao deliveryDao = new DeliveryDao();
    List<Delivery> deliveries = deliveryDao.getAllDeliveryByOrderNo();
    for (Order order : orders) {
%>
                <tr>
                    <td><%=order.getNo() %></td>
                    <td><%=order.getPaymentPrice() %>></td>
                    <td><%=%>></td>
                    <td>2024-09-13</td>
                    <td>100개</td>
                    <td>판매중</td>
                </tr>
 <%
     }
 %>
                </tbody>
            </table>
            <!--페이지네이션 -->
            <div>
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a href="#" class="page-link">이전</a></li>
                    <li class="page-item"><a href="#" class="page-link">1</a></li>
                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                    <li class="page-item"><a href="#" class="page-link">3</a></li>
                    <li class="page-item"><a href="#" class="page-link">4</a></li>
                    <li class="page-item"><a href="#" class="page-link">5</a></li>
                    <li class="page-item"><a href="#" class="page-link">다음</a></li>
                </ul>
            </div>
            <!--버튼-->
            <div class="text-end my-2">
                <a href="#" class="btn btn-danger">상품삭제</a>
                <a href="#" class="btn btn-primary">상품수정</a>
                <a href="#" class="btn btn-success">상품등록</a>
            </div>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
