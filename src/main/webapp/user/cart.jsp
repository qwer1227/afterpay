<%@ page import="com.jhta.afterpay.user.CartDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.user.Cart" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
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
  int userNo = 19;
  // 장바구니 목록 가져오기
  CartDao cartDao = new CartDao();
  List<Cart> carts = cartDao.getAllCartsByUserNo(userNo);
  int amount = 0;
  int totalPrice = 0;
  int totalAmount = 0;
  StockDao stockDao = new StockDao();
  ProductDao productDao = new ProductDao();
%>
<div class="container">
  <form action="../order/orderForm.jsp" method="post">
    <div class="row">
      <!-- 메뉴 nav 사용 -->
      <div class="col-2">
        <%@include file="../common/user-nav.jsp" %>
      </div>

      <!-- 컨텐츠 -->
      <div class="col-10">
        <h2 class="m-4"><strong>장바구니</strong></h2>
        <hr style="border:solid 1px gray;"/>
        <div class="tab-content" id="nav-tabContent">
          <div class="hstack gap-3">
            <div class="p-2">
              <input type="checkbox" name="all" style="zoom:1.8" onclick="checkAll()">
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
                    // 장바구니 목록 보여주기
                    for (Cart cart : carts) {
                      int productNo = cart.getProduct().getNo();
                      Product product = productDao.getProductByNo(productNo);
                      int stockNo = cart.getStock().getNo();
                      List<Image> images = productDao.getAllImagesByNo(productNo);
                      Stock stock = stockDao.getStockByNo(stockNo);
                      totalAmount += cart.getAmount();
                      totalPrice += product.getPrice() * cart.getAmount();
                      String thumb = "../img/main2.png";
                  %>
                  <tr>
                    <td>
                      <input type="checkbox" name="stockNo" style="zoom: 1.5" onchange="checkSelect()" value="<%=stockNo%>">
                    </td>
                    <td>
                      <input type="hidden" name="thumb" value="<%=thumb%>">
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
                        사이즈: <strong><%=stock.getSize()%></strong>
                      </p>
                      <p>
                        <input type="hidden" name="amount" value="<%=cart.getAmount()%>">
                        수량: <strong><%=cart.getAmount()%> 개</strong>
                      </p>
                      <p>
                        <input type="hidden" name="price" value="<%=product.getPrice()%>">
                        <Strong><%=Utils.toCurrency(product.getPrice())%> 원</strong>
                      </p>
                    </td>
                    <td class="align-middle text-end">
                      <a href="../product/detail.jsp?pno=<%=product.getNo()%>" class="btn btn-outline-primary">
                        상세보기
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
                <colgroup>
                  <col width="25%">
                  <col width="25%">
                  <col width="25%">
                  <col width="25%">
                </colgroup>
                <tr class="fs-5">
                  <td>총 선택</td>
                  <td>배송비</td>
                  <td>총 결제 금액</td>
                  <td rowspan="2">
                    <button type="submit" class="btn btn-outline-success btn-lg">지금 주문하기</button>
                  </td>
                </tr>
                <tr>
                  <td>
                    <input type="hidden" name="totalAmount" onclick="getCheckedCnt()" value="<%=totalAmount%>">
                    <strong> 개</strong>
                  </td>
                  <td>
                    <input type="hidden" name="deliveryPrice" value="<%=3000%>">
                    <strong><%=totalPrice >= 150000 ? "-" : Utils.toCurrency(3000)+"원"%></strong>
                  </td>
                  <td>
                    <input type="hidden" name="totalPrice" value="<%=totalPrice%>">
                    <strong><%=Utils.toCurrency(totalPrice)%> 원</strong>
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
<script type="text/javascript">
    function checkAll(){
        let isChecked = document.querySelector("[name=all]").checked;
        console.log('체크여부', isChecked);

        let checkBoxes = document.querySelectorAll("[name=stockNo]");
        checkBoxes.forEach(function (el) {
            el.checked = isChecked;
        })
    }

    function checkSelect() {
        let checkBoxes = document.querySelectorAll("[name=cartNo]");
        let checkBoxesLength = checkBoxes.length;
        let checkedLength = 0;

        for (let el of checkBoxes) {
            if (el.checked) {
                checkedLength++;
            }
        }

        if (checkBoxesLength == checkedLength){
            document.querySelector("[name=all]").checked = true;
        } else {
            document.querySelector("[name=all]").checked = false;
        }
    }

    function getChecked() {
        let checkBoxesCnt = document.querySelector("[name=cartNo]").checked;
        let isChecked = false;

        for (let checkBox of checkBoxesCnt){
          isChecked = true;
          break;
        }
    }
</script>
<%@include file="../common/footer.jsp" %>
</body>
</html>