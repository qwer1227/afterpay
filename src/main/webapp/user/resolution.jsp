<%@ page import="com.jhta.afterpay.util.Pagination" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.order.OrderDao" %>
<%@ page import="com.jhta.afterpay.order.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.product.ProductDao" %>
<%@ page import="com.jhta.afterpay.product.Image" %>
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
  OrderDao orderDao = new OrderDao();
  List<Order> orderList = orderDao.getAllOrderByUserNo(userNo);
%>
<div class="container">
  <div class="container">
    <div class="row">
      <div class="col-2">
        <%@include file="../common/user-nav.jsp"%>
      </div>
      <div class="col-10">
        <h2 class="m-4"><strong>취소/교환/환불</strong></h2>
        <hr style="border:solid 1px gray;"/>
          <%
          if (orderList.isEmpty()){
        %>
        <div class="text-center m-5">
          <strong>취소/반품/환불 내역이 없습니다.</strong><br>
        </div>
          <%
          } else {
        %>
        <table class="table">
          <colgroup>
            <col width="1%">
            <col width="15%">
            <col width="*">
            <col width="15%">
          </colgroup>
          <thead>
          <tr>
            <th scope="col">
              <input id="check-all" type="checkbox" name="all" onchange="checkAll()" style="zoom:1.8">
            </th>
            <th scope="col"></th>
            <th scope="col"></th>
            <th scope="col" class="text-end">
              <button id="check-del" class="btn btn-lg">
                <i class="bi bi-trash"></i>
              </button>
            </th>
          </tr>
          </thead>

          <tbody>
          <tr class="align-middle">
            <%
              for (Order order : orderList){
                ProductDao productDao = new ProductDao();
                List<Image> images = productDao.getAllImagesByNo(order.getProducts().get(0).getNo());
            %>
            <th scope="row">
              <input class="form-check-input" type="checkbox" name="orderNo" onchange="checkSelect()" style="zoom: 1.5" value="check-item">
            </th>
            <td>
              <img src="/img/<%=images.get(0).getName()%>" class="rounded mx-auto d-block" width="150">
            </td>
            <td>
              <p style="font-size: 20px">
                <strong><%=order.getProducts().get(0).getName()%></strong>
              </p>
              <p>사이즈: </p>
              <p>수량: <%=order.getAmount()%> 개</p>
              <p>결제금액: <%=Utils.toCurrency(order.getPaymentPrice())%> 원</p>
              <p>구매일자: <%=order.getOrderDate()%></p>
            </td>
            <td class="text-center">
              <div><a href="" type="submit" class="btn mt-1 btn-outline-info">상세보기</a></div>
              <div><a href="" type="submit" class="btn mt-1 btn-outline-success">장바구니</a></div>
              <div><a href="" type="submit" class="btn mt-1 btn-outline-primary">재구매</a></div>
            </td>
            <%
              }
            %>
          </tr>
          </tbody>
        </table>

          <%
            if (orderDao.getAllTotalRowsByUserNo(userNo) > 10) {
        %>
        <nav aria-label="Page navigation example m-3">
          <ul class="pagination justify-content-center">
            <%
              int pageNo = Utils.toInt(request.getParameter("page"), 1);
              int totalRows = orderDao.getAllTotalRowsByUserNo(userNo);
              Pagination pagination = new Pagination(pageNo, totalRows);
              if (pagination.getTotalRows() > 0) {
                int beginPage = pagination.getBeginPage();
                int endPage = pagination.getEndPage();
            %>
            <li class="page-item <%=pagination.isFirst() ? "disabled" : ""%>">
              <a class="page-link" href="user-qna.jsp?page=<%=pagination.getPrev()%>" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
              </a>
            </li>
            <%
              for (int num = beginPage; num <= endPage; num++){
            %>
            <li class="page-item">
              <a class="page-link <%=pageNo == num ? "active" : ""%>" href="user-qna.jsp?page=<%=num%>"><%=num%></a>
            </li>
            <%
              }
            %>
            <li class="page-item">
              <a class="page-link <%=pagination.isLast() ? "disabled" : ""%>" href="user-qna.jsp?page=<%=pagination.getNext()%>" aria-label="Next">
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
          }
        %>
    </div>
  </div>
</div>

<script type="text/javascript">
  function checkAll(){
    let isChecked = document.querySelector("[name=all]").checked;
    console.log('체크여부', isChecked);

    let checkBoxes = document.querySelectorAll("[name=resolutionNo]");
    checkBoxes.forEach(function (el) {
      el.checked = isChecked;
    })
  }

  function checkSelect() {
    let checkBoxes = document.querySelectorAll("[name=resolutionNo]");
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
