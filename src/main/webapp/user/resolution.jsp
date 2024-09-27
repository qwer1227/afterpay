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
<%@ page import="java.util.ArrayList" %>
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
    StockDao stockDao = new StockDao();
    ProductDao productDao = new ProductDao();

    int pageNo = Utils.toInt(request.getParameter("page"), 1);
    int totalRows = orderDao.getTotalRowsHaveCancelDeliveryOrderByUserNo(userNo);
    Pagination pagination = new Pagination(pageNo, totalRows, 5, 3);


    List<Delivery> cancelDeliveries = new ArrayList<>();
    List<Order> cancelOrders = orderDao.getAllOrdersByUserNoCancelDelivery(userNo, pagination.getBegin(), pagination.getEnd());
    int totalPrice = 0;
%>
<div class="container">
    <div class="row">
        <div class="col-2"></div>
        <div class="col-10">
            <h2 class="mt-3"><strong>취소/반품/환불</strong></h2>
        </div>
    </div>
    <div class="row">
        <div class="col-2">
            <%@include file="../common/user-nav.jsp" %>
        </div>
        <div class="col-10">
            <hr style="border:solid 1px gray;"/>
            <%
                if (cancelOrders.isEmpty()) {
            %>
            <div class="text-center m-5">
                <strong>취소/교환/환불 내역이 없습니다.</strong><br>
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
                        <th scope="col" class="text-end">
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        for (Order order : cancelOrders) {
                            List<Delivery> deliveries = deliveryDao.getAllCancelDeliveryByOrderNo(order.getNo());
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
                        <td></td>
                    </tr>
                    <%
                        for (Delivery delivery : deliveries) {
                            Stock stock = stockDao.getStockByNo(delivery.getStock().getNo());
                            Product product = productDao.getProductByNo(delivery.getProduct().getNo());
                            List<Image> images = productDao.getAllImagesByNo(delivery.getProduct().getNo());
                    %>
                    <tr class="align-middle">
                        <td>
                        </td>
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
                            <p>결제금액: <%=Utils.toCurrency(delivery.getPrice())%> 원</p>
                            <p>주문일자: <%=delivery.getOrder().getOrderDate()%>
                            </p>
                            <p>배송상태: <%=delivery.getStatus()%>
                            </p>
                        </td>
                        <td class="text-center">
                            <form action="../order/order-detail.jsp">
                                <input type="hidden" name="deliveryNo" value="<%=delivery.getNo() %>">
                                <div><input type="submit" class="btn mt-1 btn-outline-info" value="상세보기"></div>
                            </form>
                            <div>
                                <a href="../order/order-form.jsp?stockNo=<%=stock.getNo()%>&amount=<%=delivery.getAmount()%>"
                                   type="button" class="btn mt-1 btn-outline-primary">재 구 매</a></div>
                            <div><a href="/review/review-form.jsp?pno=<%=product.getNo()%>" type="button"
                                    class="btn mt-1 btn-outline-success">리뷰쓰기</a></div>
                        </td>
                    </tr>
                    <%
                                }
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
                        <a href="resolution.jsp?userNo=<%=userNo%>&page=<%=pagination.getPrev() %>"
                           class="page-link">이전</a>
                    </li>
                    <%
                        for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
                    %>
                    <li class="page-item <%=num == pageNo ? "active" : ""%>">
                        <a href="resolution.jsp?userNo=<%=userNo%>&page=<%=num %>" class="page-link"><%=num %>
                        </a>
                    </li>
                    <%
                        }
                    %>
                    <li class="page-item <%=pagination.isLast() ? "disabled" : "" %>">
                        <a href="resolution.jsp?userNo=<%=userNo%>&page=<%=pagination.getNext() %>"
                           class="page-link">다음</a>
                    </li>
                </ul>
            </div>
            <%
                }
            %>
        </div>
    </div>
</div>
</div>

<script type="text/javascript">
    function checkAll(el) {
        const checkBoxes = document.querySelectorAll('.chkbox');
        checkBoxes.forEach((row) => {
            row.checked = el.checked;
        })
    }
</script>

<%@include file="../common/footer.jsp" %>
</body>
</html>
