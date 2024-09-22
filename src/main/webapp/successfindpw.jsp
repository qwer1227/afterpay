<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String email = request.getParameter("email");
%>
<div>
    <p>입력하신<%=email%>로 임시비밀번호가 전송되었습니다</p>
</div>
</body>
</html>
