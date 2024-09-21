<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.qna.QnaDao" %>
<%@ page import="com.jhta.afterpay.qna.Qna" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  int qnaNo = Utils.toInt(request.getParameter("no"));

  QnaDao qnaDao = new QnaDao();
  qnaDao.deleteQna(qnaNo);

  response.sendRedirect("user-qna.jsp");
%>