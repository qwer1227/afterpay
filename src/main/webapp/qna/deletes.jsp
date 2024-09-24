<%@ page import="com.jhta.afterpay.qna.QnaDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String[] arr = request.getParameterValues("qnaNo");
  
  QnaDao qnaDao = new QnaDao();
  
  for (String value : arr) {
    int qnaNo = Integer.parseInt(value);
    qnaDao.deleteQna(qnaNo);
  }
  response.sendRedirect("user-qna.jsp");
%>