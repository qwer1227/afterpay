<%@ page import="com.jhta.afterpay.user.UserDao" %>
<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");

    UserDao userDao = new UserDao();
    User user = null; // User 객체 초기화

    String message = null;

    // 입력 값 체크
    if(name == null || name.isEmpty()){
        message = "이름을 입력해 주세요.";
    } else if(email == null || email.isEmpty()){
        message = "이메일을 입력해 주세요.";
    } else {
        // 사용자 조회
        user = userDao.getUserIdByEmailAndName(email, name);

        if(user == null) {
            message = "해당하는 사용자 정보를 찾을 수 없습니다.";
        }
    }
%>

<%
    if(message != null){
%>
<div class="alert alert-danger">
    <%=message%>
</div>
<%
} else if(user != null) {
%>
<div class="container">
    <div class="item">
        사용자 아이디: <%= user.getId() %>
    </div>
    <form action="findpw-form.jsp">
        <button type="submit" class="btn btn-primary">비밀번호 찾기</button>
    </form>
</div>
<%
    }
%>