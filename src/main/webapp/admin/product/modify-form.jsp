<%@ page import="com.jhta.afterpay.product.ProductDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.product.Product" %>
<%@ page import="com.jhta.afterpay.product.CategoryDao" %>
<%@ page import="com.jhta.afterpay.product.Category" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <title>상품 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <%
        ProductDao productDao = new ProductDao();
        CategoryDao categoryDao = new CategoryDao();

        List<Category> categories = categoryDao.getAllCategories();

        int productNo = Utils.toInt(request.getParameter("no"));

        Product product = productDao.getAllProductByNo(productNo);

    %>
    <form class="border bg-light p-3" method="post" action="update.jsp?no=<%=productNo%>">
        <div class="text-center">
            <h1>상품 수정</h1>
        </div>
        <div class="mb-3">
            <label class="form-label">상품 카테고리</label>
            <select class="form-select" name="catNo">
                <option>상품 카테고리를 선택하세요</option>
                <%
                    for (Category cat : categories) {
                %>
                <option value="<%=cat.getNo()%>" <%=product.hasCategory(cat.getNo()) ? "selected" : ""%>><%=cat.getName()%>
                </option>
                <%
                    }
                %>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">상품 이름</label>
            <input type="text" class="form-control" name="name" value="<%=product.getName()%>">
        </div>
        <div class="mb-3">
            <label class="form-label">상품 가격</label>
            <input type="text" class="form-control" name="price" value="<%=product.getPrice()%>">
        </div>
        <div class="mb-3">
            <label class="form-label">상품 상태</label>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="status"
                       value="준비중"  <%=product.hasStatus("준비중") ? "checked" : ""%>>
                <label class="form-check-label">준비중</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="status"
                       value="판매중"  <%=product.hasStatus("판매중") ? "checked" : ""%>>
                <label class="form-check-label">판매중</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="status"
                       value="품절"  <%=product.hasStatus("품절") ? "checked" : ""%>>
                <label class="form-check-label">품절</label>
            </div>
        </div>
        <div class="mb-3">
            <label class="form-label">상품 설명</label>
            <textarea class="form-control" rows="5" name="description"><%=product.getHtmlContent()%></textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">상품 사진</label>
            <input type="file" class="form-control" name="photofile">
        </div>
        <div class="text-end">
            <a href="product.jsp" class="btn btn-secondary">취소</a>
            <button type="submit" class="btn btn-primary">등록</button>
        </div>
    </form>
</div>
</body>
</html>
