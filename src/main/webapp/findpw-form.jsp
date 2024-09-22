<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2024-09-22
  Time: 오후 6:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form class="border bg-light p-3" method="post" action="findpw.jsp">
    <div class="mb-3">
        <label class="form-label">아이디</label>
        <input class="form-control" type="text" name="id" placeholder="아이디를 입력해주세요">
    </div>
    <div class="mb-3">
        <label class="form-label">이름</label>
        <input class="form-control" type="text" name="name" placeholder="이름을 입력해주세요">
    </div>
    <div class="mb-3">
        <label class="form-label">이메일</label>
        <input class="form-control" type="email" name="email" placeholder="이메일을 입력해주세요">
    </div>
    <div class="text-end">
        <button type="submit" class="btn btn-primary">비밀번호 찾기</button>
    </div>
</form>
</body>
</html>
