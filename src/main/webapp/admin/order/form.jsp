<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>새 주문 등록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <form class="border bg-light p-3" method="post" action="insert.jsp">
        <div class="text-center">
            <h1>새 주문 등록</h1>
        </div>
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