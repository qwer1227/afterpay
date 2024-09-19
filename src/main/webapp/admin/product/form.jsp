<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <title>새 상품 등록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <form class="border bg-light p-3" method="post" action="insert.jsp">
            <div class="text-center">
                <h1>새 상품등록</h1>
            </div>
            <div class="mb-3">
                <label class="form-label">상품 카테고리</label>
                <select class="form-select" name="catNo">
                    <option>상품 카테고리를 선택하세요</option>
                    <option value="11">남성 상의</option>
                    <option value="12">남성 하의</option>
                    <option value="13">남성 신발</option>
                    <option value="14">남성 가방</option>
                    <option value="21">여성 상의</option>
                    <option value="22">여성 하의</option>
                    <option value="23">여성 신발</option>
                    <option value="24">여성 가방</option>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">상품 이름</label>
                <input type="text" class="form-control" name="name">
            </div>
            <div class="mb-3">
                <label class="form-label">상품 가격</label>
                <input type="text" class="form-control" name="price">
            </div>
            <!--상품 사이즈-->
            <div class="mb-3">
                <label class="form-label">S 사이즈 수량</label>
                <input type="hidden" name="smallSize" value="S">
                <input type="text" class="form-control" name="smallAmount">
            </div>
            <div class="mb-3">
                <label class="form-label">M 사이즈 수량</label>
                <input type="hidden" name="mediumSize" value="M">
                <input type="text" class="form-control" name="mediumAmount">
            </div>
            <div class="mb-3">
                <label class="form-label">L 사이즈 수량</label>
                <input type="hidden" name="largeSize" value="L">
                <input type="text" class="form-control" name="largeAmount">
            </div>
            <div class="mb-3">
                <label class="form-label">상품 상태</label>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="status" value="준비중">
                    <label class="form-check-label">준비중</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="status" value="판매중">
                    <label class="form-check-label">판매중</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="status" value="품절">
                    <label class="form-check-label">품절</label>
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">상품 설명</label>
                <textarea class="form-control" rows="5" name="description"></textarea>
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
