<%@ page import="com.jhta.afterpay.qna.QnaDao" %>
<%@ page import="com.jhta.afterpay.qna.Qna" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  int qnaNo = Utils.toInt(request.getParameter("no"));
  String description = request.getParameter("description");

  QnaDao qnaDao = new QnaDao();
  Qna qna = qnaDao.getQnaByQnaNo(qnaNo);

  qna.setContent(description);
  qna.setIsQnaDeleted("N");
  qnaDao.updateQna(qna);

  response.sendRedirect("user-qna.jsp");
%>