<%@ page import="com.jhta.afterpay.product.Product" %>
<%@ page import="com.jhta.afterpay.product.ProductDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.util.Pagination" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>상품관리페이지</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/common/css/style.css">
</head>
<body>
<%@ include file="../../common/nav.jsp" %>
<%
    if (userID == null || !userID.equals("ADMIN")) {
        response.sendRedirect("/login-form.jsp?deny");
        return;
    } else {
%>
<div class="container mb-5" style="margin-top: 100px;">
    <div class="row mb-3">
        <div class="col-9 offset-2">
            <h1 class="text-center">상품관리 페이지</h1>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col-2">
            <!-- 메뉴목록 -->
            <%@include file="../admin-nav.jsp" %>
        </div>
        <div class="col-10">
            <!--상품목록-->
            <%
                ProductDao productDao = new ProductDao();

                // 요청한 페이지 번호를 조회한다.
                int pageNo = Utils.toInt(request.getParameter("page"), 1);

                // 총 데이터 갯수를 조회한다.
                int totalRows = productDao.getAllTotalRows();

                // Pagination 객체를 생성한다.
                Pagination pagination = new Pagination(pageNo, totalRows);

                // 요청한 페이지에 맞는 데이터를 조회한다.
                List<Product> products = productDao.getAllProducts(pagination.getBegin(), pagination.getEnd());
            %>
            <table class="table">
                <thead>
                <tr>
                    <th>상품번호</th>
                    <th>상품카테고리</th>
                    <th>상품이름</th>
                    <th>상품등록일</th>
                    <th>상품상태</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (Product product : products) {
                %>
                <tr>
                    <td><%=product.getNo() %>
                    </td>
                    <td><%=product.getCategory().getName() %>
                    </td>
                    <td><a href="detail.jsp?no=<%=product.getNo() %>"><%=product.getName() %>
                    </a></td>
                    <td><%=product.getCreatedDate() %>
                    </td>
                    <td><%=product.getStatus()%>
                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <!--페이지네이션 -->
            <%
                if (pagination.getTotalPages() > 0) {
            %>
            <div>
                <ul class="pagination justify-content-center">
                    <li class="page-item <%=pagination.isFirst() ? "disabled" : "" %>">
                        <a class="page-link" href="product.jsp?page=<%pagination.getPrev(); %>">이전</a>
                    </li>
                    <%
                        for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
                    %>
                    <li class="page-item <%=pageNo == num? "active" : "" %>">
                        <a href="product.jsp?page=<%=num %>" class="page-link"><%=num %>
                        </a>
                    </li>
                    <%
                        }
                    %>
                    <li class="page-item <%=pagination.isLast() ? "disabled" : ""%>">
                        <a class="page-link" href="product.jsp?page=<%=pagination.getNext() %>">다음</a>
                    </li>
                </ul>
            </div>
            <%
                }
            %>
            <!--버튼-->
            <div class="text-end my-2">
                <a href="form.jsp" class="btn btn-success">상품등록</a>
            </div>
        </div>
    </div>
</div>
<%
    }
%>
<%@ include file="../../common/footer.jsp" %>
</body>
</html>
