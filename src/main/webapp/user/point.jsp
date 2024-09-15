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
  .text-center{
    border: 1px solid black;
  }
</style>
<body>
<%@include file="../common/nav.jsp"%>
<div class="container">
  <div class="row">
    <div class="col-2">
      <%@include file="../common/user-nav.jsp"%>
    </div>
    <div class="col-10">
      <h2 class="m-4"><strong>MY MILEAGE</strong></h2>
      <hr style="border:solid 1px gray;"/>

      <table border="1" class="table text-center table-borderless">
        <colgroup>
          <col width="10%">
          <col width="15%">
          <col width="15%">
          <col width="*">
        </colgroup>
        <tr>
          <th></th>
          <th class="fs-5">총 적립금</th>
          <th class="fs-5 text-end">10000 원</th>
          <th class="fs-4">잔여 적립금</th>
        </tr>
        <tr>
          <td></td>
          <td class="fs-5">사용 적립금</td>
          <td class="fs-5 text-end">6000 원</td>
          <td class="fs-3">4000 원</td>
        </tr>
        <tr>
          <td colspan="4">
            적립예정: 0 원
          </td>
        </tr>
      </table>

      <!-- 달력이 가운데오도록 차후에 변경 -->
      <input type="date" class="">

      <table border="1" class="table mt-3 text-center table-borderless">
        <tr>
          <th>적립일</th>
          <th>내용</th>
          <th>금액</th>
          <th>적립금 잔액</th>
        </tr>
        <tr>
          <td>2024.09.15</td>
          <td>재구매 감사</td>
          <td>3000</td>
          <td>4000 원</td>
        </tr>
        <tr>
          <td>2024.09.15</td>
          <td>적립금 사용</td>
          <td>-5000</td>
          <td>1000 원</td>
        </tr>
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
<%@include file="../common/footer.jsp"%>
</body>
</html>
