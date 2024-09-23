<%@ page import="com.jhta.afterpay.user.ReviewDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.user.Review" %>
<%@ page import="com.jhta.afterpay.util.DaoHelper" %>
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
<%
  int userNo = 19;
  ReviewDao reviewDao = new ReviewDao();
  List<Review> reviewList = reviewDao.getReviewsByUserNo(userNo);
  int reviewCnt = 1;
%>
<div class="container">
  <form type="post" action="delete-review.jsp">
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
            <col width="10%">
          </colgroup>
          <thead>
            <tr class="text-center">
              <th scope="col">
                <input id="check-all" type="checkbox" name="all" onchange="checkAll()" style="zoom:1.8">
              </th>
              <th scope="col">No</th>
              <th scope="col">리뷰 제목</th>
              <th scope="col">작성일</th>
              <th scope="col">별점</th>
            </tr>
          </thead>
          <tbody>
          <%
            if (reviewList.isEmpty()){
          %>
            <tr>
              <td colspan="5" class="text-center">
                작성된 리뷰가 없습니다.
              </td>
            </tr>
          <%
            }
            for(Review reviews : reviewList){
          %>
            <tr class="text-center">
              <th scope="col">
                <input type="checkbox" name="reviewNo" vlaue="<%=reviews.getNo()%>" onchange="checkSelect()" style="zoom:1.5">
              </th>
              <th scope="row"><%=reviewCnt++%></th>
              <td class="text-start">
                <!-- 상품 상세페이지의 리뷰로 페이지 이동 -->
                <a href="" style="text-decoration-line: none">
                  <%=reviews.getTitle()%>
                </a>
              </td>
              <td><%=reviews.getCreatedDate()%></td>
              <td><%=reviews.getRating()%></td>
            </tr>
          <%
            }
          %>
          </tbody>
        </table>
        <%
          if (!reviewList.isEmpty()){
        %>
          <div scope="col" class="text-start">
            <button type="submit" class="btn btn-lg" onclick="deleteQna()">
              <i class="bi bi-trash"></i><span class="fs-6">선택 삭제</span>
            </button>
          </div>
        <%
          }
        %>

        <nav aria-label="Page navigation example m-3">
          <ul class="pagination justify-content-center">
            <%
              int pageNo = Utils.toInt(request.getParameter("page"), 1);
              int totalRows = reviewDao.getAllTotalRowsByUserNo(userNo);
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

    let checkBoxes = document.querySelectorAll("[name=reviewNo]");
    checkBoxes.forEach(function (el) {
      el.checked = isChecked;
    })
  }

  function checkSelect() {
    let checkBoxes = document.querySelectorAll("[name=reviewNo]");
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
