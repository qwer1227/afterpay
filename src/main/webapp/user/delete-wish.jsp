<%@ page import="com.jhta.afterpay.product.WishDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String[] arr = request.getParameterValues("wishNo");
  int userNo = 19;

  WishDao wishDao = new WishDao();

  for (String value : arr){
      int wishNo = Integer.parseInt(value);

      wishDao.deleteWishByNo(wishNo, userNo);
  }

  response.sendRedirect("wish-list.jsp");
%>