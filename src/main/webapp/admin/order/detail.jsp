<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.user.UserDao" %>
<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>
<%@ page import="com.jhta.afterpay.order.OrderDao" %>
<%@ page import="com.jhta.afterpay.order.Order" %>
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
    String menu = "회원 상세정보";
%>
<%@ include file="../../common/nav.jsp" %>
<div class="container mt-4 mb-5">
    <h1>주문 상세정보</h1>
    <%
        int orderNo = Utils.toInt(request.getParameter("no"));

        // 요청파라미터로 전달받은 회원번호에 해당하는 회원 상세정보를 조회한다.
        OrderDao orderDao = new OrderDao();
        Order order = orderDao.getOrderByNo(orderNo);
    %>
    <table class="table table-bordered">
        <colgroup>
            <col width="15%">
            <col width="35%">
            <col width="15%">
            <col width="35%">
        </colgroup>
        <thead class="table-dark">
        <tr>
            <th>항목</th>
            <th>값</th>
            <th>항목</th>
            <th>값</th>
        </tr>
        </thead>
        <tbody>

        <tr>
            <th>번호</th>
            <td><%=order.getNo()%></td>
            <th>주문자명</th>
            <td><%=StringEscapeUtils.escapeHtml4(order.getUser().getName())%></td>
        </tr>
        <tr>
            <th>주문자아이디</th>
            <td><%=order.getUser().getId()%></td>
            <th>주문일자</th>
            <td><%=user.getPwd()%></td>
        </tr>
        <tr>
            <th>주문상태</th>
            <td><%=user.getTel()%></td>
            <th>주문수량</th>
            <td><%=user.getEmail()%></td>
        </tr>
        <tr>
            <th>주문가격</th>
            <td><%=user.getCreatedDate()%></td>
            <th>배송비</th>
            <td><%=user.getGradeId()%></td>
        </tr>
        <tr>
            <th>사용적립금</th>
            <td><%=user.getPoint()%> 원</td>
            <th>할인가</th>
            <td></td>
        </tr>
        <tr>
            <th>결제금액</th>
            <td><%=user.getIsBanned()%></td>
            <th>배송상태</th>
            <td><%=user.getIsSignOut()%></td>
        </tr>
        <tr>
            <th>depositPoint</th>
            <td><%=user.getIsBanned()%></td>
            <th>주문상품</th>
            <td><%=user.getIsSignOut()%></td>
        </tr>
        </tbody>
    </table>
    <!--버튼-->
    <div class="text-end my-2">
        <a href="#" class="btn btn-danger">회원삭제</a>
        <a href="#" class="btn btn-primary">회원수정</a>
        <a href="user.jsp" class="btn btn-success">회원목록</a>
    </div>
</div>
<%@ include file="../../common/footer.jsp" %>
</body>
</html>