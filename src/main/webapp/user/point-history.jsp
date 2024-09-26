<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.user.PointHistoryDao" %>
<%@ page import="com.jhta.afterpay.user.PointHistory" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.user.UserDao" %>
<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.jhta.afterpay.util.Pagination" %>
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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.30.1/moment.min.js" type="text/javascript"></script>
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
  // 1. 요청 파라미터값 조회
  int userNo = Utils.toInt(String.valueOf(session.getAttribute("USERNO")));
  
  if (userID == null) {
    response.sendRedirect("../login-form.jsp?deny");
    return;
  }
  
  int usedPoint = Utils.toInt(request.getParameter("usedPoint"));
  int depositPoint = Utils.toInt(request.getParameter("depositPoint"));
  boolean isPointChanged = false;
  
  // 2. UserDao 객체 생성하여 사용자 적립금 정보 조회 -> 1건으로 나옴
  UserDao userDao = new UserDao();
  User user = userDao.getUserByNo(userNo);
  // 3. PointHistoryDao 객체 생성하여 포인트 이력 정보 조회 -> 여러 건으로 나옴
  PointHistoryDao pointDao = new PointHistoryDao();
  PointHistory history = new PointHistory();
  List<PointHistory> pointList = pointDao.getPointHistoriesByUserNo(userNo);
  
  // 요청한 페이지 번호 조회
  int pageNo = Utils.toInt(request.getParameter("page"), 1);
  // 총 데이터 갯수 조회
  int totalRows = pointDao.getAllTotalRows();
  // Pagination 객체 생성
  Pagination pagination = new Pagination(pageNo, totalRows);
  int beginPage = pagination.getBegin();
  int endPage = pagination.getEnd();
  List<PointHistory> pointHistoryList = pointDao.getAllQnaByUserNo(beginPage, endPage);
%>
<div class="container">
  <div class="row">
    <div class="col-2"></div>
    <div class="col-10">
      <h2 class="mt-3"><strong>MY MILEAGE</strong></h2>
    </div>
  </div>
  <div class="row">
    <div class="col-2">
      <%@include file="../common/user-nav.jsp" %>
    </div>
    <div class="col-10">
      <hr style="border:solid 1px gray;"/>
      <div class="row mb-3">
        <div class="col-12">
          <div class="card">
            <div class="card-header">적립금 현황</div>
            <div class="card-body pb-1">
              <table class="table table-borderless">
                <colgroup>
                  <col width="10%">
                  <col width="15%">
                  <col width="15%">
                  <col width="*">
                </colgroup>
                <tr>
                  <th></th>
                  <th class="fs-5">총 적립금</th>
                  <th class="fs-5 text-end"><%=user.getTotalPoint()%> 원</th>
                  <th class="fs-4 text-center">잔여 적립금</th>
                </tr>
                <tr>
                  <td></td>
                  <td class="fs-5">사용 적립금</td>
                  <td class="fs-5 text-end"><%=user.getTotalUsedPoint()%> 원</td>
                  <td class="fs-3 text-center"><%=user.getPoint()%> 원</td>
                </tr>
              </table>
            </div>
          </div>
        </div>
      </div>
      
      <div class="row mb-3">
        <div class="col-12">
          <div class="card">
            <div class="card-header">적립금 변경 이력</div>
            <div class="card-body text-center">
<%--              <div class="d-flex justify-content-center">--%>
<%--                <form class="row row-cols-lg-auto g-3 align-items-center mb-3">--%>
<%--                  <div class="col-12">--%>
<%--                    <div class="input-group">--%>
<%--                      <div class="input-group-text">조회월</div>--%>
<%--                      <input type="month" class="form-control" name="month">--%>
<%--                    </div>--%>
<%--                  </div>--%>
<%--                  <div class="col-12">--%>
<%--                    <!-- 조회월에 맞춰 적립금 내역이 달라지게 구현 -->--%>
<%--                    <button type="button" class="btn btn-primary" onclick="changePointHistory()">--%>
<%--                      조회--%>
<%--                    </button>--%>
<%--                  </div>--%>
<%--                </form>--%>
<%--              </div>--%>
              
              <table class="table text-center m-3">
                <colgroup>
                  <col width="20%">
                  <col width="*">
                  <col width="15%">
                  <col width="25%">
                </colgroup>
                <tr>
                  <th>적립일</th>
                  <th>내용</th>
                  <th>금액</th>
                  <th>적립금 잔액</th>
                </tr>
                <%
                  // for문으로 조회된 사용자 적립금 이력을 조회
                  for (PointHistory point : pointList) {
                    // 만약 사용 적립금이 있으면,
                    if (usedPoint > 0) {
                      isPointChanged = true;
                      history.setContent(point.getContent());
                      history.setHistoryDate(new Date());
                      history.setPoint(usedPoint);
                      history.setCurrentPoint(user.getPoint() - usedPoint);
                      history.setUserNo(user);
                      // 사용 적립금에 대한 내용을 history 객체에 담아 point_histories DB에 insert
                      pointDao.insertHistory(history);
                      // 사용 적립금에 대한 내용을 user 객체에 담아 users DB에 반영
                      user.setPoint(user.getPoint() - usedPoint);
                      user.setTotalUsedPoint(user.getTotalUsedPoint() + usedPoint);
                    }
                    
                    // 만약 적립될 금액이 있으면,
                    if (depositPoint > 0) {
                      isPointChanged = true;
                      history.setContent(point.getContent());
                      history.setHistoryDate(new Date());
                      history.setPoint(depositPoint);
                      history.setCurrentPoint(user.getPoint() + depositPoint);
                      history.setUserNo(user);
                      // 적립금에 대한 내용을 history 객체에 담아 point_histories DB에 insert
                      pointDao.insertHistory(history);
                      // 적립금에 대한 내용을 user 객체에 담아 users DB에 반영
                      user.setPoint(user.getPoint() + depositPoint);
                      user.setTotalUsedPoint(user.getTotalPoint() + depositPoint);
                    }
                    
                    // 만약 적립금을 사용하지도, 적립되지도 않는다면 사용자 정보 update
                    if (isPointChanged) {
                      userDao.updateUser(user);
                    }
                %>
                <tr>
                  <td><%=point.getHistoryDate()%>
                  </td>
                  <td><%=point.getContent()%>
                  </td>
                  <td><%=Utils.toCurrency(point.getPoint())%> 원</td>
                  <td><%=Utils.toCurrency(point.getCurrentPoint())%> 원</td>
                </tr>
                <%
                  }
                %>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</div>

<%
  if (pointDao.getAllTotalRows() > 10) {
    if (pagination.getTotalPages() > 0) {
%>
<ul class="pagination justify-content-center">
  <li class="page-item <%=pagination.isFirst() ? "disabled" : ""%>">
    <a class="page-link" href="review.jsp?page=<%=pagination.getPrev()%>">
      <i class="bi bi-arrow-left"></i>
    </a>
  </li>
  <%
    for (int num = beginPage; num <= endPage; num++) {
  %>
  <li class="page-item <%=pageNo == num ? "active" : ""%>">
    <a class="page-link" href="review.jsp?page=<%=num%>">
      <%=num%>
    </a>
  </li>
  <%
    }
  %>
  <li class="page-item <%=pagination.isLast() ? "disabled" : ""%>">
    <a class="page-link" href="review.jsp?page=<%=pagination.getNext()%>">
      <i class="bi bi-arrow-right"></i>
    </a>
  </li>
</ul>
<%
    }
  }
%>

</div>
</div>
</div>
<script>
    document.querySelector("input[name=month]").value = moment().format('YYYY-MM');
    changePointHistory();

    function changePointHistory() {
        // 사용자가 월을 선택하면 해당 값을 date에 저장
        let date = document.querySelector("input[name=month]").find('YYYY-MM');
        
        let xhr = new XMLHttpRequest();
        // xhr로 정보를 읽어서 값 요청 전달하는 함수 실행
        xhr.onreadystatechange = function (){
            // readyState : 서버로부터 실행완료된 값을 전달받음
            // status : 200번이 오면 성공/(400 요청 잘못)/(500 서버 오류)
          if (xhr.readyState = 4 && xhr.status == 200){
              let text = xhr.responseText;
              let arr = JSON.parse(text);
          }
          xhr.open("GET", "point.jsp?date=" + date);
          xhr.send();
        }
    }


</script>
<%@include file="../common/footer.jsp" %>
</body>
</html>
