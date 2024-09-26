<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.addr.AddrDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.addr.Addr" %>
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
      <h2 class="mt-3"><strong>배송지 관리</strong></h2>
    </div>
  </div>
  <div class="row">
    <div class="col-2">
      <%@include file="../common/user-nav.jsp" %>
      <%
        int userNo = Utils.toInt(String.valueOf(session.getAttribute("USERNO")));
        AddrDao addrDao = new AddrDao();
        List<Addr> addrList = addrDao.getAllAddrByUserNo(userNo);
      %>
    </div>
    <div class="col-10">
      <form method="post" action="change-address.jsp">
        <hr style="border:solid 1px gray;"/>
        <table class="table text-center">
          <colgroup>
            <col width="5%">
            <col width="5%">
            <col width="10%">
            <col width="15%">
            <col width="25%">
            <col width="*">
          </colgroup>
          <thead>
          <tr>
            <th></th>
            <th>home</th>
            <th>수취인</th>
            <th>배송지명</th>
            <th>연락처</th>
            <th>배송지 주소</th>
          </tr>
          </thead>
          <tbody>
          <%
            for (Addr addr : addrList) {
          %>
          <tr>
            <td><input type="checkbox" style="zoom: 1.5" id="check-addr" name="addrNo" value="<%=addr.getNo()%>"></td>
            <td>
              <%
                if (addr.getIsAddrHome().equals("Y")){
              %>
              <i class="bi bi-check-lg"></i>
              <%
                } else {
              %>
              <p></p>
              <%
                }
              %>
            </td>
            <td><%=addr.getRecipient()%></td>
            <td><%=addr.getName()%></td>
            <td><%=addr.getTel()%></td>
            <td><%=addr.getAddr1()%> <%=addr.getAddr2()%></td>
          </tr>
          <%
            }
          %>
          </tbody>
        </table>
        <div class="row mb-3">
          <div class="col-6 text-start">
            <button type="submit" class="btn btn-outline-dark">
              <i class="bi bi-arrow-repeat"></i>기본 배송지 변경
            </button>
          </div>
          <div class="col-6 text-end">
            <a href="" type="submit" class="btn btn-outline-primary">
              <i class="bi bi-plus-square"></i> 배송지 추가
            </a>
            <a href="" type="submit" class="btn btn-outline-warning">
              <i class="bi bi-cursor-text"></i>선택 수정
            </a>
            <a href="" type="submit" class="btn btn-outline-danger">
              <i class="bi bi-trash"></i>선택 삭제
            </a>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>