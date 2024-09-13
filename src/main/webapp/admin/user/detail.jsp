<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>AFTER PAY</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/common/css/style.css">
</head>
<body>
<%
    String menu = "회원 상세정보";
%>
<%@ include file="../../common/nav.jsp" %>
<div class="container mt-4 mb-5">
    <h1>회원 상세정보</h1>

    <table class="table table-bordered">
        <colgroup>
            <col width="15%">
            <col width="35%">
            <col width="15%">
            <col width="35%">
        </colgroup>
        <thead class="table-dark">
        <tr>
            <th>항목</th>
            <th>값</th>
            <th>항목</th>
            <th>값</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>이름</th>
            <td>민혜준</td>
            <th>아이디</th>
            <td>mnoqc</td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td>zxcv1234</td>
            <th>전화번호</th>
            <td>010-1234-5678</td>
        </tr>
        <tr>
            <th>이메일</th>
            <td>nmomnr@gmail.com</td>
            <th>적립금</th>
            <td>1,000,000 원</td>
        </tr>
        <tr>
            <th>가입일</th>
            <td>2024-09-13</td>
            <th>등급</th>
            <td>GOLD</td>
        </tr>
        <tr>
            <th>정지여부</th>
            <td>N</td>
            <th>탈퇴여부</th>
            <td>N</td>
        </tr>
        </tbody>
    </table>
    <!--버튼-->
    <div class="text-end my-2">
        <a href="#" class="btn btn-danger">회원삭제</a>
        <a href="#" class="btn btn-primary">회원수정</a>
    </div>
</div>
<%@ include file="../../common/footer.jsp" %>
</body>
</html>