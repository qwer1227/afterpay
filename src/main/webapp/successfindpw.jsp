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
    <a href="changepw-form.jsp">비밀번호 변경하기</a>
</div>
</body>
</html>
