<%@ page import="com.jhta.afterpay.order.OrderDao" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.order.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.util.Pagination" %>
<%@ page import="com.jhta.afterpay.delivery.DeliveryDao" %>
<%@ page import="com.jhta.afterpay.delivery.Delivery" %>
<%@ page import="com.jhta.afterpay.user.ReviewDao" %>
<%@ page import="com.jhta.afterpay.user.Review" %>
<%@ page import="com.jhta.afterpay.product.*" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
    <link href="/common/css/style.css" rel="stylesheet">
    <title>AFTER PAY</title>
</head>
<style>
    h2 {
        text-align: center;
    }

    #check-all {
        margin-left: 15px;
    }

    #check-del {
        margin-right: 20px;
    }
</style>
<body>
<%@include file="../common/nav.jsp" %>
<%
    int userNo = Utils.toInt(String.valueOf(session.getAttribute("USERNO")));
    if (userID == null) {
        response.sendRedirect("../login-form.jsp?deny");
        return;
    }
    DeliveryDao deliveryDao = new DeliveryDao();
    OrderDao orderDao = new OrderDao();

    int pageNo = Utils.toInt(request.getParameter("page"), 1);
    List<Order> orders = orderDao.getAllOrdersByUserNo(userNo);
    int totalRows = orderDao.getTotalRows();
    Pagination pagination = new Pagination(pageNo, totalRows, 5, 5);
    orders = orderDao.getAllOrdersByUserNo(userNo, pagination.getBegin(), pagination.getEnd());
%>
<div class="container">
    <div class="row">
        <div class="col-2"></div>
        <div class="col-10">
            <h2 class="mt-3"><strong>주문내역</strong></h2>
        </div>
    </div>
    <div class="row">
        <!-- 메뉴 nav 사용 -->
        <div class="col-2">
            <%@include file="../common/user-nav.jsp" %>
        </div>
        <!-- 컨텐츠 -->
        <div class="col-10">
            <hr style="border:solid 1px gray;">
            <div class="row">
                <div class="tab-content" id="nav-tabContent">
                    <%
                        if (orders.isEmpty()) {
                    %>
                    <div class="text-center m-5">
                        <strong>주문 내역이 없습니다.</strong><br>
                        <br>
                        <button type="button" onclick="location.href='../index.jsp'"
                                class="btn btn-lg bg-light border-dark-subtle">지금 바로 쇼핑하러 가기
                        </button>
                    </div>
                    <%
                    } else {
                    %>
                    <div>
                        <table class="table">
                            <colgroup>
                                <col width="1%">
                                <col width="15%">
                                <col width="*">
                                <col width="15%">
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col">
                                </th>
                                <th scope="col"></th>
                                <th scope="col"></th>
                                <th scope="col" class="text-end"></th>
                            </tr>
                            </thead>

                            <tbody>
                            <%
                                int totalPrice = 0;
                                ProductDao productDao = new ProductDao();
                                StockDao stockDao = new StockDao();
                                for (Order order : orders) {
                                    List<Delivery> deliveries = deliveryDao.getAllDeliveryByOrderNo(order.getNo());
                            %>
                            <tr class="align-middle">
                                <td></td>
                                <td></td>
                                <td>
                                    <div class="bg-black text-white m-1 text-center">
                                        <strong>주문번호: <%=order.getNo()%>
                                        </strong>
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <a href="../order/order-detail.jsp?orderNo=<%=order.getNo()%>"
                                           type="button" class="btn mt-1 btn-outline-primary">상세보기</a>
                                    </div>
                                </td>
                            </tr>
                            <%
                                for (Delivery delivery : deliveries) {
                                    Stock stock = stockDao.getStockByNo(delivery.getStock().getNo());
                                    Product product = productDao.getProductByNo(delivery.getProduct().getNo());
                                    List<Image> images = productDao.getAllImagesByNo(delivery.getProduct().getNo());
                                    totalPrice = delivery.getPrice() * delivery.getAmount();
                            %>
                            <tr class="align-middle">
                                <td></td>
                                <td>
                                    <img src="../common/images/<%=images.get(0).getName()%>" class="rounded float-start"
                                         style="width: 130px; height:150px;">
                                </td>
                                <td>
                                    <p style="font-size: 20px">
                                        <strong><%=product.getName()%>
                                        </strong>
                                    </p>
                                    <p>사이즈: <%=stock.getSize()%>
                                    </p>
                                    <p>수량: <%=delivery.getAmount()%> 개</p>
                                    <p>결제금액: <%=Utils.toCurrency(totalPrice + 3000)%> 원</p>
                                    <p>구매일자: <%=order.getOrderDate()%>
                                    </p>
                                    <p>배송상태: <%=delivery.getStatus()%>
                                    </p>
                                </td>
                                <td class="text-center">
                                    <div>
                                        <a href="../order/order-form.jsp?stockNo=<%=stock.getNo()%>&amount=<%=delivery.getAmount()%>"
                                           type="button" class="btn mt-1 btn-outline-primary">재 구 매</a></div>
                                    <div>
                                        <a href="../order/order-cancel.jsp?stockNo=<%=stock.getNo()%>&deliveryNo=<%=delivery.getNo()%>&orderNo=<%=order.getNo()%>"
                                           type="button" class="btn mt-1 btn-outline-primary">주문취소</a></div>
                                    <div><a href="/review/review-form.jsp?pno=<%=product.getNo()%>" type="button"
                                            class="btn mt-1 btn-outline-success">리뷰쓰기</a></div>
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                            </tbody>
                        </table>
                    </div>

                    <%--페이징 처리--%>
                    <%
                        if (pagination.getTotalRows() > 0) {
                    %>
                    <div>
                        <ul class="pagination justify-content-center">
                            <li class="page-item <%=pagination.isFirst() ? "disabled" : ""%>">
                                <a href="orders.jsp?userNo=<%=userNo%>&page=<%=pagination.getPrev() %>"
                                   class="page-link">이전</a>
                            </li>
                            <%
                                for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
                            %>
                            <li class="page-item <%=num == pageNo ? "active" : ""%>">
                                <a href="orders.jsp?userNo=<%=userNo%>&page=<%=num %>" class="page-link"><%=num %>
                                </a>
                            </li>
                            <%
                                }
                            %>
                            <li class="page-item <%=pagination.isLast() ? "disabled" : "" %>">
                                <a href="orders.jsp?userNo=<%=userNo%>&page=<%=pagination.getNext() %>"
                                   class="page-link">다음</a>
                            </li>
                        </ul>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</div>
    <%@include file="../common/footer.jsp" %>
</body>
</html>
