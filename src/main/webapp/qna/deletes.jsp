<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.qna.QnaDao" %>
<%@ page import="com.jhta.afterpay.qna.Qna" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String[] arr = request.getParameterValues("qnaNo");

  QnaDao qnaDao = new QnaDao();

  for (String value : arr) {
    int qnaNo = Integer.parseInt(value);
    Qna qna = qnaDao.getQnaByQnaNo(qnaNo);
    qna.setIsQnaDeleted("Y");
    qnaDao.updateQna(qna);
  }
  response.sendRedirect("user-qna.jsp");
%>