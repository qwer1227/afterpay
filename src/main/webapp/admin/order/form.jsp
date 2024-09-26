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
<body>
<%@ include file="../../common/nav.jsp" %>
<div class="container mb-5" style="margin-top: 100px;">
    <div class="rom mb-3">
        <div class="col-10 offset-1">
            <h2 class="text-center"><strong>주문정보 등록</strong></h2>
        </div>
    </div>

    <div class="row mb-3">
        <div class="col-2">
            <%@include file="../admin-nav.jsp" %>
        </div>
        <div class="col-10">
            <form class="p-3" method="post" action="insert.jsp">

                <%--주문 회원 정보--%>
                <h3 class="mb-3">주문정보</h3>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">주문자명</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="userName">
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">주문자아이디</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="userId">
                    </div>
                </div>
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">주문상태</label>
                        <div class="col-sm-10">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="Status" value="입금전">
                                <label class="form-check-label">입금전</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="Status" value="주문확인">
                                <label class="form-check-label">주문확인</label>
                            </div>
                        </div>
                    </div>

                <%--주문 상품 정보--%>
                <h3 class="mb-3">상품정보</h3>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">상품번호</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="productNo">
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">사이즈</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="size">
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">수량</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="amount">
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">상품금액</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="productPrice">
                    </div>
                </div>

                <%--상품 결제 정보--%>
                <h3 class="mb-3">결제정보</h3>
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">총 주문금액</label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" name="totalPrice" value="totalPrice">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">배송비</label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" name="deliveryPrice" value="3000">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">총 결제금액</label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" name="paymentPrice" value="totalPrice + 3000">
                        </div>
                    </div>

                <%--상품 배송 정보--%>
                <h3 class="mb-3">배송정보</h3>
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">수령인</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="recipient">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">휴대전화</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="tel">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">우편번호</label>
                        <div class="col-sm-3">
                            <input type="text" id="sample6_postcode" name="zipcode" placeholder="우편번호"
                                   class="form-control">
                            <input type="button" class="btn btn-primary" onclick="sample6_execDaumPostcode()" value="검색"
                                   class="col-2"></button>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">주소</label>
                        <div class="col-sm-10">
                            <input type="text" id="sample6_address" name="address"
                                   placeholder="주소" class="form-control" required>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">주소</label>
                        <div class="col-sm-10">
                            <input type="text" id="sample6_detailAddress" name="detailAddress"
                                   placeholder="상세주소" class="form-control">
                            <input type="hidden" id="sample6_extraAddress" name="extraAdd" placeholder="참고항목" class="form-control">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">배송메세지</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="deliveryMessage">
                        </div>
                    </div>

                <!--버튼-->
                <div class="text-end">
                    <a href="order.jsp" class="btn btn-secondary">등록취소</a>
                    <button type="submit" class="btn btn-primary">등록완료</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="../../common/footer.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="post.js"></script>
</body>
</html>