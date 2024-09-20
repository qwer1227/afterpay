<%@ page import="com.jhta.afterpay.user.dao.UserDao" %>
<%@ page import="com.jhta.afterpay.user.vo.User" %>
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
      <%
        int userNo = 19;
        UserDao userDao = new UserDao();
        User user = userDao.getUserByNo(userNo);
        String userPwd = user.getPwd();
      %>
    </div>
    <div class="col-10">
      <h2 class="m-4"><strong>비밀번호 변경</strong></h2>
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
              <input type="text">
<%--              <%--%>
<%--                if (userPwd.equals('input에 입력한 값')){--%>
<%--               --%>
<%--                }  --%>
<%--              %>--%>
            </td>
          </tr>
          <tr>
            <th scope="row" class="text-center">변경 후 비밀번호</th>
            <td class="text-start">
              <input type="text">
            </td>
          </tr>
          <tr>
           <th scope="row" class="text-center">비밀번호 확인</th>
           <td class="text-start">
             <input type="text">
           </td>
          </tr>
        </tbody>
      </table>

      <div class="text-end">
        <a href="" type="button" class="btn btn-outline-danger">비밀번호 변경</a>
      </div>
    </div>
  </div>
</div>
</body>
</html>