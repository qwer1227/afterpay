<%@ page import="com.jhta.afterpay.user.UserDao" %>
<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
    String userID = (String) session.getAttribute("USERID");
    String type = "Y";

    UserDao userDao = new UserDao();
    userDao.DeletedByUserId(type,userID);


    response.sendRedirect("/logout.jsp");
%>