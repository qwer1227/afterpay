<%@ page import="com.jhta.afterpay.user.UserDao" %>
<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
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

<div class="container">
    <div class="item">
        사용자 아이디: <%= user.getId() %>
    </div>
    <form action="findpw-form.jsp">
        <button type="submit" class="btn btn-primary">비밀번호 찾기</button>
    </form>
</div>
