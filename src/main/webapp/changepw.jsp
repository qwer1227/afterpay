<%@ page import="com.jhta.afterpay.user.UserDao" %>
<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page import="org.apache.commons.codec.digest.DigestUtils" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>

<%
    String prevPw = request.getParameter("prevpwd");
    String changePw = request.getParameter("pwd");

    String sha256prevpw = DigestUtils.sha256Hex(prevPw);
    String sha256chnagepw = DigestUtils.sha256Hex(changePw);

    UserDao userDao = new UserDao();
    User user = userDao.getUserByPrevPw(sha256prevpw);


    if (user == null) {
        response.sendRedirect("changepw-form.jsp?error");
        return;
    }

    if (user.getPwd().equals(sha256chnagepw)) {
        response.sendRedirect("changepw-form.jsp?error");
        return;
    }

    //비밀번호 업데이트
    String id = user.getId();
    String sha256Pwd = DigestUtils.sha256Hex(changePw);
    userDao.UpdatePwdToPrev(sha256Pwd, id);

    response.sendRedirect("../login-form.jsp");
%>
