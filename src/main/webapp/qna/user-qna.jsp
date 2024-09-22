<%@ page import="com.jhta.afterpay.qna.QnaDao" %>
<%@ page import="com.jhta.afterpay.qna.Qna" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.util.Pagination" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
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
  <form type="post" action="detail.jsp">
    <div class="row">
      <div class="col-2">
        <%@include file="../common/user-nav.jsp"%>
        <%
          int userNo = 19;
          QnaDao qnaDao = new QnaDao();
          List<Qna> qnaList = qnaDao.getQnaListByUserNo(userNo);
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
            <col width="15%">
            <col width="15%">
          </colgroup>
          <thead>
          <tr class="text-center">
            <th scope="col">
              <input id="check-all" type="checkbox" name="all" onchange="checkAll()" style="zoom:1.8">
            </th>
            <th scope="col">No</th>
            <th scope="col">문의 제목</th>
            <th scope="col">작성일</th>
            <th scope="col">답변상태</th>
          </tr>
          </thead>
          <tbody>
          <%
            if (qnaList.isEmpty()){
          %>
          <tr>
            <td colspan="5" class="text-center">
              등록된 문의가 없습니다.
            </td>
          </tr>
          <%
            }
          %>
          <%
            for (Qna qnas : qnaList) {
          %>
          <tr class="text-center">
            <th scope="col">
              <input type="checkbox" name="qnaNo" value="<%=qnas.getNo()%>" onchange="checkSelect()" style="zoom:1.5">
            </th>
            <th scope="row"><%=qnaCnt++%></th>
            <td class="text-start">
              <a href="detail.jsp?no=<%=qnas.getNo()%>" style="text-decoration-line: none">
                <%=qnas.getTitle()%>
              </a>
            </td>
            <td><%=qnas.getCreatedDate()%></td>
            <td>
              <%=qnas.getRepliedContent() == null ? "답변대기" : "답변완료"%>
            </td>
          </tr>
          <%
            }
          %>
          </tbody>
        </table>

        <div class="row">
          <%
            if(!qnaList.isEmpty()){
          %>
          <div class="text-start">
          <a href="delete.jsp?no=" class="btn btn-lg">
            <i class="bi bi-trash"></i>
            <span class="fs-6">선택삭제</span>
          </a>
          </div>
          <%
            }
          %>
          <div class="text-end">
          <a href="form.jsp" type="button" class="btn btn-primary">
            문의글 작성
          </a>
        </div>
        </div>
        <nav aria-label="Page navigation example">
          <ul class="pagination justify-content-center">
            <%
              int pageNo = Utils.toInt(request.getParameter("page"), 1);
              int totalRows = qnaDao.getAllTotalRowsByUserNo(userNo);
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
      </div>
    </div>
  </form>
</div>

<script type="text/javascript">
  function checkAll(){
    let isChecked = document.querySelector("[name=all]").checked;
    console.log('체크여부', isChecked);

    let checkBoxes = document.querySelectorAll("[name=qnaNo]");
    checkBoxes.forEach(function (el) {
      el.checked = isChecked;
    })
  }

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
<%@include file="../common/footer.jsp"%>
</body>
</html>
