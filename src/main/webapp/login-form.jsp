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
<link href="/common/css/user.css" rel="stylesheet">
<script src="js/login.js"></script>
<html>
<head>
    <title>로그인</title>
    <style>
        .wrap_find {
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
            font-size: 0.9rem; /* 작은 폰트 크기 */
            text-align: center; /* 중앙 정렬 */
        }

        .join {
            margin-top: 20px;
            text-align: center; /* 중앙 정렬 */
        }

    </style>
</head>
<body>
<%@include file="common/nav.jsp" %>
<div class="alert-container">
<%
    String message = null;
    if (request.getParameter("invalid") != null) {
        message = "아이디 혹은 비밀번호가 올바르지 않습니다.";
    }

    if (request.getParameter("disabled") != null) {
        message = "사용이 정지된 사용자는 로그인할 수 없습니다.";
    }

    if (request.getParameter("deny") != null) {
        message = "로그인이 필요한 서비스입니다";
    }
%>

<%
    if (message != null) {
%>
<div class="alert alert-danger">
    <%= message %>
</div>
<%
    }
%>
</div>
<div class="container">
    <h2>로그인</h2>
    <form method="post" action="login.jsp" onsubmit="return sendit(this.form)">
        <div class="mb-3">
            <label class="form-label">아이디</label>
            <input class="form-control" type="text" name="id" id="user_id" placeholder="아이디를 입력해주세요">
        </div>
        <div class="mb-3">
            <label class="form-label">비밀번호</label>
            <input class="form-control" type="password" name="pwd" id="user_pw" placeholder="비밀번호를 입력해주세요">
        </div>
        <button type="submit" class="btn btn-primary">로그인</button>
        <div class="wrap_find">
            <a href="findid-form.jsp">아이디 찾기</a>
            <a href="findpw-form.jsp">비밀번호 찾기</a>
        </div>
        <div class="join">
            <a href="form.jsp" class="btn btn-primary">회원가입</a>
        </div>
    </form>
</div>
<%@include file="common/footer.jsp" %>
</body>
</html>
