<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String message=null;
        if (request.getParameter("invaild") != null) {
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

    <form class="border bg-light p-3" method="post" action="login.jsp">
    <div class="mb-3">
        <label class="form-label">아이디</label>
        <input class="form-control" type="text" name="id" placeholder="아이디를 입력해주세요">
    </div>
    <div class="mb-3">
        <label class="form-label">비밀번호</label>
        <input class="form-control" type="password" name="pwd" placeholder="비밀번호를 입력해주세요">
    </div>
    <div class="text-end">
        <button type="submit" class="btn btn-primary">로그인</button>
    </div>
    </form>
    <form action="findid-form.jsp">
        <button type="submit" class="btn btn-primary">아이디찾기</button>
    </form>
</body>
</html>
