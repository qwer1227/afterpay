<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-09-25
  Time: 오후 2:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href=common/css/style.css rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
    <link href="/common/css/style.css" rel="stylesheet">
</head>
<body>
<%@include file="../common/nav.jsp" %>
<%
    String zipcode = "";
    String addr1 = "";
    String addr2 = "";
%>
<div class="container">
    <ul class="list-unstyled">
        <li class="mt-1"><label>이름</label><input type="text" name="userName" class="form-control" required/>
        </li>
        <li class="mt-2 mb-2"><input type="button" id="addrListBtn" value="배송지 고르기" onclick="openAddrs()"
                                     class="btn btn-primary"></li>
        <li class="mt-1">
            <div class="col-12 input-group m-1">
                <input type="hidden" name="addrNo" value="" disabled>
                <label>우편번호</label><input type="text" id="sample6_postcode" name="zipcode" placeholder="우편번호"
                                          class="form-control" value="<%=zipcode%>" required readonly>
                <input type="button" class="btn btn-primary" onclick="sample6_execDaumPostcode()" value="검색"
                       class="col-2"></button>
            </div>
        </li>
        <li class="mt-1"><label>주소</label><input type="text" id="sample6_address" name="address"
                                                 placeholder="주소" class="form-control" value="<%=addr1%>"
                                                 required readonly><br></li>
        <li><label>상세주소</label> <input type="text" id="sample6_detailAddress" name="detailAddress"
                                       value="<%=addr2%>"
                                       placeholder="상세주소" class="form-control"></li>
        <li>
            <div id="addrNull">
                배송지 고르기 또는 우편번호 검색으로 주소를 입력해주세요.
            </div>
        </li>
        <li><input type="hidden" id="sample6_extraAddress" name="cham" placeholder="참고항목" class="form-control">
        </li>
    </ul>
</div>
<%@include file="../common/footer.jsp" %>
</body>
</html>
