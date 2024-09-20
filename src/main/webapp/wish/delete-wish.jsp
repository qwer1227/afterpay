<%@ page import="com.jhta.afterpay.product.WishDao" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%--
  요청 파라미터 정보
   wishNo = 위시리스트 상품 번호
--%>
<%
  // 1. 로그인하지 않은 경우, 로그인 폼으로 이동한다.
//  if (session.getAttribute("USERID") == null) {
//    response.sendRedirect("login-form.jsp");
//    return;
//  }

  // 2. 요청 처리에 필요한 값을 구해오기
  int wishNo = Integer.parseInt(request.getParameter("wishNo"));
  // int userNo = (Integer) session.getAttribute("USERNO");
  int userNo = 8;

  // 3. 위시리스트의 상품 삭제하기
//  WishDao wishDao = new WishDao();
//  wishDao.deleteWishByNo(wishNo);

  // 4. 위시리스트 상품 삭제 후, 위시리스트 목록으로 이동하는 URL을 요청한다.
    response.sendRedirect("wish.jsp?userNo=" + userNo);
%>