<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="js/findpw.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<%
    String message = null;
    if (request.getParameter("error") != null) {
        message = "일치하는 정보가 없습니다";
%>
<div class="alert alert-danger">
    <%=message%>
</div>
<%
    }
%>
<body>
<form class="border bg-light p-3" method="post" action="findpw.jsp" onsubmit="return sendit(this.form)">
    <div class="mb-3">
        <label class="form-label">아이디</label>
        <input class="form-control" type="text" name="id" id="user_id" placeholder="아이디를 입력해주세요">
    </div>
    <div class="mb-3">
        <label class="form-label">이름</label>
        <input class="form-control" type="text" name="name" id="user_name" placeholder="이름을 입력해주세요">
    </div>
    <div class="mb-3">
        <label class="form-label">이메일</label>
        <input class="form-control" type="email" name="email" id="user_email" placeholder="이메일을 입력해주세요">
    </div>
    <div class="text-end">
        <button type="submit" class="btn btn-primary">비밀번호 찾기</button>
    </div>
</form>
</body>
</html>
