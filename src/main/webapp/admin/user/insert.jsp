<%@ page import="com.jhta.afterpay.user.UserDao" %>
<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>

<%
    //요청 파라미터 값 조회
    int userNo = Utils.toInt(request.getParameter("no"));
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String pwd = request.getParameter("pwd");
    String email = request.getParameter("email");
    String tel = request.getParameter("tel");


    //중복 아이디 생성 방지
    UserDao userDao = new UserDao();
    User savedUser = userDao.getUserById(id);

    if (savedUser != null) {
        response.sendRedirect("form.jsp?error");
        return;
    }

    //요청 파라미터 값 조회
    User user = new User();
    user.setId(id);
    user.setName(name);
    user.setPwd(pwd);
    user.setEmail(email);
    user.setTel(tel);

    //요청 파라미터 값 객체에 저장
    userDao.InsertUser(user);

    // 회원 목록 조회 페이지 재요청
    response.sendRedirect("user.jsp");
%>
