<%@ page import="com.jhta.afterpay.product.ReviewDao" %>
<%@ page import="com.jhta.afterpay.product.Review" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%--
    요청 파라미터 정보
    rno = 리뷰 번호
--%>
<%
    // 1. 로그인하지 않은 경우, 로그인 폼으로 이동한다.
    if (session.getAttribute("USERID") == null) {
        response.sendRedirect("../login-form.jsp");
        return;
    }

    // 2. 요청 파라미터 정보, 세션 객체 정보를 가져온다.
    int reviewNo = Integer.parseInt(request.getParameter("rno")); // 리뷰 번호
    int loginedUserNo = (Integer) session.getAttribute("USERNO"); // 사용자 번호

    // 3. 삭제하려는 리뷰 정보를 가져온다.
    ReviewDao reviewDao = new ReviewDao();
    Review review = reviewDao.getReviewByNo(reviewNo);

    // 4. 로그인한 사용자와 리뷰를 작성한 자가 동일한지 확인한다.
    if (loginedUserNo != review.getUser().getNo()) {
        response.sendRedirect("../product/detail.jsp?pno=" + review.getProduct().getNo() + "&error");
        return;
    }

    // 5. 리뷰 삭제 여부를 'Y'로 변경한다.
    review.setIsDeleted("Y");
    reviewDao.updateReview(review);

    // 6. 리뷰 삭제 여부 변경 후, 상세 페이지로 이동하는 URL을 재요청한다.
    response.sendRedirect("../product/detail.jsp?pno=" + review.getProduct().getNo());
%>