<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.user.UserDao" %>
<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>

<%
    String userID = (String) session.getAttribute("USERID");
    if (userID == null || !userID.equals("ADMIN")) {
        response.sendRedirect("/login-form.jsp?deny");
        return;
    }

    // 요청 값 받기
    int userNo = Utils.toInt(request.getParameter("no"));

    //조회하기
    UserDao userDao = new UserDao();
    User user = userDao.getAllUserByNo(userNo);

    //삭제여부를 Y로 변경하기
    user.setIsSignOut("Y");
    userDao.updateAllUser(user);

    // 재요청 URL을 응답으로 보내기
    response.sendRedirect("user.jsp");


%>