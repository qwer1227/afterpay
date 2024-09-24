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
<script src="js/changepw.js"></script>
<html>
<head>
    <title>비밀번호 변경</title>
</head>
<body>
<%@include file="common/nav.jsp" %>

<div class="alert-container">
    <%
        String message = null;
        if (request.getParameter("error") != null) {
            message = "비밀번호 변경 중 오류가 발생했습니다.";
    %>
    <div class="alert alert-danger">
        <%= message %>
    </div>
    <%
        }
    %>
</div>

<div class="container">
    <h2>비밀번호 변경</h2>
    <form method="post" action="changepw.jsp" onsubmit="return sendit(this.form)">
        <div class="mb-3">
            <label class="form-label">이전 비밀번호</label>
            <input class="form-control" type="password" name="prevpwd" id="prev_pw" placeholder="이전 비밀번호를 입력해주세요">
        </div>
        <div class="mb-3">
            <label class="form-label">새 비밀번호</label>
            <input class="form-control" type="password" name="pwd" id="user_pw" placeholder="새 비밀번호를 입력해주세요">
        </div>
        <div class="mb-3">
            <label class="form-label">비밀번호 확인</label>
            <input class="form-control" type="password" name="pwd2" id="user_pw_vali" placeholder="한 번 더 입력해주세요">
        </div>
        <div class="text-end">
            <button type="submit" class="btn btn-primary">변경하기</button>
        </div>
    </form>
</div>
<%@include file="common/footer.jsp" %>
</body>
</html>
