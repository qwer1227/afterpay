<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.user.ReviewDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  int reviewNo = Utils.toInt(request.getParameter("no"));

  ReviewDao reviewDao = new ReviewDao();
  reviewDao.deleteReviewByReviewNo(reviewNo);

  response.sendRedirect("review.jsp");
%>