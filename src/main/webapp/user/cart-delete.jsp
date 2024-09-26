<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.user.CartDao" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
    String USERID = String.valueOf(session.getAttribute("USERID"));
    int userNo = Utils.toInt(String.valueOf(session.getAttribute("USERNO")));
    if (USERID == null) {
        response.sendRedirect("../login-form.jsp?deny");
        return;
    }

    CartDao cartDao = new CartDao();
    int cartNo = Utils.toInt(request.getParameter("cartNo"));


%>
