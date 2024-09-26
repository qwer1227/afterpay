<%@ page import="com.jhta.afterpay.product.ReviewDao" %>
<%@ page import="com.jhta.afterpay.product.Review" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>AFTER PAY</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/common/css/style.css">
</head>
<body class="d-flex flex-column min-vh-100 ">
<%--
    요청 파라미터 정보
    rno = 리뷰 번호
--%>
<%
    String menu = "홈";
%>
<%@ include file="../common/nav.jsp" %>
<%
    // 1. 로그인하지 않은 경우, 로그인 폼으로 이동한다.
    if (session.getAttribute("USERID") == null) {
        response.sendRedirect("../login-form.jsp");
        return;
    }

    // 2. 요청 파라미터 정보 가져오기
    int reviewNo = Integer.parseInt(request.getParameter("rno")); // 리뷰 번호

    // 3. 작성했던 리뷰 정보 가져오기
    ReviewDao reviewDao = new ReviewDao();
    Review review = reviewDao.getReviewByNo(reviewNo);
%>
<div class="container" style="margin-top: 100px;">
    <h3>리뷰 수정</h3>
    <form class="border bg-light p-3" method="post" action="update.jsp?pno=<%=review.getProduct().getNo() %>&rno=<%=reviewNo %>">
        <div class="mb-3">
            <label class="form-label">제목</label>
            <input type="text" class="form-control" name="title" value="<%=review.getTitle() %>" />
        </div>
        <div class="mb-3">
            <label class="form-label">평점</label>
            <div>
                <%
                    for (int num = 1; num <= 5; num++) {
                %>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="rating" value="<%=num %>"
                            <%=review.getRating() == num ? "checked" : "" %>/>
                    <label class="form-check-label"><%=num %></label>
                </div>
                <%
                    }
                %>
            </div>
        </div>
        <div class="mb-3">
            <label class="form-label">내용</label>
            <textarea rows="5" class="form-control" name="content"><%=review.getContent() %></textarea>
        </div>
        <div class="text-end">
            <a href="../product/detail.jsp?pno=<%=review.getProduct().getNo() %>" class="btn btn-secondary">취소</a>
            <button type="submit" class="btn btn-primary">수정</button>
        </div>
    </form>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>