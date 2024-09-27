<%@ page import="com.jhta.afterpay.user.CartDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.user.Cart" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.product.*" %>
<%@ page import="com.jhta.afterpay.util.Pagination" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
    <link href="/common/css/style.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>AFTER PAY_Shopping List</title>
</head>
<style>
    h2 {
        text-align: center;
    }

    #cart-info {
        height: 120px;
    }
</style>
<body>
<%@include file="../common/nav.jsp" %>
<%
    int userNo = Utils.toInt(String.valueOf(session.getAttribute("USERNO")));
    if (userID == null) {
        response.sendRedirect("../login-form.jsp?deny");
        return;
    }
    // 장바구니 목록 가져오기
    CartDao cartDao = new CartDao();
    List<Cart> carts = cartDao.getAllCartsByUserNo(userNo);

    int totalRows = carts.size();
    int pageNo = Utils.toInt(request.getParameter("page"), 1);
    Pagination pagination = new Pagination(pageNo, totalRows);
%>
<div class="container">
    <div class="row">
        <div class="col-2"></div>
        <div class="col-10">
            <h2 class="mt-3"><strong>장바구니</strong></h2>
        </div>
    </div>
    <div class="row">
        <!-- 메뉴 nav 사용 -->
        <div class="col-2">
            <%@include file="../common/user-nav.jsp" %>
        </div>
        <!-- 컨텐츠 -->
        <div class="col-10">
            <form action="../order/order-form.jsp" method="post" id="cart">
                <hr style="border:solid 1px gray;">
                <div class="row">
                    <div class="tab-content" id="nav-tabContent">
                        <%
                            if (carts.isEmpty()) {
                        %>
                        <div class="text-center m-5">
                            <strong>장바구니에 상품이 없습니다.</strong><br>
                            <br>
                            <button type="button" onclick="location.href='../index.jsp'"
                                    class="btn btn-lg bg-light border-dark-subtle">지금 바로 쇼핑하러 가기
                            </button>
                        </div>
                        <%
                        } else {
                        %>
                        <div class="row mb-3">
                            <div class="col-6">
                                <div class="text-start">
                                    <input id="check-all" type="checkbox" name="all" style="zoom:1.8"
                                           onchange="checkAll()">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="text-end">
                                    <button type="button" location.href='../cart-delete.jsp?' class="btn btn-lg"
                                            onclick="deleteSelectedCartItem()">
                                        <i class="bi bi-trash"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade show active " id="nav-cart" role="tabpanel"
                             aria-labelledby="nav-home-tab">
                            <div class="table-responsive">
                                <table class="table align-middle mt-2 md-2">
                                    <colgroup>
                                        <col width="1%">
                                        <col width="15%">
                                        <col width="*">
                                        <col width="15%">
                                    </colgroup>
                                    <tbody>

                                    <%--주문내역 상품 보여주기--%>
                                    <%
                                        int amount = 0;
                                        int totalPrice = 0;
                                        int totalAmount = 0;
                                        StockDao stockDao = new StockDao();
                                        ProductDao productDao = new ProductDao();
                                        // 장바구니 목록 보여주기
                                        for (Cart cart : carts) {
                                            int productNo = cart.getProduct().getNo();
                                            Product product = productDao.getProductByNo(productNo);
                                            List<Image> images = productDao.getAllImagesByNo(productNo);
                                            int stockNo = cart.getStock().getNo();
                                            Stock stock = stockDao.getStockByNo(stockNo);
                                            int cartNo = cart.getNo();
                                    %>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="ck" name="cartNo" value="<%=cartNo%>"
                                                   style="zoom:1.5" onchange="checkSelect()">
                                        </td>
                                        <td>
                                            <img src="../common/images/<%=images.get(0).getName()%>"
                                                 class="rounded mx-auto d-block" width="170">
                                        </td>
                                        <td class="align-top">
                                            <p></p>
                                            <p style="font-size: 20px">
                                                <input type="hidden" name="name" value="<%=product.getName()%>">
                                                이름: <strong><%=product.getName()%>
                                            </strong>
                                            </p>
                                            <p>
                                                <input type="hidden" name="size" value="<%=stock.getSize()%>">
                                                <span>사이즈: <%=stock.getSize()%></span>
                                            </p>
                                            <p>
                                                <input type="hidden" name="amount" id="cart-<%=cartNo%>-amount"
                                                       value="<%=cart.getAmount()%>">
                                                <span>수량: <%=cart.getAmount()%></span>
                                            </p>
                                            <p>
                                                <input type="hidden" name="price" id="cart-<%=cartNo%>-price"
                                                       value="<%=product.getPrice()%>">
                                                <span data-price="<%=product.getPrice()%>">가격: <%=Utils.toCurrency(product.getPrice())%></span>
                                            </p>
                                        </td>
                                        <td class="align-middle text-end">
                                            <button type="button" class="btn btn-outline-primary"
                                                    onclick="location.href='../product/detail.jsp?pno=<%=product.getNo()%>'">
                                                상세보기
                                            </button>
                                            <a href="cart-delete.jsp?cartNo=<%=cartNo%>"
                                               class="btn btn-outline-danger mt-2">
                                                삭제
                                            </a>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <%--페이징 처리--%>
                        <%
                            if (pagination.getTotalRows() > 0) {
                        %>
                        <div>
                            <ul class="pagination justify-content-center">
                                <li class="page-item <%=pagination.isFirst() ? "disabled" : ""%>">
                                    <a href="cart.jsp?userNo=<%=userNo%>&page=<%=pagination.getPrev() %>"
                                       class="page-link">이전</a>
                                </li>
                                <%
                                    for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
                                %>
                                <li class="page-item <%=num == pageNo ? "active" : ""%>">
                                    <a href="cart.jsp?userNo=<%=userNo%>&page=<%=num %>" class="page-link"><%=num %>
                                    </a>
                                </li>
                                <%
                                    }
                                %>
                                <li class="page-item <%=pagination.isLast() ? "disabled" : "" %>">
                                    <a href="cart.jsp?userNo=<%=userNo%>&page=<%=pagination.getNext() %>"
                                       class="page-link">다음</a>
                                </li>
                            </ul>
                        </div>
                        <%
                            }
                        %>

                        <!-- Item Total Info -->
                        <div class="text-center mt-4 mb-5">
                            <div class="row fs-5" id="cart-info">
                                <!-- cart -->
                                <table border="1">
                                    <tr class="fs-5">
                                        <td>총 선택 갯수</td>
                                        <td>배송비</td>
                                        <td>총 결제 금액</td>
                                        <td rowspan="2">
                                            <button type="submit" class="btn btn-outline-success btn-lg">지금 주문하기
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="hidden" name="totalAmount" value="<%=totalAmount%>">
                                            <strong>
                                                <span id="totalAmount"><%=totalAmount%></span>개
                                            </strong>
                                        </td>
                                        <td>
                                            <input type="hidden" name="deliveryPrice" value="<%=3000%>">
                                            <strong>
                                                <span id="delivery-fee"><%=Utils.toCurrency(3000)%></span>
                                            </strong>
                                        </td>
                                        <td>
                                            <input type="hidden" name="totalPrice" value="<%=totalPrice%>">
                                            <strong><span id="cart-total-price"><%=Utils.toCurrency(totalPrice)%></span>
                                            </strong>
                                        </td>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
                <%
                    }
                %>
        </div>
    </div>
        </div>
    </div>
</div>
<%@include file="../common/footer.jsp" %>

<script type="text/javascript">
    function checkAll() {
        let isChecked = document.querySelector("[name=all]").checked;
        console.log('체크여부', isChecked);

        let checkBoxes = document.querySelectorAll("[name=cartNo]");
        checkBoxes.forEach(function (el) {
            el.checked = isChecked;
        })

        refreshSummary()
    }

    function checkSelect() {
        let checkBoxes = document.querySelectorAll("[name=stockNo]");
        let checkBoxesLength = checkBoxes.length;
        let checkedLength = 0;

        for (let el of checkBoxes) {
            if (el.checked) {
                checkedLength++;
            }
        }

        if (checkBoxesLength === checkedLength) {
            document.querySelector("[name=all]").checked = true;
        } else {
            document.querySelector("[name=all]").checked = false;
        }

        refreshSummary()
    }

    function refreshSummary() {
        let checkboxes = document.querySelectorAll("[name=cartNo]");
        let checkedCnt = 0;
        let totalAmount = 0;
        let totalPrice = 0;
        for (let checkbox of checkboxes) {
            // 만약 체크박스가 선택된 것이 있으면
            if (checkbox.checked) {
                // 체크된 개수 증가
                checkedCnt++;
                // 선택된 체크박스에서 위시번호와 가격을 가져옴
                let cartNo = checkbox.value;
                let amount = document.getElementById("cart-" + cartNo + "-amount").value
                let price = document.getElementById("cart-" + cartNo + "-price").value

                totalAmount += parseInt(amount);
                // 읽어온 가격을 총 금액에 추가
                totalPrice += parseInt(price * amount);
            }
        }


        // 총 금액이 150000이 넘으면 "무료", 아니면 3000원
        if (totalPrice >= 150000) {
            document.getElementById("delivery-fee").textContent = "무료";
        } else {
            document.getElementById("delivery-fee").textContent = "3,000";
        }

        // id값이 totalAmount인 곳에 checkedCnt 값 전달
        document.getElementById("totalAmount").textContent = totalAmount;
        // id값이 cart-total-price인 곳에 totalPrice 값 전달
        document.getElementById("cart-total-price").textContent = new Number(totalPrice).toLocaleString();
    }


    function deleteSelectedCartItem() {
        let checkboxes = document.querySelectorAll("[name=cartNo]");
        let isChecked = false;

        for (let checkbox of checkboxes) {
            if (checkbox.checked) {
                isChecked = true;
                break;
            }
        }
        if (!isChecked) {
            alert("삭제할 상품을 체크하세요");
            return;
        }

        let form = document.getElementById("cart");
        form.setAttribute("action", "cart-delete.jsp");
        form.submit();
    }
</script>

</body>
</html>