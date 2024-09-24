<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.user.ReviewDao" %>
<%@ page import="com.jhta.afterpay.user.Review" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String[] arr = request.getParameterValues("reviewNo");
  
  ReviewDao reviewDao = new ReviewDao();
  
  for (String value : arr){
    int reviewNo = Integer.parseInt(value);
    reviewDao.deleteReview(reviewNo);
  }
  response.sendRedirect("review.jsp");
%>