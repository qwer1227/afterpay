<%@ page import="com.jhta.afterpay.order.OrderDao" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.order.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.util.Pagination" %>
<%@ page import="com.jhta.afterpay.delivery.DeliveryDao" %>
<%@ page import="com.jhta.afterpay.delivery.Delivery" %>
<%@ page import="com.jhta.afterpay.product.ProductDao" %>
<%@ page import="com.jhta.afterpay.product.Image" %>
<%@ page import="com.jhta.afterpay.user.ReviewDao" %>
<%@ page import="com.jhta.afterpay.user.Review" %>
<%@ page import="com.jhta.afterpay.product.WishDao" %>
<%@ page import="com.jhta.afterpay.product.Wish" %>
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
  <title>AFTER PAY</title>
</head>
<style>
  h2{
    text-align: center;
  }
  #check-all{
    margin-left: 15px;
  }
  #check-del{
    margin-right: 20px;
  }
</style>
<body>
<%@include file="../common/nav.jsp"%>
<%
  int userNo = 19;
  WishDao wishDao = new WishDao();
  List<Wish> wishList = wishDao.getWishesByUserNo(userNo);
%>
<div class="container">
  <div class="container">
    <div class="row">
      <div class="col-2">
        <%@include file="../common/user-nav.jsp"%>
      </div>
      <div class="col-10">
        <h2 class="m-4"><strong>위시리스트</strong></h2>
        <hr style="border:solid 1px gray;"/>
        <%
          if (wishList.isEmpty()){
        %>
        <div class="text-center m-5">
          <strong>위시리스트 내역이 없습니다.</strong><br>
          <br>
          <a href="" type="button" class="btn btn-lg bg-light border-dark-subtle">지금 바로 쇼핑하러 가기</a>
        </div>
        <%
          } else {
        %>
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
                <%
                  for (Wish wish : wishList){
                    int productNo = wish.getProductNo();
                    ProductDao productDao = new ProductDao();
                    List<Image> images = productDao.getAllImagesByNo(productNo);
                  }
                %>
                <tr>
                  <td>
                    <input type="checkbox" name="stockNo" style="zoom: 1.5" onchange="checkSelect()" value="<%=wish.getStock().getNo()%>">
                  </td>
                  <td>
                    <input type="hidden" name="thumb">
                    <img src="../common/images/<%=images.get(0).getName()%>" class="rounded mx-auto d-block" width="170">
                  </td>
                  <td class="align-top">
                    <p></p>
                    <p style="font-size: 20px">
                      <input type="hidden" name="name" value="<%=wish.getName()%>">
                      <strong><%=wish.getName()%></strong>
                    </p>
                    <p>
                      <input type="hidden" name="size" value="<%=wish.getSize()%>">
                      사이즈: <strong><%=wish.getSize()%></strong>
                    </p>
                    <p>
                      <input type="hidden" name="amount" value="<%=wish.getAmount()%>">
                      수량: <strong><%=wish.getAmount()%> 개</strong>
                    </p>
                    <p>
                      <input type="hidden" name="price" value="<%=wish.getPrice()%>">
                      <Strong><%=Utils.toCurrency(wish.getPrice())%> 원</strong>
                    </p>
                  </td>
                  <td class="align-middle text-end">
                    <a href="../product/detail.jsp?pno=<%=wish.getNo()%>" class="btn btn-outline-primary">
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
        <%
          if (wishDao.getAllTotalRowsByUserNo(userNo) > 10) {
        %>
        <nav aria-label="Page navigation example m-3">
          <ul class="pagination justify-content-center">
            <%
              int pageNo = Utils.toInt(request.getParameter("page"), 1);
              int totalRows = wishDao.getAllTotalRowsByUserNo(userNo);
              Pagination pagination = new Pagination(pageNo, totalRows);
              if (pagination.getTotalRows() > 0) {
                int beginPage = pagination.getBeginPage();
                int endPage = pagination.getEndPage();
            %>
            <li class="page-item <%=pagination.isFirst() ? "disabled" : ""%>">
              <a class="page-link" href="wish-list.jsp?page=<%=pagination.getPrev()%>" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
              </a>
            </li>
            <%
              for (int num = beginPage; num <= endPage; num++){
            %>
            <li class="page-item">
              <a class="page-link <%=pageNo == num ? "active" : ""%>" href="wish-list.jsp?page=<%=num%>"><%=num%></a>
            </li>
            <%
              }
            %>
            <li class="page-item">
              <a class="page-link <%=pagination.isLast() ? "disabled" : ""%>" href="wish-list.jsp?page=<%=pagination.getNext()%>" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
              </a>
            </li>
            <%
              }
            %>
          </ul>
        </nav>
        <%
          }
        %>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
  function checkAll(){
    let isChecked = document.querySelector("[name=all]").checked;
    console.log('체크여부', isChecked);

    let checkBoxes = document.querySelectorAll("[name=wishNo]");
    checkBoxes.forEach(function (el) {
      el.checked = isChecked;
    })
  }

  function checkSelect() {
    let checkBoxes = document.querySelectorAll("[name=wishNo]");
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
