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
  Cookie detailAddress = new Cookie("detailAddress", URLEncoder.encode(request.getParameter("detailAddress")));
  Cookie tel = new Cookie("tel", URLEncoder.encode(request.getParameter("tel")));
  Cookie zipcode = new Cookie("zipcode", URLEncoder.encode(request.getParameter("zipcode")));


  address.setMaxAge(24 * 60 * 60);
  detailAddress.setMaxAge(24 * 60 * 60);
  tel.setMaxAge(24 * 60 * 60);
  zipcode.setMaxAge(24 * 60 * 60);

  response.addCookie(address);
  response.addCookie(detailAddress);
  response.addCookie(tel);
  response.addCookie(zipcode);

  response.sendRedirect("orderConfirmation.jsp");
%>
