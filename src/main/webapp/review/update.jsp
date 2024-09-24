<%@ page import="com.jhta.afterpay.product.Review" %>
<%@ page import="com.jhta.afterpay.product.ReviewDao" %>
<%@ page import="com.jhta.afterpay.product.User" %>
<%@ page import="com.jhta.afterpay.product.Product" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%--
    요청 파라미터 정보
    rno = 리뷰번호
    pno = 상품번호
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

    // 2. 세션 객체 정보, 요청 파라미터 정보를 가져온다.
    int userNo = (Integer) session.getAttribute("USERNO"); // 사용자번호
    int productNo = Integer.parseInt(request.getParameter("pno")); // 상품 번호
    int reviewNo = Integer.parseInt(request.getParameter("rno")); // 리뷰 번호
    String title = request.getParameter("title"); // 리뷰 제목
    int rating = Integer.parseInt(request.getParameter("rating")); // 리뷰 평점
    String content = request.getParameter("content"); // 리뷰 내용

    // 3. 리뷰 정보를 가져온다.
    ReviewDao reviewDao = new ReviewDao();
    Review review = reviewDao.getReviewByNo(reviewNo);

    // 4. 수정한 리뷰 정보를 리뷰 객체에 저장한다.
    review.setNo(reviewNo);
    review.setTitle(title);
    review.setRating(rating);
    review.setContent(content);

    User user = new User();
    user.setNo(userNo);
    review.setUser(user);

    Product product = new Product();
    product.setNo(productNo);
    review.setProduct(product);

    // 5. 리뷰 객체에 저장한 리뷰 정보를 리뷰 테이블에 저장한다.
    reviewDao.updateReview(review);

    // 6. 리뷰 수정 후, 상품 상세 페이지로 이동하는 URL을 재요청한다.
    response.sendRedirect("../product/detail.jsp?pno=" + productNo);
%>