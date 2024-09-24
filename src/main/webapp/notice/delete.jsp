<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
  if (session.getAttribute("USERNO") == null) {
    response.sendRedirect("/login-form.jsp");
    return;
  }
  int loginuUserNo = (Integer) session.getAttribute("USERNO");
  int no = Utils.toInt(request.getParameter(""));
%>