<%@ page import="com.jhta.afterpay.product.WishDao" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  int userNo = Utils.toInt(String.valueOf(session.getAttribute("USERNO")));
  
  String[] arr = request.getParameterValues("stockNo");
  WishDao wishDao = new WishDao();

  for (String value : arr){
      int stockNo = Integer.parseInt(value);

      wishDao.deleteWishByNo(stockNo, userNo);
  }

  response.sendRedirect("wish-list.jsp");
%>