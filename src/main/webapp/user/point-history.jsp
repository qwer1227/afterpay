<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.user.dao.PointHistoryDao" %>
<%@ page import="com.jhta.afterpay.user.vo.PointHistory" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.user.dao.UserDao" %>
<%@ page import="com.jhta.afterpay.user.vo.User" %>
<%@ page import="java.util.Date" %>
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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.30.1/moment.min.js" type="text/javascript"></script>
  <title>AFTER PAY</title>
</head>
<style>
  h2{
    text-align: center;
  }
</style>
<body>
<%@include file="../common/nav.jsp"%>
<%
  // 1. 요청 파라미터값 조회
  int userNo = 19;
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
%>
<div class="container">
  <div class="row">
    <div class="col-2">
      <%@include file="../common/user-nav.jsp"%>
    </div>
    <div class="col-10">
      <div class="row mb-3">
        <div class="col-12">
          <h2 class="m-4"><strong>MY MILEAGE</strong></h2>
        </div>
      </div>
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
            <div class="card-body">
              <div class="d-flex justify-content-center">
                <form class="row row-cols-lg-auto g-3 align-items-center mb-3">
                  <div class="col-12">
                    <div class="input-group">
                      <div class="input-group-text">날짜</div>
                      <input type="month" class="form-control" name="month">
                    </div>
                  </div>
                  <div class="col-12">
                    <button type="button" class="btn btn-primary" onclick="changePointHistory()">조회</button>
                  </div>
                </form>

              </div>
            <table  class="table ">
              <tr>
                <th>적립일</th>
                <th>내용</th>
                <th>금액</th>
                <th>적립금 잔액</th>
              </tr>
              <%
                // for문으로 조회된 사용자 적립금 이력을 조회
                for(PointHistory point : pointList){
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
                <td><%=point.getHistoryDate()%></td>
                <td><%=point.getContent()%></td>
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
<script>
  document.querySelector("input[name=month]").value =  moment().format('YYYY-MM');
  changePointHistory();

  function changePointHistory() {
    console.log("갱신");
  }



</script>
<%@include file="../common/footer.jsp"%>
</body>
</html>
