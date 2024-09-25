<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.util.Pagination" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="com.jhta.afterpay.product.*" %>
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
    WishDao wishDao = new WishDao();
    int userNo = Utils.toInt(String.valueOf(session.getAttribute("USERNO")));
    List<Wish> wishes = wishDao.getWishByUserNo(userNo);

    int pageNo = Utils.toInt(request.getParameter("page"), 1);
    int totalRows = wishDao.getAllTotalRowsByUserNo(userNo);
    Pagination pagination = new Pagination(pageNo, totalRows);
    int begin = pagination.getBegin();
    int end = pagination.getEnd();
    int beginPage = pagination.getBeginPage();
    int endPage = pagination.getEndPage();
    List<Wish> wishList = wishDao.getAllWishListByUserNo(userNo, begin, end);

    int amount = 0;
    int totalPrice = 0;
    int totalAmount = 0;
%>
<div class="container">
    <div class="row">
        <div class="col-2"></div>
        <div class="col-10">
            <h2 class="mt-3"><strong>위시리스트</strong></h2>
        </div>
    </div>
    <div class="row">
        <!-- 메뉴 nav 사용 -->
        <div class="col-2">
            <%@include file="../common/user-nav.jsp" %>
        </div>
        <!-- 컨텐츠 -->
        <div class="col-10">
            <form method="post" action="../order/order-form.jsp" id="form-wish">
                <hr style="border:solid 1px gray;"/>
                <%
                    if (wishList.isEmpty()) {
                %>
                <div class="text-center m-5">
                    <strong>위시리스트 내역이 없습니다.</strong><br>
                    <br>
                    <a href="../index.jsp" type="button" class="btn btn-lg bg-light border-dark-subtle">지금 바로 쇼핑하러 가기</a>

                </div>
                <%
                } else {
                %>
                <div class="row mb-3">
                    <div class="col-6">
                        <div class="text-start">
                            <input id="check-all" type="checkbox" name="all" style="zoom:1.8" onchange="checkAll()">
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="text-end">
                            <button type="submit" class="btn btn-lg" onclick="deleteWish()">
                                <i class="bi bi-trash"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade show active" id="nav-wishlist" role="tabpanel" aria-labelledby="nav-home-tab">
                    <div class="table-responsive">
                        <table class="table align-middle">
                            <colgroup>
                                <col width="1%">
                                <col width="15%">
                                <col width="*">
                                <col width="15%">
                            </colgroup>
                            <tbody>
                            <%
                                for (Wish wish : wishList) {
                                    int stockNo = wish.getStock().getNo();
                                    StockDao stockDao = new StockDao();
                                    Stock stock = stockDao.getStockByNo(stockNo);

                                    int productNo = wish.getProduct().getNo();
                                    ProductDao productDao = new ProductDao();
                                    Product product = productDao.getProductByNo(productNo);

                                    List<Image> images = productDao.getAllImagesByNo(productNo);
                            %>
                            <tr>
                                <input type="hidden" name="stockNo" value="<%=stockNo%>">
                                <input type="hidden" name="amount" value="1">
                                <td>
                                    <input type="checkbox" name="stockNo" id="ck" onchange="checkSelect()"
                                           style="zoom:1.5" value="<%=stockNo%>">
                                </td>
                                <td>
                                    <img src="../common/images/<%=images.get(0).getName()%>" class="rounded mx-auto d-block" width="120">
                                </td>
                                <td class="align-top">
                                    <p></p>
                                    <p style="font-size: 20px"><strong><%=wish.getProduct().getName()%>
                                    </strong></p>
                                    <p>사이즈: <strong><%=wish.getStock().getSize()%>
                                    </strong></p>
                                    <p>가격: <strong id="wish-<%=stock.getNo()%>-price"
                                                   data-price="<%=wish.getProduct().getPrice()%>"><%=Utils.toCurrency(wish.getProduct().getPrice())%>
                                        원</strong></p>
                                </td>
                                <td class="align-middle text-end">
                                    <a type="button" id="form-cart" href="cart.jsp?stockNo=<%=stockNo%>&amount=1" class="btn btn-outline-primary">
                                        장바구니
                                    </a>
                                    <p></p>
                                    <a type="button" id="form-order" href="../order/order-form.jsp?stockNo=<%=stockNo%>&amount=1"
                                       class="btn btn-outline-success">
                                        주문하기
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

                <!-- Item Total Info -->
                <div class="text-center mt-4 mb-5">
                    <div class="row fs-5" id="cart-info">
                        <!-- cart -->
                        <table border="1">
                            <tbody>
                            <tr class="fs-5">
                                <td>총 선택 갯수</td>
                                <td>배송비</td>
                                <td>총 결제 금액</td>
                                <td rowspan="2">
                                    <button class="btn btn-secondary btn-lg" id="btn-order" disabled>
                                        지금 주문하기
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div>
                                        <strong>
                                            <span id="wish-total-amount"><%=amount%></span> 개
                                        </strong>
                                    </div>
                                </td>
                                <td>
                                    <strong>
                                        <span id="delivery-fee">3,000 원</span>
                                    </strong>
                                </td>
                                <td>
                                    <strong><span id="wish-total-price"><%=Utils.toCurrency(totalPrice)%></span> 원</strong>
                                </td>
                                <td></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <%
                    }
                %>
            </form>
        </div>
    </div>

    <script type="text/javascript">
        function checkAll() {
            let isChecked = document.querySelector("[name=all]").checked;
            console.log('체크여부', isChecked);

            let checkBoxes = document.querySelectorAll("[name=stockNo]");
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
            let checkboxes = document.querySelectorAll("[name=stockNo]");
            let checkedCnt = 0;
            let totalPrice = 0;
            for (let checkbox of checkboxes) {
                // 만약 체크박스가 선택된 것이 있으면
                if (checkbox.checked) {
                    // 체크된 개수 증가
                    checkedCnt++;
                    // 선택된 체크박스에서 위시번호와 가격을 가져옴
                    let wishNo = checkbox.value;
                    let price = document.getElementById("wish-" + wishNo + "-price").getAttribute("data-price");
                    // 읽어온 가격을 총 금액에 추가
                    totalPrice += parseInt(price);
                }
            }

            // 총 금액이 150000이 넘으면 "무료", 아니면 3000원
            if (totalPrice >= 150000) {
                document.getElementById("delivery-fee").textContent = "무료";
            } else {
                document.getElementById("delivery-fee").textContent = "3,000";
            }

            // id값이 wish-total-amount인 곳에 checkedCnt 값 전달
            document.getElementById("wish-total-amount").textContent = checkedCnt;
            // id값이 wish-total-price인 곳에 totalPrice 값 전달
            document.getElementById("wish-total-price").textContent = new Number(totalPrice).toLocaleString();

            if (checkedCnt > 0) {
                document.querySelector("#btn-order").classList.add("btn-success")
                document.querySelector("#btn-order").classList.remove("btn-secondary")
                document.querySelector("#btn-order").disabled = false;
            } else {
                document.querySelector("#btn-order").classList.remove("btn-success")
                document.querySelector("#btn-order").classList.add("btn-secondary")
                document.querySelector("#btn-order").disabled = true;
            }

        }

        function deleteWish() {
            // 체크된 문의번호를 조회
            let checkBoxes = document.querySelectorAll("input[type=checkbox][name=wishNo]");
            let isChecked = false;
            // 체크된 문의가 한 건이라도 있으면 참 반환
            for (let checkBox of checkBoxes) {
                if (checkBox.checked) {
                    isChecked = true;
                    break;
                }
            }
            // 만약 하나도 선택이 안되면 알림 전송 후, 거짓 반환
            if (!isChecked) {
                alert("선택된 상품이 없습니다.")
                let qnaDefineForm = document.getElementById("form-wish");
                qnaDefineForm.setAttribute("action", "wish-list.jsp");
                qnaDefineForm.submit();
                return false;
            }

            let qnaForm = document.getElementById("form-wish");
            qnaForm.setAttribute("action", "delete-wish.jsp");
            qnaForm.submit();

            // 체크된 문의가 있으면 해당 폼을 제출하는 것이 참
            return true;
        }
    </script>
    <%@include file="../common/footer.jsp" %>
</body>
</html>