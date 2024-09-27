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
<%@ page import="java.util.List" %>
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
<%@ include file="../../common/nav.jsp" %>

<div class="container mb-5" style="margin-top: 100px;">

    <div class="row mb-3">
        <div class="col-9 offset-2">
            <h2 class="text-center"><strong>주문 상세조회</strong></h2>
        </div>
    </div>

    <div class="row mb-3">
        <div class="col-2">
            <!--관리자 메뉴-->
            <%@include file="../admin-nav.jsp" %>
            <%
                if (userID == null || !userID.equals("ADMIN")) {
                    response.sendRedirect("/login-form.jsp?deny");
                    return;
                } else {
            %>
        </div>
        <div class="col-10">
            <!-- 주문정보 -->
            <%
                //  조회할 상품 정보
                int orderNo = Utils.toInt(request.getParameter("no"));

                // 요청파라미터로 전달받은 회원번호에 해당하는 회원 상세정보를 조회한다.
                OrderDao orderDao = new OrderDao();
                Order order = orderDao.getAllOrderByNo(orderNo);

                User user = order.getUser();
                Addr addr = order.getAddr();
            %>
            <div class="row mb-3">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header"><strong>주문정보</strong></div>
                        <div class="card-body">
                            <table class="table">
                                <tbody>
                                <tr>
                                    <th>주문번호</th>
                                    <td><%=order.getNo()%>
                                    </td>
                                    <th>주문일자</th>
                                    <td><%=order.getOrderDate()%>
                                    </td>
                                </tr>

                                <tr>
                                    <th>주문자명</th>
                                    <td><%=user.getName()%>
                                    </td>
                                    <th>주문아이디</th>
                                    <td><%=user.getId()%>
                                    </td>
                                </tr>
                                <tr>
                                    <th>주문상태</th>
                                    <td><%=order.getStatus()%>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-6">
                    <div class="card">
                        <div class="card-header"><strong>배송지 정보</strong></div>
                        <div class="card-body">
                            <table class="table">
                                <tbody>
                                <tr>
                                    <th>수령인</th>
                                    <td><%=user.getName()%></td>
                                </tr>
                                <tr>
                                    <th>우편번호</th>
                                    <td><%=addr.getZipCode()%></td>
                                </tr>
                                <tr>
                                    <th>기본주소</th>
                                    <td><%=addr.getAddr1()%></td>
                                </tr>
                                <tr>
                                    <th>상세주소</th>
                                    <td><%=addr.getAddr2()%></td>
                                </tr>
                                <tr>
                                    <th>전화번호</th>
                                    <td><%=addr.getTel()%></td>
                                </tr>
                                <tr>
                                    <th>배송메세지</th>
                                    <td><%=order.getDeliveryMessage()%></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="card">
                        <div class="card-header"><strong>결제 정보</strong></div>
                        <div class="card-body">
                            <table class="table">
                                <tbody>
                                <tr>
                                    <th>총구매금액</th>
                                    <td><%=order.getPrice()%></td>
                                </tr>
                                <tr>
                                    <th>총결제금액</th>
                                    <td><%=order.getPaymentPrice()%></td>
                                </tr>
                                <tr>
                                    <th>배송지</th>
                                    <td><%=addr.getName()%></td>
                                </tr>
                                <tr>
                                    <th>사용포인트</th>
                                    <td><%=order.getUsePoint()%></td>
                                </tr>
                                <tr>
                                    <th>적립포인트</th>
                                    <td><%=order.getDepositPoint()%></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header"><strong>상품정보</strong></div>
                        <div class="card-body">
                            <%
                                List<Delivery> deliveries = orderDao.getDeliveriesByOrderNo(orderNo);
                            %>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>사진</th>
                                        <th>상품명</th>
                                        <th>사이즈</th>
                                        <th>수량</th>
                                        <th>가격</th>
                                        <th>배송상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                    for (Delivery del : deliveries) {
                                %>
                                <tr class="align-middle">
                                    <td><img src="/../common/images/<%=del.getProduct().getDefaultImage()%>"
                                             width="100" height="100"></td>
                                    <td><%=del.getProduct().getName() %> </td>
                                    <td><%=del.getStock().getSize() %> </td>
                                    <td><%=del.getAmount()%> </td>
                                    <td><%=del.getPrice() %> </td>
                                    <td><%=del.getStatus() %></td>
                                </tr>
                                <%
                                    }
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>

            <!--버튼-->
            <div class=" text-end my-2">
                <a href="delete.jsp?no=<%=orderNo%>" class="btn btn-danger">주문삭제</a>
                <a href="modify-form.jsp?no=<%=orderNo%>" class="btn btn-primary">주문수정</a>
                <a href="order.jsp" class="btn btn-success">주문목록</a>
            </div>
        </div>
    </div>
</div>
<%
    }
%>
<%@ include file="../../common/footer.jsp" %>
</body>
</html>