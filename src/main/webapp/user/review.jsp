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
<div class="container">
  <div class="row">
    <div class="col-2">
      <%@include file="../common/user-nav.jsp"%>
    </div>
    <div class="col-10">
      <h2 class="m-4"><strong>REVIEW</strong></h2>
      <hr style="border:solid 1px gray;"/>

      <table class="table">
        <colgroup>
          <col width="5%">
          <col width="10%">
          <col width="*">
          <col width="15%">
          <col width="5%">
        </colgroup>
        <thead>
          <tr class="text-center">
            <th scope="col">
              <input id="check-all" type="checkbox" style="zoom:1.8">
            </th>
              <th scope="col">No</th>
              <th scope="col">리뷰 제목</th>
              <th scope="col">작성일</th>
              <th scope="col" class="text-end">
                <button id="check-del" class="btn btn-lg">
                  <i class="bi bi-trash"></i>
                </button>
              </th>
          </tr>
        </thead>
        <tbody>
          <tr class="text-center">
            <th scope="col">
              <input type="checkbox" style="zoom:1.5">
            </th>
            <th scope="row">1</th>
            <td class="text-start">튼튼해요</td>
            <td>2024.09.10</td>
            <td></td>
          </tr>
            <tr>
              <th scope="col" class="text-center">
                    <input type="checkbox" style="zoom:1.5">
              </th>
              <th scope="row" class="text-center">2</th>
              <td>배송은 좀 느린데, 옷은 이쁨</td>
              <td class="text-center">2024.08.27</td>
              <td></td>
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
<%@include file="../common/footer.jsp"%>
</body>
</html>
