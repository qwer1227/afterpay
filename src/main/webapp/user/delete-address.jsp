<%@ page import="com.jhta.afterpay.addr.AddrDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String[] arr = request.getParameterValues("addrNo");
  
  AddrDao addrDao = new AddrDao();
  
  for (String value : arr) {
    int addrNo = Integer.parseInt(value);
    addrDao.deleteAddr(addrNo);
  }
  response.sendRedirect("modify-address-form.jsp");
%>