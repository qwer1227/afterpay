<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.addr.AddrDao" %>
<%@ page import="com.jhta.afterpay.addr.Addr" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  int addrNo = Utils.toInt(request.getParameter("addrNo"));

  AddrDao addrDao = new AddrDao();
  Addr addr = addrDao.getAddrByNo(addrNo);

  addr.setIsAddrHome("Y");
  addrDao.updateAddr(addr);

  response.sendRedirect("modify-address-form.jsp");
%>