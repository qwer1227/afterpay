<%@ page import="com.jhta.afterpay.product.Product" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="order.css" />
    <link rel="stylesheet" href="../common/css/style.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Document</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="../common/nav.jsp"%>
<%
    Product product = new Product();
    product.setPrice(100000);
    product.setNo(10000);
%>
<div id="main" class="container-sm d-flex justify-content-center border border-5">
    <div class="content-wrap">
        <div class="rows text-center mb-5">
            <h3>주문 결제</h3>
        </div>
        <div id="product" class="row mb-5">
            <img src="sample.jpg" class="rounded float-start">
            <div class="col-6">
                <p>워시드 콰트로 카고 팬츠 네이비</p>
                <p>[옵션: S]</p>
            </div>
            <div class="col-3">
                가격
            </div>
        </div>
        <form action="order.jsp" method="post">
            <input type="hidden" name="products" value="">
            <div id="delivery" class="rows border-bottom border-top border-2">
                <h4>배송 정보</h4>
                <ul>
                    <li><label>이름</label><input type="text" name="userName" class="form-control"/></li>
                    <li><input type="button" id="addrListBtn" value="배송지 고르기"></li>
                    <li>
                        <div class="col-12 input-group mt-2">
                            <input type="hidden" name="addrNo" value="" disabled>
                            <label>우편번호</label><input type="text" id="sample6_postcode" name="zipcode" placeholder="우편번호" class="form-control">
                            <input type="button" id="addrBtn" onclick="sample6_execDaumPostcode()" value="검색" class="col-2"></button>
                        </div>
                    </li>
                    <li><label>주소</label><input type="text" id="sample6_address" name="address" placeholder="주소" class="form-control" required><br></li>
                    <li><label>상세주소</label> <input type="text" id="sample6_detailAddress" name="detailAddress" placeholder="상세주소" class="form-control"></li>
                    <li><label>참고항목</label><input type="text" id="sample6_extraAddress" name="cham" placeholder="참고항목" class="form-control"></li>
                    <li><label>휴대폰번호</label><input type="text" class="form-control" name="tel" required/></li>
                    <li><%--@declare id="email"--%><label for="email">이메일주소</label><input type="email" name="email" class="form-control"/></li>
                    <li><label>배송메세지</label><input type="text" name="message" class="form-control"/></li>
                    <li><label>수령인</label><input type="text" name="recipient" class="form-control"/></li>
                </ul>
            </div>
            <div id="price" class="rows border-bottom border-2">
                <h4>결제 정보</h4>
                <ul>
                    <li ><label class="col-8">합계 금액</label><input type="text" name="totalPrice" value="<%=product.getPrice() %>" disabled></li>
                    <li><label class="col-8">할인 금액</label><input type="text" name="discountPrice" value="<%=product.getPrice() %>" disabled></li>
                    <li><label class="col-8">배송비</label><input type="text" name="deliveryPrice" value="<%=product.getPrice() %>" disabled></li>
                    <li><label class="col-8"><strong>결제 금액</strong></label><strong><input type="text" name="paymentPrice" value="<%=product.getPrice() %>" disabled</strong></li>
                </ul>
            </div>
            <div id="payment" class="rows">
                <h4>결제 방법</h4>
                <div class="form-check form-check-inline">
                    <%--@declare id="inlinecheckbox1"--%><input class="form-check-input" type="checkbox" name="pay" id="credit" value="option1" onclick="oneCheckbox(this)">
                    <label class="form-check-label" for="inlineCheckbox1">신용카드</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="cash" name="pay" value="option2" onclick="oneCheckbox(this)">
                    <label class="form-check-label" for="inlineCheckbox2">가상계좌</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="bank" name="pay" value="option3" onclick="oneCheckbox(this)">
                    <label class="form-check-label" for="inlineCheckbox2">계좌이체</label>
                </div>
                <div class="form-check form-check-inline">
                    <%--@declare id="inlinecheckbox2"--%><input class="form-check-input" type="checkbox" id="phone" name="pay" value="option4" onclick="oneCheckbox(this)">
                    <label class="form-check-label" for="inlineCheckbox2">휴대폰</label>
                </div>
            </div>
            <div class="rows d-flex justify-content-center">
                <input type="submit" id="payBtn" value="지금 결제하기">
            </div>
        </form>
    </div>
</div>
<%@include file="../common/footer.jsp"%>
<script type="text/javascript">

    function oneCheckbox(a){

        var obj = document.getElementsByName("pay");

        for(var i=0; i<obj.length; i++){

            if(obj[i] != a){

                obj[i].checked = false;

            }
        }

    }
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="post.js"></script>
</body>
</html>