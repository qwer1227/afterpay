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
</style>
<body>
<%@include file="../common/nav.jsp"%>
<div class="container">
  <div class="row">
    <div class="col-2">
      <%@include file="../common/user-nav.jsp"%>
    </div>
    <div class="col-10">
      <h2 class="m-4"><strong>1:1 문의 상세</strong></h2>
      <hr style="border:solid 1px gray;"/>
      <table class="table table-borderless">
        <colgroup>
          <col width="10%">
          <col width="*">
        </colgroup>
        <thead>
        <tr>
          <th scope="col"></th>
          <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <th scope="row" class="text-center">카테고리</th>
          <td class="text-start">상품문의</td>
        </tr>
        <tr>
          <th scope="row" class="text-center">문의 제목</th>
          <td class="text-start">배송언제?</td>
        </tr>
        <tr>
          <th scope="row" class="text-center">답변 상태</th>
          <td class="text-start">답변완료</td>
        </tr>
        <tr>
          <th scope="row" class="text-center">상품 설명
          <td class="text-start">
            <textarea class="form-control" rows="5" name="description"></textarea>
          </td>
        </tr>
        </tbody>
      </table>

      <!-- 답변 상태가 "답변완료"면 수정 불가하게 -->
      <div class="text-end">
        <a href="form.jsp" type="button" class="btn btn-outline-warning">
          수정
        </a>
        <a href="delete.jsp" type="button" class="btn btn-outline-danger">
          삭제
        </a>
      </div>

      <!-- 답변 상태가 "답변완료"면 노출 -->
      <div class="m-3 card">
        <div class="card-header">문의 답변</div>
        <div class="card-body">추석연휴로 인해 배송지연이 있습니다. 순차적으로 배송될 예정입니다.</div>
      </div>

    </div>
  </div>
</div>
<%@include file="../common/footer.jsp"%>
</body>
</html>
