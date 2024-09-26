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
  <title>AFTER PAY</title>
</head>
<style>
    h2 {
        text-align: center;
    }
</style>
<body>
<%@include file="../common/nav.jsp" %>

<div class="container">
  <div class="row">
    <div class="col-2"></div>
    <div class="col-10">
      <h2 class="mt-3"><strong>비밀번호 변경</strong></h2>
    </div>
  </div>
  <div class="row">
    <div class="col-2">
      <%@include file="../common/user-nav.jsp" %>
      <%
        int userNo = Utils.toInt(String.valueOf(session.getAttribute("USERNO")));
        
        if (userID == null) {
          response.sendRedirect("../login-form.jsp?deny");
          return;
        }
        
        UserDao userDao = new UserDao();
        User user = userDao.getUserByNo(userNo);
        String userPwd = user.getPwd();
      %>
    </div>
    <div class="col-10">
      <form method="post" action="changepw.jsp">
        <hr style="border:solid 1px gray;"/>
        <table class="table table-borderless">
          <thead>
          <tr>
            <th scope="col"></th>
            <th scope="col"></th>
            <th scope="col"></th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <th scope="row" class="text-center">변경 전 비밀번호</th>
            <td class="text-start">
              <input type="text" name="prevpwd">
            </td>
          </tr>
          <tr>
            <th scope="row" class="text-center">변경 후 비밀번호</th>
            <td class="text-start">
              <input type="text" name="pwd">
            </td>
          </tr>
          <tr>
            <th scope="row" class="text-center">비밀번호 확인</th>
            <td class="text-start">
              <input type="text" name="pwd">
            </td>
          </tr>
          </tbody>
        </table>

        <div class="text-end">
          <button type="submit">비밀번호 변경</button>
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>