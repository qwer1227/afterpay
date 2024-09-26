<%@ page import="com.jhta.afterpay.product.WishDao" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String[] arr = request.getParameterValues("stockNo");
  
  WishDao wishDao = new WishDao();

  for (String value : arr){
      int wishNo = Integer.parseInt(value);

      wishDao.deleteWishByNo(wishNo);
  }

  response.sendRedirect("wish-list.jsp");
%>