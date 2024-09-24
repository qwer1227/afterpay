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
<%
    // 장바구니 목록 가져오기
    CartDao cartDao = new CartDao();
    int userNo = 19;
    List<Cart> carts = cartDao.getAllCartsByUserNo(19);

    int totalRows = carts.size();
    int pageNo = Utils.toInt(request.getParameter("page"), 1);
    Pagination pagination = new Pagination(pageNo, totalRows);
%>
<%@include file="../common/nav.jsp" %>
<div class="container">
    <form action="../order/order-form.jsp" method="post">
        <div class="row">
            <!-- 메뉴 nav 사용 -->
            <div class="col-2">
                <%@include file="../common/user-nav.jsp" %>
            </div>

            <!-- 컨텐츠 -->
            <div class="col-10">
                <h2 class="m-4"><strong>장바구니</strong></h2>
                <div class="tab-content" id="nav-tabContent">
                    <div class="hstack gap-3">
                        <div class="p-2">
                            <input type="checkbox" id="checkAll" style="zoom:1.8" onclick="checked()" >
                        </div>
                        <div class="p-3 ms-auto">
                            <button class="btn btn-lg">
                                <i class="bi bi-trash"></i>
                            </button>
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
                                        totalAmount += cart.getAmount();
                                        totalPrice += product.getPrice() * cart.getAmount();
                                %>
                                <tr>
                                    <td>
                                        <input type="checkbox" class="chk" name="stockNo" value="<%=stockNo%>" style="zoom:1.5">
                                    </td>
                                    <td>
                                        <img src="../common/images/<%=images.get(0).getName()%>" class="rounded mx-auto d-block" width="170">
                                    </td>
                                    <td class="align-top">
                                        <p></p>
                                        <p style="font-size: 20px">
                                            <input type="hidden" name="name" value="<%=product.getName()%>">
                                            <strong><%=product.getName()%></strong>
                                        </p>
                                        <p>
                                            <input type="hidden" name="size" value="<%=stock.getSize()%>">
                                            <%=stock.getSize()%>
                                        </p>
                                        <p>
                                            <input type="hidden" name="amount" value="<%=cart.getAmount()%>">
                                            <%=cart.getAmount()%>
                                        </p>
                                        <p>
                                            <input type="hidden" name="price" value="<%=product.getPrice()%>">
                                            <%=Utils.toCurrency(product.getPrice())%>
                                        </p>
                                    </td>
                                    <td class="align-middle text-end">
                                        <button class="btn btn-outline-primary">상세보기</button>
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
                                <a href="list.jsp?cat_no=<%=userNo%>&page=<%=pagination.getPrev() %>" class="page-link">이전</a>
                            </li>
                            <%
                                for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
                            %>
                            <li class="page-item <%=num == pageNo ? "active" : ""%>">
                                <a href="list.jsp?cat_no=<%=userNo%>&page=<%=num %>" class="page-link"><%=num %></a>
                            </li>
                            <%
                                }
                            %>
                            <li class="page-item <%=pagination.isLast() ? "disabled" : "" %>">
                                <a href="list.jsp?cat_no=<%=userNo%>&page=<%=pagination.getNext() %>" class="page-link">다음</a>
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
                                        <button type="submit" class="btn btn-outline-success btn-lg">지금 주문하기</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="hidden" name="totalAmount" value="<%=totalAmount%>">
                                        <strong><%=totalAmount%></strong>
                                    </td>
                                    <td>
                                        <input type="hidden" name="deliveryPrice" value="<%=3000%>">
                                        <strong><%=Utils.toCurrency(3000)%></strong>
                                    </td>
                                    <td>
                                        <input type="hidden" name="totalPrice" value="<%=totalPrice%>">
                                        <strong><%=Utils.toCurrency(totalPrice)%></strong>
                                    </td>
                                    <td></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
</div>
<script type="text/javascript">
    document.querySelector('#checkAll');

    checkAll.addEventListener('click', function(){

        const isChecked = checkAll.checked;

        if(isChecked){
            const checkboxes = document.querySelectorAll('.chk');

            for(const checkbox of checkboxes){
                checkbox.checked = true;
            }
        }

        else{
            const checkboxes = document.querySelectorAll('.chk');
            for(const checkbox of checkboxes){
                checkbox.checked = false;
            }
        }
    })

    const checkboxes = document.querySelectorAll('.chk');
    for(const checkbox of checkboxes){
        checkbox.addEventListener('click',function(){

            const totalCnt = checkboxes.length;

            const checkedCnt = document.querySelectorAll('.chk:checked').length;

            if(totalCnt == checkedCnt){
                document.querySelector('#checkAll').checked = true;
            }
            else{
                document.querySelector('#checkAll').checked = false;
            }

        });

    }
</script>

<%@include file="../common/footer.jsp" %>
</body>
</html>