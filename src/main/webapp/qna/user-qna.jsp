<%@ page import="com.jhta.afterpay.qna.QnaDao" %>
<%@ page import="com.jhta.afterpay.qna.Qna" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.util.Pagination" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.product.Product" %>
<%@ page import="com.jhta.afterpay.product.ProductDao" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
  <link href="/common/css/style.css" rel="stylesheet">
  <title>AFTER PAY</title>
</head>
<style>
    h2 {
        text-align: center;
    }

</style>
<body>
<%@include file="../common/nav.jsp" %>
<%
  int userNo = 19;
  QnaDao qnaDao = new QnaDao();
  
  // 요청한 페이지 번호 조회
  int pageNo = Utils.toInt(request.getParameter("page"), 1);
  // 총 데이터 갯수 조회
  int totalRows = qnaDao.getNotDeletedTotalRows(userNo);
  // Pagination 객체 생성
  Pagination pagination = new Pagination(pageNo, totalRows);
  int begin = pagination.getBegin();
  int end = pagination.getEnd();
  int beginPage = pagination.getBeginPage();
  int endPage = pagination.getEndPage();
  List<Qna> qnaList = qnaDao.getNotDeletedQna(userNo, begin, end);
  int qnaCnt = pagination.getBegin();
%>
<div class="container">
  <div class="row">
    <div class="col-2"></div>
    <div class="col-10">
      <h2 class="mt-3"><strong>1:1 문의내역</strong></h2>
    </div>
  </div>
  <div class="row">
    <div class="col-2">
      <%@include file="../common/user-nav.jsp" %>
    </div>
    <div class="col-10">
      <form type="post" action="detail.jsp" id="qna">
        <hr style="border:solid 1px gray;"/>
        <div class="row mb-3">
          <div class="col-12">
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
                <th class="text-center">
                  <input id="check-all" type="checkbox" name="all" onchange="checkAll()" style="zoom:1.5">
                </th>
                <th scope="col">No</th>
                <th scope="col">문의 제목</th>
                <th scope="col">작성일</th>
                <th scope="col">답변상태</th>
              </tr>
              </thead>
              <tbody>
              <%
                if (qnaList.isEmpty()) {
              %>
              <tr>
                <td colspan="5" class="text-center">
                  등록된 문의가 없습니다.
                </td>
              </tr>
              <%
                }
                
                for (Qna qna : qnaList) {
              %>
              <tr class="text-center">
                <th scope="col">
                  <input type="checkbox" name="qnaNo" value="<%=qna.getNo()%>" onchange="checkSelect()" style="zoom:1.5">
                </th>
                <th scope="row"><%=qnaCnt++%>
                </th>
                <td class="text-start">
                  <a href="detail.jsp?no=<%=qna.getNo()%>" style="text-decoration-line: none">
                    <%=qna.getTitle()%>
                  </a>
                </td>
                <td><%=qna.getCreatedDate()%>
                </td>
                <td>
                  <%
                    if (qna.getRepliedContent() == null) {
                  %>
                  <span class="badge text-bg-secondary">답변대기</span>
                  <%
                  } else {
                  %>
                  <span class="badge text-bg-primary">답변완료</span>
                  <%
                    }
                  %>
                </td>
              </tr>
              <%
                }
              %>
              </tbody>
            </table>
          </div>
        </div>
        
        <div class="row mb-3">
          <div class="col-6">
            <%
              if (!qnaList.isEmpty()) {
            %>
            <div class="text-start">
              <button type="submit" class="btn" onclick="deleteQna()">
                <i class="bi bi-trash"></i>
                <span class="fs-6">선택삭제</span>
              </button>
            </div>
            <%
              }
            %>
          </div>
          <div class="col-6">
            <div class="text-end">
              <a href="form.jsp" type="button" class="btn btn-primary">
                문의글 작성
              </a>
            </div>
          </div>
        </div>
        
        <!--페이지네이션 -->
        <%
          if (qnaDao.getNotDeleteTotalRows(userNo) > 10) {
            if (pagination.getTotalRows() > 0) {
        %>
        <ul class="pagination justify-content-center">
          <li class="page-item <%=pagination.isFirst() ? "disabled" : "" %>">
            <a class="page-link" href="user-qna.jsp?page=<%=pagination.getPrev()%>">
              <i class="bi bi-arrow-left"></i>
            </a>
          </li>
          <%
            for (int num = beginPage; num <= endPage; num++) {
          %>
          <li class="page-item ">
            <a <%=pageNo == num? "active" : "" %> class="page-link" href="user-qna.jsp?page=<%=num%>">
              <%=num%>
            </a>
          </li>
          <%
            }
          %>
          <li class="page-item <%=pagination.isLast() ? "disabled" : ""%>">
            <a class="page-link" href="user-qna.jsp?page=<%=pagination.getNext()%>">
              <i class="bi bi-arrow-right"></i>
            </a>
          </li>
        </ul>
        <%
            }
          }
        %>
      </form>
    </div>
  </div>
</div>

<script type="text/javascript">
    function checkAll() {
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

        if (checkBoxesLength == checkedLength) {
            document.querySelector("[name=all]").checked = true;
        } else {
            document.querySelector("[name=all]").checked = false;
        }
    }

    function deleteQna() {
        // 체크된 문의번호를 조회
        let checkBoxes = document.querySelectorAll("input[type=checkbox][name=qnaNo]");
        let isChecked = false;
        // 체크된 문의가 한 건이라도 있으면 참 반환
        for (let checkBox of checkBoxes) {
            if (checkBox.checked) {
                isChecked = true;
                break;
            }
        }
        // 만약 하나도 선택이 안되면 알림 전송 후, 거짓 반환
        if (!isChecked) {
            alert("선택된 문의글이 없습니다.")
            let qnaDefineForm = document.getElementById("qna");
            qnaDefineForm.setAttribute("action", "user-qna.jsp");
            qnaDefineForm.submit();
            return false;
        }

        let qnaForm = document.getElementById("qna");
        qnaForm.setAttribute("action", "deletes.jsp");
        qnaForm.submit();

        // 체크된 문의가 있으면 해당 폼을 제출하는 것이 참
        return true;
    }
</script>
<%@include file="../common/footer.jsp" %>
</body>
</html>