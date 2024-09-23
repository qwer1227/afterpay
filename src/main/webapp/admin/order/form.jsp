<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Document</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../common/css/style.css"/>
</head>
<body>
<%@ include file="../../common/nav.jsp" %>

<div class="container">
    <form class="border bg-light p-3" method="post" action="insert.jsp">
        <div class="text-center">
            <h1>새 주문 등록</h1>
        </div>
        <%-- 상품 정보 --%>
        <div class="mb-3">
            <label class="form-label">상품 이름</label>
            <input type="text" class="form-control" name="name">
        </div>
        <div class="mb-3">
            <label class="form-label">상품 사이즈</label>
            <select class="form-select" name="productSize">
                <option value="S">S</option>
                <option value="M">M</option>
                <option value="L">L</option>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">상품 수량</label>
            <input type="text" class="form-control" name="amount">
        </div>
        <div class="mb-3">
            <label class="form-label">상품 수량</label>
            <input type="text" class="form-control" name="amount">
        </div>
        <div class="mb-3">
            <label class="form-label">상품 수량</label>
            <input type="text" class="form-control" name="amount">
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
            <label class="form-label">배송 상태</label>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="status" value="준비중">
                <label class="form-check-label">배송준비중</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="status" value="판매중">
                <label class="form-check-label">배송중</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="status" value="품절">
                <label class="form-check-label">배송완료</label>
            </div>
        </div>
        <div class="mb-3">
            <label class="form-label">배송 주소</label>
            <textarea class="form-control" rows="5" name="description"></textarea>
        </div>
        <div class="text-end">

            <a href="order.jsp" class="btn btn-secondary">취소</a>
            <button type="submit" class="btn btn-primary">등록</button>
        </div>
    </form>
</div>
</body>
</html>