<%@ page import="com.jhta.afterpay.user.vo.Order" %>
<%@ page import="com.jhta.afterpay.user.dao.OrderDao" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.user.dao.ProductDao" %>
<%@ page import="com.jhta.afterpay.user.vo.Product" %>
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
  int userNo = Utils.toInt(request.getParameter("no"));
  OrderDao orderDao = new OrderDao();
//  List<Order> order = orderDao.getOrderByNo(userNo);
  ProductDao productDao = new ProductDao();
%>
<div class="container">
  <div class="container">
    <div class="row">
      <div class="col-2">
        <%@include file="../common/user-nav.jsp"%>
      </div>
      <div class="col-10">
        <h2 class="m-4"><strong>주문 내역</strong></h2>
        <hr style="border:solid 1px gray;"/>

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
            <th scope="row">
              <input class="form-check-input" type="checkbox" name="orderNo" onchange="checkSelect()" style="zoom: 1.5" value="check-item">
            </th>
            <td>
              <img src="/img/main2.png" class="rounded mx-auto d-block" width="170">
            </td>
            <td>
              <p style="font-size: 20px"><strong>상품명</strong></p>
              <p>사이즈</p>
              <p>수량</p>
              <p>구매일자</p>
            </td>
            <td>
              <div><a href="" type="submit" class="btn mt-1 btn-outline-info">상세보기</a></div>
              <!-- 이미 리뷰를 썼으면 '작성한 리뷰' -->
              <div><a href="" type="submit" class="btn mt-1 btn-outline-success">리뷰쓰기</a></div>
              <div><a href="" type="submit" class="btn mt-1 btn-outline-primary">재구매</a></div>
            </td>
          </tr>
          </tbody>
        </table>

        <nav aria-label="Page navigation example">
          <ul class="pagination justify-content-center">
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
              </a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
              </a>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
  function checkAll(){
    let isChecked = document.querySelector("[name=all]").checked;
    console.log('체크여부', isChecked);

    let checkBoxes = document.querySelectorAll("[name=orderNo]");
    checkBoxes.forEach(function (el) {
      el.checked = isChecked;
    })
  }

  function checkSelect() {
    let checkBoxes = document.querySelectorAll("[name=orderNo]");
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
