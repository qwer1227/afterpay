<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.util.Pagination" %>
<%@ page import="com.jhta.afterpay.order.OrderDao" %>
<%@ page import="com.jhta.afterpay.order.Order" %>
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
            <h1 class="text-center">주문관리 페이지</h1>
        </div>
    </div>

    <div class="row mb-3">
        <div class="col-2">
            <!--관리자 메뉴-->
            <%@include file="../admin-nav.jsp" %>
        </div>
        <div class="col-10">
            <!--주문목록-->
            <%
                OrderDao orderDao = new OrderDao();

                // 요청한 페이지 번호를 조회한다.
                int pageNo = Utils.toInt(request.getParameter("page"), 1);

                // 총 데이터 갯수를 조회한다.
                int totalRows = orderDao.getTotalRows();

                // Pagination 객체를 생성한다.
                Pagination pagination = new Pagination(pageNo, totalRows);

                // 요청한 페이지에 맞는 데이터를 조회한다.
                List<Order> orders = orderDao.getAllOrders(pagination.getBegin(), pagination.getEnd());
            %>
            <table class="table">
                <thead>
                <tr>
                    <th>주문번호</th>
                    <th>주문회원</th>
                    <th>주문일</th>
                    <th>주문상태</th>
                    <th>상세조회</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (Order order : orders) {
                %>
                <tr>
                    <td><%=order.getNo()%>
                    </td>
                    <td><%=order.getUser().getName()%>
                    </td>
                    <td><%=order.getOrderDate()%>
                    </td>
                    <td><%=order.getStatus()%>
                    </td>
                    <td><a href="detail.jsp?no=<%=order.getNo() %>">상세조회</a></td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <!--페이지네이션 -->
            <%
                if (pagination.getTotalPages() > 0) {
            %>
            <div>
                <ul class="pagination justify-content-center">
                    <li class="page-item <%=pagination.isFirst() ? "disabled" : "" %>">
                        <a class="page-link" href="order.jsp?page=<%pagination.getPrev(); %>">이전</a>
                    </li>
                    <%
                        for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
                    %>
                    <li class="page-item <%=pageNo == num? "active" : "" %>">
                        <a href="order.jsp?page=<%=num %>" class="page-link"><%=num %>
                        </a>
                    </li>
                    <%
                        }
                    %>
                    <li class="page-item <%=pagination.isLast() ? "disabled" : ""%>">
                        <a class="page-link" href="order.jsp?page=<%=pagination.getNext() %>">다음</a>
                    </li>
                </ul>
            </div>
            <%
                }
            %>
            <!--버튼-->
            <div class="text-end my-2">
                <a href="delete.jsp" class="btn btn-danger">주문삭제</a>
                <a href="form.jsp" class="btn btn-success">주문등록</a>
            </div>
        </div>
    </div>
</div>
<%@ include file="../../common/footer.jsp" %>
</body>
</html>
