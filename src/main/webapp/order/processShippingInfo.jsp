<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-09-11
  Time: 오후 3:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLEncoder" %>
<%
  request.setCharacterEncoding("UTF-8");

  Cookie address = new Cookie("address", URLEncoder.encode(request.getParameter("address")));

  address.setMaxAge(24 * 60 * 60);

  response.addCookie(address);

  response.sendRedirect("orderConfirmation.jsp");
%>
