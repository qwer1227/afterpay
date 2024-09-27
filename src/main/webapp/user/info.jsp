<%@ page import="com.jhta.afterpay.user.UserDao" %>
<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.addr.AddrDao" %>
<%@ page import="com.jhta.afterpay.addr.Addr" %>
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
<%
  // 파라미터값을 전달받아 해당하는 정보를 받아 회원정보 폼에 각 값을 나타낸다.
  int userNo = Utils.toInt(String.valueOf(session.getAttribute("USERNO")));
  String userId = String.valueOf(session.getAttribute("USERID"));
  
  if (userId == null) {
    response.sendRedirect("../login-form.jsp?deny");
    return;
  }
  
  UserDao userDao = new UserDao();
  User user = userDao.getUserByNo(userNo);
  AddrDao addrDao = new AddrDao();
  Addr addr = addrDao.getAddrByUserNo(userNo);
%>

<div class="container">
  <div class="row">
    <div class="col-2"></div>
    <div class="col-10">
      <h2 class="mt-3"><strong>회원정보 관리</strong></h2>
    </div>
  </div>
  <div class="row">
    <div class="col-2">
      <%@include file="../common/user-nav.jsp"%>
    </div>
    <div class="col-10">
      <hr style="border:solid 1px gray;"/>
      <table class="table table-borderless">
        <thead>
            <tr>
              <th scope="col"></th>
              <th scope="col"></th>
            </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row" class="text-center">아이디</th>
            <td class="text-start"><%=user.getId()%></td>
          </tr>
          <tr>
            <th scope="row" class="text-center">이름</th>
            <td class="text-start"><%=user.getName()%></td>
          </tr>
          <tr>
            <th scope="row" class="text-center">연락처</th>
            <td class="text-start"><%=user.getTel()%></td>
          </tr>
          <tr>
            <th scope="row" class="text-center">주소</th>
            <td class="text-start"><%=addr.getAddr1()%> <%=addr.getAddr2()%></td>
          </tr>
          <tr>
            <th scope="row" class="text-center">이메일</th>
            <td><%=user.getEmail()%></td>
          </tr>
          <tr>
            <th scope="row" class="text-center">가입일</th>
            <td><%=user.getCreatedDate()%></td>
          </tr>
        </tbody>
      </table>
      <div class="text-end">
        <a href="modify-info-form.jsp" type="submit" class="btn btn-outline-secondary">
            회원정보 수정
        </a>
        <a href="modify-address-form.jsp" type="submit" class="btn btn-outline-primary">
            배송지 관리
        </a>
        <a href="modify-pwd-form.jsp" type="submit" class="btn btn-outline-warning">
            비밀번호 변경
        </a>
        <!-- 성민님이 작업한 회원탈퇴로 이동 -->
        <a href="isdeleted.jsp" type="submit" class="btn btn-outline-danger">
            회원 탈퇴
        </a>
      </div>
    </div>
  </div>
</div>
<%@include file="../common/footer.jsp"%>
</body>
</html>
