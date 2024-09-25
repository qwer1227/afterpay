<%@ page import="com.jhta.afterpay.qna.QnaDao" %>
<%@ page import="com.jhta.afterpay.qna.Qna" %>
<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  int userNo = Utils.toInt(String.valueOf(session.getAttribute("USERNO")));
  String title = request.getParameter("title");
  String description = request.getParameter("description");

  Qna qna =new Qna();
  qna.setTitle(title);
  qna.setContent(description);
  User user = new User();
  user.setNo(userNo);
  qna.setUser(user);

  QnaDao qnaDao = new QnaDao();
  qnaDao.insertQna(qna);

  response.sendRedirect("user-qna.jsp");
%>