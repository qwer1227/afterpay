<%@ page import="com.jhta.afterpay.user.QnaDao" %>
<%@ page import="com.jhta.afterpay.user.Qna" %>
<%@ page import="java.util.List" %>
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
    <div class="col-12 mb-3">
      <h2 class="m-4"><strong>1:1 문의하기</strong></h2>
      <hr style="border:solid 1px gray;"/>
      <form class="border bg-light p-3" method="post" action="qna-insert.jsp">
        <div class="mb-3">
          <label class="form-label">문의 카테고리</label>
          <select class="form-select" name="catNo">
            <option>문의 카테고리를 선택하세요</option>
            <option value="11">상품 문의</option>
            <option value="12">반품 문의</option>
            <option value="13">환불 문의</option>
            <option value="14">취소 문의</option>
            <option value="21">배송 문의</option>
            <option value="22">기타 문의</option>
          </select>
        </div>
        <div class="mb-3">
          <label class="form-label">문의 제목</label>
          <input type="text" class="form-control" name="title">
        </div>
        <div class="mb-3">
          <label class="form-label">상품 설명</label>
          <textarea class="form-control" rows="5" name="description"></textarea>
        </div>
        <div class="text-end">
          <a href="" type="button" class="btn btn-primary">
            문의하기
          </a>
        </div>
      </form>
    </div>
  </div>
</div>
<%@include file="../common/footer.jsp"%>
</body>
</html>