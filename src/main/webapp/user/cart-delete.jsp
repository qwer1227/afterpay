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
    String[] cartNo = request.getParameterValues("cartNo");
    int[] cartNoArr = new int[cartNo.length];
    for (int i = 0; i < cartNoArr.length; i++) {
        cartNoArr[i] = Utils.toInt(cartNo[i]);
        cartDao.deleteCartByNo(cartNoArr[i]);
    }

    response.sendRedirect("cart.jsp");
%>
