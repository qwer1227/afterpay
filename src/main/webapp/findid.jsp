<%@ page import="com.jhta.afterpay.user.UserDao" %>
<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&display=swap" rel="stylesheet">
<link href="/common/css/style.css" rel="stylesheet">
<html>
<head>
    <title>아이디 찾기 완료</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* 화면 전체 높이 */
            margin: 0;
        }

        .container {
            background-color: #fff; /* 흰색 배경 */
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
            width: 400px; /* 고정 너비 */
            margin: auto; /* 중앙 정렬 */
            margin-top: 120px; /* 위쪽 여백 추가 */
            margin-bottom: 20px; /* 푸터와의 간격 */
        }

        h2 {
            margin-bottom: 20px;
            color: #333; /* 제목 색상 */
            text-align: center; /* 중앙 정렬 */
        }

        .item {
            margin-bottom: 20px; /* 아이디 텍스트와 버튼 간의 여백 */
            font-size: 1.2rem; /* 텍스트 크기 */
            text-align: center; /* 중앙 정렬 */
        }

        .btn-primary {
            width: 100%; /* 버튼을 전체 너비로 조정 */
        }
    </style>
</head>
<body>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");

    UserDao userDao = new UserDao();
    User user = userDao.getUserIdByEmailAndName(email, name);

    if (user == null) {
        response.sendRedirect("findid-form.jsp?error");
        return;
    }
%>
<%@include file="common/nav.jsp" %>
<div class="container">
    <h2>아이디 찾기 완료</h2>
    <div class="item">
        사용자 아이디: <%= user.getId() %>
    </div>
    <form action="findpw-form.jsp">
        <button type="submit" class="btn btn-primary">비밀번호 찾기</button>
    </form>
</div>
<%@include file="common/footer.jsp" %>
</body>
</html>
