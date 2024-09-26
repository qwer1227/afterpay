<%@ page import="com.jhta.afterpay.user.UserDao" %>
<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
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
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
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
  // http://localhost/user/modify-form.jsp?id=xxx
  // 파라미터값을 전달받아 해당하는 정보를 받아 회원정보 폼에 각 값을 나타낸다.
  UserDao userDao = new UserDao();

  // 세션에서 사용자 번호 가져온다.
  int userNo = Utils.toInt(String.valueOf(session.getAttribute("USERNO")));
  
  if (userID == null) {
    response.sendRedirect("../login-form.jsp?deny");
    return;
  }
  
  User user = userDao.getUserByNo(userNo);
%>

<div class="container">
  <div class="row">
    <div class="col-2"></div>
    <div class="col-10">
      <h2 class="mt-3"><strong>회원정보 수정</strong></h2>
    </div>
  </div>
  <div class="row">
    <div class="col-2">
      <%@include file="../common/user-nav.jsp" %>
    </div>
    <div class="col-10">
      <form action="update.jsp" method="post">
        <hr style="border:solid 1px gray;"/>
        <table class="table table-borderless">
          <colgroup>
            <col width="10%">
            <col width="30%">
            <col width="*">
          </colgroup>
          <thead>
          <tr>
            <th scope="col"></th>
            <th scope="col"></th>
            <th scope="col"></th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td scope="row" class="text-center">아이디</td>
            <td colspan="2"><%=user.getId()%>
            </td>
          </tr>
          <tr>
            <td scope="row" class="text-center">이름</td>
            <td colspan="2"><%=user.getName()%>
            </td>
          </tr>
          <tr>

            <td scope="row" class="text-center">연락처</td>
            <td>
              <input type="text" class="rounded" name="tel" value="<%=user.getTel()%>">
            </td>
          </tr>
          </tr>
          <%--            <tr>--%>
          <%--              <td scope="row" class="text-center">주소</td>--%>
          <%--              <td class="text-start">--%>
          <%--                <div class="mt-1">--%>
          <%--                  <div class="input-group">--%>
          <%--                    <input type="text" id="sample6_postcode" name="zipcode" placeholder="우편번호" class="form-control">--%>
          <%--                    <input type="button" class="btn btn-primary" onclick="sample6_execDaumPostcode()" value="검색">--%>
          <%--                  </div>--%>
          <%--                </div>--%>
          <%--              </td>--%>
          <%--              <td></td>--%>
          <%--            </tr>--%>
          <%--            <tr>--%>
          <%--              <td></td>--%>
          <%--              <td class="text-start" colspan="2">--%>
          <%--                <div class="mt-1">--%>
          <%--                  <div class="mt-1">--%>
          <%--                    <input type="text" id="sample6_address" name="address"--%>
          <%--                                                           placeholder="주소" class="form-control" required><br>--%>
          <%--                  </div>--%>
          <%--                  <div>--%>
          <%--                    <input type="text" id="sample6_detailAddress" name="detailAddress"--%>
          <%--                                                 placeholder="상세주소" class="form-control">--%>
          <%--                  </div>--%>
          <%--                </div>--%>
          <%--              </td>--%>
          </tr>
          <tr>
            <td scope="row" class="text-center">이메일</td>
            <td colspan="2">
              <input type="text" class="rounded" name="email" value="<%=user.getEmail()%>">
            </td>
          </tr>
          <tr>
            <td scope="row" class="text-center">가입일</td>
            <td colspan="2"><%=user.getCreatedDate()%>
            </td>
          </tr>
          </tbody>
        </table>

        <div class="text-end">
          <button type="submit" class="btn btn-outline-primary m-3">
            수정 저장
          </button>
        </div>
      </form>
    </div>
  </div>
</div>
<%@include file="../common/footer.jsp" %>
</body>
</html>
