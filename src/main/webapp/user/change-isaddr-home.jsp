<%@ page import="com.jhta.afterpay.addr.Addr" %>
<%@ page import="com.jhta.afterpay.addr.AddrDao" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>

<%
    String addrNo = request.getParameter("addrNo");

    AddrDao addrDao = new AddrDao();

    Addr addr = addrDao.getAddrByNo(Utils.toInt(addrNo));

    addrDao.updateNewDefaultAddr(addr);

    response.sendRedirect("modify-address-form.jsp");

%>
