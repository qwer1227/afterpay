<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page import="com.jhta.afterpay.user.UserDao" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
    // 1. 요청 파라미터 정보 조회하기
    int no = Utils.toInt(request.getParameter("no"));
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String pwd = request.getParameter("pwd");
    String email = request.getParameter("email");
    String tel = request.getParameter("tel");
    String gradeId = request.getParameter("gradeId");
    String isBanned = request.getParameter("isBanned");
    String isSignOut = request.getParameter("isSignOut");

    // 2. User 객체를 생성해서 요청파라미터 정보를 저장한다.
    User user = new User();
    user.setNo(no);
    user.setId(id);
    user.setName(name);
    user.setPwd(pwd);
    user.setEmail(email);
    user.setTel(tel);
    user.setGradeId(gradeId);
    user.setIsBanned(isBanned);
    user.setIsSignOut(isSignOut);

    // 3. UserDao 객체를 생성하고, updateUser() 메소드를 실행한다.
    UserDao userDao = new UserDao();
    userDao.updateUser(user);

    // 4. 재요청 URL을 응답으로 보낸다.
    response.sendRedirect("user.jsp?no=" + no);
%>