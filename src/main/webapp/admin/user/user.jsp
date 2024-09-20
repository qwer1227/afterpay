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
    <div class="container">
        <div class="row">
            <div class="text-center">
                <h1 class="my-5">회원관리 페이지</h1>
            </div>
            <div class="col-2 pt-5">
                <!-- 메뉴목록 -->
                <ul class="list-group">
                    <li class="list-group-item"><a href="../home.jsp">관리자메인</a></li>
                    <li class="list-group-item"><a href="user.jsp">회원관리</a></li>
                    <li class="list-group-item"><a href="../order/order.jsp">주문관리</a></li>
                    <li class="list-group-item"><a href="../mileage/mileage.jsp">적립금관리</a></li>
                </ul>
                <ul class="list-group">
                    <li class="list-group-item"><a href="#">상품관리</a></li>
                    <li class="list-group-item"><a href="#">문의관리</a></li>
                    <li class="list-group-item"><a href="#">정산관리</a></li>
                </ul>
            </div>
            <div class="col-9 my-1">
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
                    List<User> users = userDao.getAllUsers(pagination.getBegin(), pagination.getEnd());
                %>
                <table class="table">
                    <thead>
                        <tr>
                            <th>회원번호</th>
                            <th>아이디</th>
                            <th>회원이름</th>
                            <th>가입일</th>
                            <th>등급</th>
                            <th>회원상태</th>
                            <th>상세조회</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        for (User user :users) {
                    %>
                        <tr>
                            <td><%=user.getNo()%></td>
                            <td><%=user.getId()%></td>
                            <td><%=user.getName()%></td>
                            <td><%=user.getCreatedDate()%></td>
                            <td><%=user.getGradeId()%></td>
                            <td><%=user.getIsBanned()%></td>
                            <td><a href="detail.jsp?no=<%=user.getNo() %>">상세조회</a></td>
                        </tr>
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
                            <a class="page-link" href="user.jsp?page=<%pagination.getPrev(); %>">이전</a>
                        </li>
                        <%
                            for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
                        %>
                        <li class="page-item <%=pageNo == num? "active" : "" %>">
                            <a href="user.jsp?page=<%=num %>" class="page-link"><%=num %></a>
                        </li>
                        <%
                            }
                        %>
                        <li class="page-item <%=pagination.isLast() ? "disabled" : ""%>">
                            <a class="page-link" href="user.jsp?page=<%=pagination.getNext() %>" >다음</a>
                        </li>
                    </ul>
                </div>
                <%
                    }
                %>
                <!--버튼-->
                <div class="text-end my-2">
                    <a href="delete.jsp" class="btn btn-danger">회원삭제</a>
                    <a href="form.jsp" class="btn btn-success">회원등록</a>
                </div>
            </div>
        </div>
    </div>
<%@ include file="../../common/footer.jsp" %>
</body>
</html>
