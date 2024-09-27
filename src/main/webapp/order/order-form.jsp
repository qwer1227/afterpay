<%@ page import="com.jhta.afterpay.product.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.user.UserDao" %>
<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page import="com.jhta.afterpay.addr.Addr" %>
<%@ page import="com.jhta.afterpay.addr.AddrDao" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.product.*" %>
<%@ page import="com.jhta.afterpay.user.Cart" %>
<%@ page import="com.jhta.afterpay.user.CartDao" %>
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
<%@ include file="/common/nav.jsp" %>
<%
    String userNos = String.valueOf(session.getAttribute("USERNO"));
    System.out.println(userID);

    if (userID == null) {
        response.sendRedirect("../login-form.jsp?deny");
        return;
    }

    // 장바구니에서 주문한 경우
    CartDao cartDao = new CartDao();
    String[] cartNo = request.getParameterValues("cartNo");
    String[] stockNo = request.getParameterValues("stockNo");
    int[] stockNoArr = null;
    int[] cartNoArr = null;
    List<Cart> carts = new ArrayList<>();
    if (cartNo != null) {
        cartNoArr = new int[cartNo.length];
        stockNoArr = new int[cartNoArr.length];
        for (int i = 0; i < cartNoArr.length; i++) {
            cartNoArr[i] = Utils.toInt(cartNo[i]);
            Cart cart = cartDao.getCartByNo(cartNoArr[i]);
            carts.add(cart);
            stockNoArr[i] = cart.getStock().getNo();
        }
    } else {
        stockNoArr = new int[stockNo.length];
        for (int i = 0; i < stockNoArr.length; i++) {
            stockNoArr[i] = Utils.toInt(stockNo[i]);
        }
    }

    int userNo = Utils.toInt(userNos);

    //  전달 받은 상품 주문 수량
    String[] amount = request.getParameterValues("amount");
    int[] amountArr = new int[amount.length];
    for (int i = 0; i < amountArr.length; i++) {
        amountArr[i] = Utils.toInt(amount[i]);
    }


    // 주문 회원 조회
    UserDao userDao = new UserDao();
    User user = userDao.getUserById(userID);
    AddrDao addrDao = new AddrDao();
    List<Addr> addrs = addrDao.getAllAddrByUserNo(userNo);
    String zipcode = "";
    String addr1 = "";
    String addr2 = "";
    for (Addr addr : addrs) {
        if (addr.getIsAddrHome().equals("Y")) {
            zipcode = addr.getZipCode();
            addr1 = addr.getAddr1();
            addr2 = addr.getAddr2();
        }
    }
    ProductDao productDao = new ProductDao();
    StockDao stockDao = new StockDao();


%>
<div id="main" class="container">
    <form action="order.jsp" method="post" onsubmit="return checkForm()">
        <div class="row text-center pt-3 mb-5">
            <h3>주문 결제</h3>
        </div>
        <%--    상품 정보   --%>
        <div class="row mb-5 p-3">
            <%
                int totalPrice = 0;
                int totalAmount = 0;
                int deliveryPrice = 3000;
                int
                        paymentPrice = 0;
                int discountPrice = 0;
                for (int i = 0; i < stockNoArr.length; i++) {
                    // 장바구니 주문이 아니면 장바구니 번호를 담지 않음
                    int cartNo1 = 0;
                    if (cartNoArr != null) {
                        cartNo1 = cartNoArr[i];
                    }
                    Stock stock = stockDao.getStockByNo(stockNoArr[i]);
                    int productNo = stock.getProductNo();
                    List<Image> images = productDao.getAllImagesByNo(productNo);
                    Product product = productDao.getProductByNo(productNo);
                    totalPrice += amountArr[i] * product.getPrice();
                    totalAmount += amountArr[i];
                    int amount1 = amountArr[i];
            %>
            <div class="col-2">
                <img src="../common/images/<%=images.get(0).getName()%>" class="rounded float-start"
                     style="width: 130px; height:150px;">
            </div>
            <div class="col-9">
                <%--                상품수량, 재고번호, 장바구니 주문시 장바구니 번호--%>
                <input type="hidden" name="amount" value="<%=amount1%>">
                <input type="hidden" name="stockNo" value="<%=stock.getNo()%>">
                <input type="hidden" name="cartNo" value="<%=cartNo1%>">
                <ul class="list-unstyled">
                    <li>상품명: <%=product.getName() %>
                    </li>
                    <li>사이즈: <%=stock.getSize() %>
                    </li>
                    <li>수량: <%=amount1 %>
                    </li>
                </ul>
            </div>
            <div class="col-1">
                \<%=Utils.toCurrency(product.getPrice())%>
            </div>
            <%
                }
            %>
        </div>


        <input type="hidden" name="products" value="">
        <div id="delivery" class="row border-bottom border-top border-2 p-3 border-dark">
            <h4>배송 정보</h4>
            <ul class="list-unstyled p-4">
                <li class="mt-1"><label>이름</label><input type="text" name="userName" class="form-control" required/>
                </li>
                <li class="mt-2 mb-2"><input type="button" id="addrListBtn" value="배송지 고르기" onclick="openAddrs()"
                                             class="btn btn-primary"></li>
                <li class="mt-1">
                    <div class="col-12 input-group m-1">
                        <input type="hidden" name="addrNo" value="" disabled>
                        <label>우편번호</label><input type="text" id="sample6_postcode" name="zipcode" placeholder="우편번호"
                                                  class="form-control" value="<%=zipcode%>" required readonly>
                        <input type="button" class="btn btn-primary" onclick="sample6_execDaumPostcode()" value="검색"
                               class="col-2"></button>
                    </div>
                </li>
                <li class="mt-1"><label>주소</label><input type="text" id="sample6_address" name="address"
                                                         placeholder="주소" class="form-control" value="<%=addr1%>"
                                                         required readonly><br></li>
                <li><label>상세주소</label> <input type="text" id="sample6_detailAddress" name="detailAddress"
                                               value="<%=addr2%>"
                                               placeholder="상세주소" class="form-control"></li>
                <li>
                    <div id="addrNull" style="color: red">
                        배송지 고르기 또는 우편번호 검색으로 주소를 입력해주세요.
                    </div>
                </li>
                <li><input type="hidden" id="sample6_extraAddress" name="cham" placeholder="참고항목" class="form-control">
                </li>
                <li class="mt-1 row">
                    <label>휴대폰 번호</label>
                    <div class="row">
                        <div class="col-3">
                            <input type="text" id="tel" class="form-control" name="tel" required/>
                        </div>
                    </div>
                </li>
                <li class="mt-1">
                    <%--@declare id="email"--%><label for="email">이메일 주소</label>
                    <div class="row">
                        <div class="col-2">
                            <input type="text" id="emailId" class="form-control" name="emailId" required/>
                        </div>
                        <div class="col-auto">
                            @
                        </div>
                        <div class="col-2">
                            <input type="text" id="domain-txt" class="form-control" name="domain" required/>
                        </div>
                        <div class="col-1">
                            <select id="domain-list">
                                <optgroup>
                                    <option value="naver.com">naver.com</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="type" selected>직접입력</option>
                                </optgroup>
                            </select>
                        </div>
                    </div>
                </li>
                <li class="mt-1"><label>배송 메세지</label><input type="text" name="message" class="form-control"/>
                </li>
                <li class="mt-1"><label>수령인</label><input type="text" name="recipient" class="form-control"
                                                          value="<%=user.getName()%>"/></li>
            </ul>
        </div>
<%--        <label class="mt-3"><h4>적립금 사용하기</h4></label><br>--%>
<%--        <div class="border-bottom mb-1 p-4 border-dark">--%>
<%--            <input type="text" id="userPoint" value="<%=user.getPoint()%>" style="display: none">--%>
<%--            <input type="text" id="usePoint" name="point" placeholder="적립금 사용하기"class="form-control"/>--%>
<%--            <div id="pointError" style="color: red">--%>
<%--                0원 미만이거나 보유한 적립금보다 초과된 금액은 불가능 합니다.--%>
<%--            </div>--%>
<%--            <%--%>
<%--                if (user.getPoint() != 0) {--%>
<%--            %>--%>
<%--            <div class="mt-1">--%>
<%--                <label>보유한 적립금: </label><span> \<%=Utils.toCurrency(user.getPoint())%></span>--%>
<%--            </div>--%>
<%--            <%--%>
<%--                    paymentPrice = totalPrice - discountPrice + deliveryPrice;--%>
<%--                }--%>
<%--            %>--%>
<%--        </div>--%>
        <%
            if (user.getGradeId() == "BRONZE") {
                discountPrice = (int) Math.round(totalPrice * 0.005);
            } else if (user.getGradeId() == "SILVER") {
                discountPrice = (int) Math.round(totalPrice * 0.01);
            } else if (user.getGradeId() == "GOLD") {
                discountPrice = (int) Math.round(totalPrice * 0.03);
            }

            if(totalPrice >= 150000) {
                deliveryPrice = 0;
            }
            paymentPrice = totalPrice - discountPrice + deliveryPrice;
        %>
        <div id="price" class="row border-bottom border-2 border-dark">
            <h4>결제 정보</h4>
            <ul class="list-unstyled p-4">
                <li>
                    <label class="col-10">총 주문 수량</label>
                    <input type="hidden" name="totalAmount" value="<%=totalAmount%>">
                    <%=Utils.toCurrency(totalAmount)%>
                </li>
                <li>
                    <label class="col-10">합계 금액</label>
                    <input type="hidden" name="totalPrice" value="<%=totalPrice%>">
                    \<%=Utils.toCurrency(totalPrice)%>
                </li>
                <li>
                    <label class="col-10">할인 금액</label>
                    <input type="hidden" name="discountPrice" value="<%=discountPrice%>">
                    <span>\<%=Utils.toCurrency(discountPrice)%></span>
                <li>
                    <label class="col-10">배송비</label>
                    <input type="hidden" name="deliveryPrice" value="<%=deliveryPrice%>">
                    <span>\<%=Utils.toCurrency(deliveryPrice)%></span>
                </li>
                <li>
                    <label class="col-10"><strong>결제 금액</strong></label>
                    <input type="hidden" name="paymentPrice" value="<%=paymentPrice%>">
                    <strong>\<%=Utils.toCurrency(paymentPrice)%>
                    </strong>
                </li>
            </ul>
        </div>
        <div id="payment" class="row">
            <h4>결제 방법</h4>
            <table class="p-4 m-1">
                <thead>
                <th>
                    <%--@declare id="inlinecheckbox1"--%><input class="form-check-input" type="checkbox" name="pay"
                                                                id="credit" value="option1" onclick="oneCheckbox(this)">
                    <label class="form-check-label" for="inlineCheckbox1">신용카드</label>
                </th>
                <th>
                    <input class="form-check-input" type="checkbox" id="cash" name="pay" value="option2"
                           onclick="oneCheckbox(this)">
                    <label class="form-check-label" for="inlineCheckbox2">가상계좌</label>
                </th>
                <th>
                    <input class="form-check-input" type="checkbox" id="bank" name="pay" value="option3"
                           onclick="oneCheckbox(this)">
                    <label class="form-check-label" for="inlineCheckbox2">계좌이체</label>
                </th>
                <th>
                    <%--@declare id="inlinecheckbox2"--%><input class="form-check-input" type="checkbox" id="phone"
                                                                name="pay" value="option4" onclick="oneCheckbox(this)">
                    <label class="form-check-label" for="inlineCheckbox2">휴대폰</label>
                </th>
                </thead>
            </table>
        </div>
        <div class="row d-flex justify-content-center mb-3 p-5">
            <input type="submit" id="payButton" class="btn btn-dark text-white" onclick="checkForm()" value="지금 결제하기">
        </div>
    </form>
</div>
<%@include file="/common/footer.jsp" %>
<script type="text/javascript">

    function oneCheckbox(a) {

        var obj = document.getElementsByName("pay");

        for (var i = 0; i < obj.length; i++) {

            if (obj[i] != a) {

                obj[i].checked = false;

            }
        }

    }

    let openWin;

    function openAddrs() {
        // window.name = "부모창 이름";
        window.name = "orderForm";

        // window.open("open할 window", "자식창 이름", "팝업창 옵션");
        openWin = window.open('addr-list.jsp', '_blank', 'width=1000, height=600, top=50, left=50, scrollbars=yes')
    }

    // 도메인 직접 입력 or domain option 선택
    const domainListEl = document.querySelector('#domain-list')
    const domainInputEl = document.querySelector('#domain-txt')

    // select 옵션 변경 시
    domainListEl.addEventListener('change', (event) => {
        // option에 있는 도메인 선택 시
        if (event.target.value !== "type") {
            // 선택한 도메인을 input에 입력하고 disabled
            domainInputEl.value = event.target.value
            domainInputEl.disabled = true
        } else { // 직접 입력 시
            // input 내용 초기화 & 입력 가능하도록 변경
            domainInputEl.value = ""
            domainInputEl.disabled = false
        }


    })

    const telInput = document.getElementById('tel');
    // 숫자만 입력 가능하도록 설정
    telInput.addEventListener('input', function () {
        // 입력 값에서 숫자만 추출
        let inputValue = telInput.value.replace(/\D/g, '');

        // 형식에 맞게 하이픈 자동 삽입
        if (inputValue.length > 10) {
            inputValue = inputValue.substring(0, 11);
        }

        if (inputValue.length <= 3) {
            telInput.value = inputValue;
        } else if (inputValue.length <= 7) {
            telInput.value = inputValue.replace(/(\d{3})(\d{0,4})/, '$1-$2');
        } else {
            telInput.value = inputValue.replace(/(\d{3})(\d{4})(\d{0,4})/, '$1-$2-$3');
        }
    });

    const zipcode = document.querySelector("#sample6_postcode");
    let addr1 = document.querySelector("#sample6_address");

    if (zipcode.value == "" || addr1.value == "") {
        document.querySelector("#addrNull").style.display = 'block';
    } else {
        document.querySelector("#addrNull").style.display = 'none';
    }



    const pointInput = document.getElementById('usePoint');
    const userPoint = document.getElementById('userPoint');
    const maxPoint = parseInt(userPoint.value); // 최대 포인트
    const userPoints = parseInt(userPoint.value); // 사용 포인트

    
    const domain = document.getElementById('domain-txt').value;
    function checkForm() {

        if (zipcode.value == "" || addr1.value == "") {
            document.querySelector("#addrNull").style.display = 'block';
            return false;
        } else {
            document.querySelector("#addrNull").style.display = 'none';
            return true;
        }

        if (0 <= pointInput <= userPoint) {
            document.querySelector('#pointError').style.display='none';
            return true;
        } else {
            document.querySelector('#pointError').style.display = 'block';
            return false;
        }

        if (domain == null) {
            alert("이메일을 입력해주세요");
            return false;
        }
    }






</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="post.js"></script>
</body>
</html>