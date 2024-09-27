<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.qna.QnaDao" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
  int qnaNo = Utils.toInt(request.getParameter("no"));

  QnaDao qnaDao = new QnaDao();
  qnaDao.deleteQna(qnaNo);

  response.sendRedirect("user-qna.jsp");
%>