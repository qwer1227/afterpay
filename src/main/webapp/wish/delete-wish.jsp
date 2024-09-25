<%@ page import="com.jhta.afterpay.product.WishDao" %>
<%@ page import="com.jhta.afterpay.product.Wish" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%--
    요청 파라미터 정보
    wno = 위시 번호
    pno = 상품 번호
--%>
<%
    // 1. 로그인하지 않은 경우, 로그인 폼으로 이동한다.
    if (session.getAttribute("USERID") == null) {
        response.sendRedirect("../login-form.jsp");
        return;
    }

    // 2. 요청 처리에 필요한 값을 구해오기
    int wishNo = Integer.parseInt(request.getParameter("wno")); // 위시리스트 번호
    int productNo = Integer.parseInt(request.getParameter("pno")); // 상품 번호
    int userNo = (Integer) session.getAttribute("USERNO"); // 사용자 번호

    // 3. 위시리스트 상품을 삭제하는 자와 로그인한 자가 동일한지 확인한다.
    WishDao wishDao = new WishDao();
    Wish wish = wishDao.getWishByNo(productNo, userNo);

    if (wish == null) {
        response.sendRedirect("../product/detail.jsp?pno=" + productNo + "&error");
        return;
    }

    // 4. 위시리스트의 상품 삭제하기
    wishDao.deleteWishByNo(wishNo);

    // 5. 위시리스트 상품 삭제 후, 위시리스트 목록으로 이동하는 URL을 요청한다.
    response.sendRedirect("list.jsp");
%>