<%@ page import="com.jhta.afterpay.product.*" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%--
    요청 파라미터 정보
    pno = 상품 번호
--%>
<%
    // 1. 로그인하지 않은 경우, 로그인 폼으로 이동한다.
    if (session.getAttribute("USERID") == null) {
        response.sendRedirect("../login-form.jsp");
        return;
    }

    // 2. 요청 처리에 필요한 값을 구해오기
    int userNo = (Integer) session.getAttribute("USERNO"); // 사용자 번호
    int productNo = Integer.parseInt(request.getParameter("pno")); // 상품 번호

    // 3. 위시리스트에 동일한 상품이 존재하지 않다면, 위시리스트에 상품 담기
    //    위시리스트에 동일한 상품이 존재한다면, 위시리스트에 상품 담지 않기
    WishDao wishDao = new WishDao();
    if (wishDao.getWishByNo(productNo, userNo) == null) {
        // 위시리스트 객체에 사용자가 선택한 상품의 정보를 담기
        ProductDao productDao = new ProductDao();
        Product product = productDao.getProductByNo(productNo);
        User user = new User();
        user.setNo(userNo);

        Wish wish = new Wish();
        wish.setProduct(product);
        wish.setUser(user);

        // 상품의 정보를 위시리스트 데이터베이스에 저장하기
        wishDao.insertWish(wish);
    }

    // 4. 위시리스트에 상품 추가 후, 상품 상세 페이지로 이동하는 URL을 응답으로 보낸다.
    response.sendRedirect("../product/detail.jsp?pno=" + productNo);
%>