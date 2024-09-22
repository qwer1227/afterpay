<%@ page import="com.jhta.afterpay.order.CartDao" %>
<%@ page import="com.jhta.afterpay.order.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.product.Image" %>
<%@ page import="com.jhta.afterpay.product.ProductDao" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
  <link href="/common/css/style.css" rel="stylesheet" >
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <title>AFTER PAY_Shopping List</title>
</head>
<style>
  h2{
    text-align: center;
  }
  #cart-info{
    height: 120px;
  }
</style>
<body>
<%@include file="../common/nav.jsp"%>
<%
  int userNo = 19;
  CartDao cartDao = new CartDao();
  List<Cart> cartList = cartDao.getCartsInfoByUserNo(userNo);
  int totalPrice = 0;
  int totalAmount = 0;
%>
<div class="container">
  <div class="row">
    <!-- 메뉴 nav 사용 -->
    <div class="col-2">
      <%@include file="../common/user-nav.jsp"%>
    </div>

    <!-- 컨텐츠 -->
    <div class="col-10">
      <h2 class="m-4"><strong>장바구니</strong></h2>
      <hr style="border:solid 1px gray;"/>
      <%
        if (cartList.isEmpty()){
      %>
      <div class="text-center m-5">
        <span class="fs-5"><strong>장바구니에 담긴 상품이 없습니다.</strong></span><br>
        <br>
        <a href="" type="button" class="btn btn-lg bg-light border-dark-subtle">지금 바로 쇼핑하러 가기</a>
      </div>
      <%
        } else {
      %>
      <form type="post" action="../order/orderForm.jsp">
        <div class="tab-content" id="nav-tabContent">
          <div class="hstack" style="height: 50px">
            <div class="p-2">
              <input id="check-all" type="checkbox" name="all" onchange="checkAll()" style="zoom:1.8">
            </div>
            <div class="p-3 ms-auto">
              <button class="btn btn-lg">
                <i class="bi bi-trash"></i>
              </button>
            </div>
          </div>

          <div class="tab-pane fade show active" id="nav-cart" role="tabpanel" aria-labelledby="nav-home-tab">
            <div class="table-responsive">
              <table class="table align-middle">
                <colgroup>
                  <col width="1%">
                  <col width="15%">
                  <col width="*">
                  <col width="15%">
                </colgroup>
                <%
                  for (Cart cart : cartList){
                    ProductDao productDao = new ProductDao();
                    List<Image> images = productDao.getAllImagesByNo(cart.getProduct().getNo());
                    totalPrice += (cart.getProduct().getPrice() * cart.getAmount());
                    totalAmount += cart.getAmount();
                %>
                <tr>
                  <td>
                    <input type="checkbox" name="cartNo" onchange="checkSelect()" style="zoom:1.5" value="check-item">
                  </td>
                  <td>
                    <img src="/img/<%=images%>" class="rounded mx-auto d-block" width="150">
                  </td>
                  <td class="align-top">
                    <p></p>
                    <p style="font-size: 20px">
                      <strong><%=cart.getProduct().getName()%></strong>
                    </p>
                    <p>사이즈: <strong><%=cart.getStock().getSize()%></strong></p>
                    <p>수량: <strong><%=cart.getAmount()%> 개</strong></p>
                    <p>가격: <strong><%=Utils.toCurrency(cart.getProduct().getPrice() * cart.getAmount())%> 원</strong></p>
                  </td>
                  <td class="align-middle text-end">
                    <a href="" type="button" class="btn btn-outline-primary">
                      상세보기
                    </a>
                  </td>
                </tr>
                <%
                  }
                %>
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
                    <a href="" type="submit">
                      <button class="btn btn-outline-success btn-lg">
                        지금 주문하기
                      </button>
                    </a>
                  </td>
                </tr>
                <tr>
                  <td><strong><%=Utils.toCurrency(totalAmount)%> 개</strong></td>
                  <td>
                    <strong>
                      <%=totalPrice > 150000 ? "-" : "3,000"%> 원
                    </strong>
                  </td>
                  <td><strong><%=Utils.toCurrency(totalPrice)%> 원</strong></td>
                  <td></td>
                </tr>
              </table>
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

<script type="text/javascript">
  function checkAll(){
    let isChecked = document.querySelector("[name=all]").checked;
    console.log('체크여부', isChecked);

    let checkBoxes = document.querySelectorAll("[name=cartNo]");
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
</script>
<%@include file="../common/footer.jsp"%>
</body>
</html>