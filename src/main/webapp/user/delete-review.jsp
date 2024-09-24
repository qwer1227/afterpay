<%@ page import="com.jhta.afterpay.user.ReviewDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String[] arr = request.getParameterValues("reviewNo");

  ReviewDao reviewDao = new ReviewDao();

  for (String value : arr) {
    int reviewNo = Integer.parseInt(value);
    reviewDao.deleteReviewByReviewNo(reviewNo);
  }
  response.sendRedirect("review.jsp");
%>