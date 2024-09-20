<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
    // 로그인하지 않은 경우, 로그인 폼으로 이동한다.
    if (session.getAttribute("USERID") == null) {
        response.sendRedirect("login-form.jsp");
        return;
    }

    // 장바구니에 상품 추가

    // 장바구니에 상품 추가 후, 상품 상세 페이지로 이동하는 URL을 응답으로 보낸다.
    response.sendRedirect("../product/detail.jsp");
%>