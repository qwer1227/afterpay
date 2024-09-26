<%@ page import="com.jhta.afterpay.product.Review" %>
<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page import="com.jhta.afterpay.product.Product" %>
<%@ page import="com.jhta.afterpay.product.ReviewDao" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%--
    요청 파라미터 정보
    pno = 상품 번호
    title = 리뷰제목
    rating = 리뷰평점
    content = 리뷰내용
--%>
<%
    // 1. 로그인하지 않은 경우, 로그인 폼으로 이동한다.
    if (session.getAttribute("USERID") == null) {
        response.sendRedirect("../login-form.jsp");
        return;
    }

    // 2. 요청 처리에 필요한 값을 구해오기
    int userNo = (Integer) session.getAttribute("USERNO");
    int productNo = Integer.parseInt(request.getParameter("pno"));
    String title = request.getParameter("title");
    int rating = Integer.parseInt(request.getParameter("rating"));
    String content = request.getParameter("content");

    // 3. 작성한 리뷰 정보를 리뷰 객체에 저장한다.
    Review review = new Review();
    review.setTitle(title);
    review.setRating(rating);
    review.setContent(content);

    User user = new User();
    user.setNo(userNo);
    review.setUser(user);

    Product product = new Product();
    product.setNo(productNo);
    review.setProduct(product);

    // 4. 객체에 저장한 리뷰 정보를 리뷰 테이블에 저장한다.
    ReviewDao reviewDao = new ReviewDao();
    reviewDao.insertReview(review);

    // 5. 리뷰 등록 후, 상품 상세 페이지로 이동하는 URL을 재요청한다.
    response.sendRedirect("../product/detail.jsp?pno=" + productNo);
%>