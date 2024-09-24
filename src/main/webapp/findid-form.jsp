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
<script src="js/findid.js"></script>
<html>
<head>
    <title>아이디 찾기</title>

</head>
<body>
<%@include file="common/nav.jsp" %>
<%
    String message = null;
    if (request.getParameter("error") != null) {
        message = "해당하는 정보가 존재하지 않습니다.";
%>
<div class="alert-container ">
<div class="alert alert-danger">
    <%= message%>
</div>

<%
    }
%>
</div>
<div class="container">
    <h2>아이디 찾기</h2>
    <form method="post" action="findid.jsp" onsubmit="return sendit(this.form)">
        <div class="mb-3">
            <label class="form-label">이름</label>
            <input class="form-control" type="text" name="name" id="user_name" placeholder="이름을 입력해주세요">
        </div>
        <div class="mb-3">
            <label class="form-label">이메일</label>
            <input class="form-control" type="email" name="email" id="user_email" placeholder="이메일을 입력해주세요">
        </div>
        <div class="text-end">
            <button type="submit" class="btn btn-primary">아이디 찾기</button>
        </div>
    </form>
</div>
<%@include file="common/footer.jsp" %>
</body>
</html>
