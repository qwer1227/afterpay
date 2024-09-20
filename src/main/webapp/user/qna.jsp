<%@ page import="com.jhta.afterpay.user.dao.QnaDao" %>
<%@ page import="com.jhta.afterpay.user.vo.Qna" %>
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
      <%
        int userNo = 19;
        QnaDao qnaDao = new QnaDao();
        List<Qna> qnaList = qnaDao.getQnaByUserNo(userNo);
        int qnaCnt = 1;
      %>
    </div>
    <div class="col-10">
      <h2 class="m-4"><strong>1:1 문의내역</strong></h2>
      <hr style="border:solid 1px gray;"/>
      <table class="table">
        <colgroup>
          <col width="5%">
          <col width="10%">
          <col width="*">
          <col width="10%">
          <col width="15%">
          <col width="5%">
        </colgroup>
        <thead>
        <tr class="text-center">
          <th scope="col">
            <input id="check-all" type="checkbox" name="all" onchange="checkAll()" style="zoom:1.8">
            <script type="text/javascript">
              function checkAll(){
                let isChecked = document.querySelector("[name=all]").checked;
                console.log('체크여부', isChecked);

                let checkBoxes = document.querySelectorAll("[name=qnaNo]");
                checkBoxes.forEach(function (el) {
                  el.checked = isChecked;
                })
              }
            </script>
          </th>
          <th scope="col">No</th>
          <th scope="col">문의 제목</th>
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
          <%
            for(Qna qna : qnaList) {
          %>
          <th scope="col">
            <input type="checkbox" name="qnaNo" onchange="checkSelect()" style="zoom:1.5">
            <script type="text/javascript">
              function checkSelect() {
                let checkBoxes = document.querySelectorAll("[name=qnaNo]");
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
          </th>
          <th scope="row"><%=qnaCnt++%></th>
          <td class="text-start"><%=qna.getTitle()%></td>
          <td><%=qna.getCreatedDate()%></td>
          <td></td>
          <%
            }
          %>
        </tr>
        </tbody>
      </table>

      <div class="text-end">
        <a href="" type="button" class="btn btn-primary">
          문의글 작성
        </a>
      </div>
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
