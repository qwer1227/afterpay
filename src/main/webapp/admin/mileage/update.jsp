<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page import="com.jhta.afterpay.user.UserDao" %>
<%@ page import="com.jhta.afterpay.user.PointHistory" %>
<%@ page import="com.jhta.afterpay.user.PointHistoryDao" %>

<%
    // 요청 파라미터 값을 조회
    int userNo = Utils.toInt(request.getParameter("userNo"));
    int point = Utils.toInt(request.getParameter("point"));

    UserDao userDao = new UserDao();
    User user = userDao.getUserByNo(userNo);

    user.setTotalPoint(user.getTotalPoint() + point);
    user.setPoint(user.getPoint() + point);

    userDao.updateUser(user);

    response.sendRedirect("detail.jsp?no=" + userNo);
%>