<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.util.Pagination" %>
<%@ page import="com.jhta.afterpay.user.UserDao" %>
<%@ page import="com.jhta.afterpay.user.User" %>
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
<div class="container mb-5"  style="margin-top: 100px;">
    <div class="rom mb-3">
        <div class="col-10 offset-1">
            <h2 class="text-center"><strong>회원관리 페이지</strong></h2>
        </div>
    </div>

    <div class="row mb-3">
        <div class="col-2">
            <%@include file="../admin-nav.jsp"%>
        </div>
        <div class="col-10">
            <!--회원목록-->
            <%
                UserDao userDao = new UserDao();

                // 요청한 페이지 번호를 조회한다.
                int pageNo = Utils.toInt(request.getParameter("page"), 1);

                // 총 데이터 갯수를 조회한다.
                int totalRows = userDao.getTotalRows();

                // Pagination 객체를 생성한다.
                Pagination pagination = new Pagination(pageNo, totalRows);

                // 요청한 페이지에 맞는 데이터를 조회한다.
                List<User> users = userDao.getAllUserPoints(pagination.getBegin(), pagination.getEnd());
            %>
            <table class="table">
                <thead>
                <tr>
                    <th>회원번호</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>총 적립금</th>
                    <th>사용적립금</th>
                    <th>현재적립금</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (User user :users) {
                %>
                <tr>
                    <td><a href="mileage-history.jsp?no=<%=user.getNo()%>"><%=user.getNo()%></a></td>
                    <td><%=user.getId()%></td>
                    <td><%=user.getName()%></td>
                    <td><%=user.getTotalPoint()%></td>
                    <td><%=user.getTotalUsedPoint()%></td>
                    <td><%=user.getPoint()%></td>
                    <td>
                        <input type="text" class="form-control" name="mileageContents"
                               value="<%= %>"내용</input>
                    </td>
                    <td><a href="form.jsp?no=<%=user.getNo()%>" class="btn btn-primary btn-sm">적립</a></td>
                        <%
                        }
                    %>
                </tbody>
            </table>
            <!--페이지네이션 -->
            <%
                if(pagination.getTotalPages() > 0) {
            %>
            <div>
                <ul class="pagination justify-content-center">
                    <li class="page-item <%=pagination.isFirst() ? "disabled" : "" %>">
                        <a class="page-link" href="mileage.jsp?page=<%pagination.getPrev(); %>">이전</a>
                    </li>
                    <%
                        for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
                    %>
                    <li class="page-item <%=pageNo == num? "active" : "" %>">
                        <a href="mileage.jsp?page=<%=num %>" class="page-link"><%=num %></a>
                    </li>
                    <%
                        }
                    %>
                    <li class="page-item <%=pagination.isLast() ? "disabled" : ""%>">
                        <a class="page-link" href="mileage.jsp?page=<%=pagination.getNext() %>" >다음</a>
                    </li>
                </ul>
            </div>
            <%
                }
            %>
        </div>

    </div>
</div>
<%@ include file="../../common/footer.jsp" %>
</body>
</html>
