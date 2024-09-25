<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.user.UserDao" %>
<%@ page import="com.jhta.afterpay.user.User" %>
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
            <h2 class="text-center"><strong>적립금 지급</strong></h2>
        </div>
    </div>

    <div class="row mb-3">
        <div class="col-2">
            <!--관리자 메뉴-->
            <%@include file="../admin-nav.jsp" %>
        </div>
        <div class="col-10">
            <%
                int userNo = Utils.toInt(request.getParameter("no"));

                // 요청파라미터로 전달받은 회원번호에 해당하는 회원 상세정보를 조회한다.
                UserDao userDao = new UserDao();
                User user = userDao.getUserByNo(userNo);
            %>
            <div class="row mb-3">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header"><strong>주문정보</strong></div>
                        <div class="card-body">
                            <table class="table">
                                <tbody>
                                <tr>
                                    <th>회원번호</th>
                                    <td><%=user.getNo()%>
                                    </td>
                                    <th>아이디</th>
                                    <td><%=user.getId()%>
                                    </td>
                                </tr>

                                <tr>
                                    <th>이름</th>
                                    <td><%=user.getName()%>
                                    </td>
                                    <th>등급</th>
                                    <td><%=user.getGradeId()%>
                                    </td>
                                </tr>
                                <tr>
                                    <th>총 적립금</th>
                                    <td><%=user.getTotalPoint()%>
                                    </td>
                                    <th>총 사용적립금</th>
                                    <td><%=user.getTotalUsedPoint()%>
                                    </td>
                                </tr>
                                <tr>
                                    <th>현재 적립금</th>
                                    <td><%=user.getPoint()%>
                                    </td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="card-footer">
                            <form method="post" action="update.jsp">
                                <div class="text-end p-3">
                                    <input type="hidden" name="userNo" value="<%=user.getNo()%>">
                                    <input type="number" name="point" class="form-control w-25 d-inline-block">
                                    <button type="submit" class="btn btn-danger">지급</button>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>

        </div>
        <%@ include file="../../common/footer.jsp" %>
</body>
</html>