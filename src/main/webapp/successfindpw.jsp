<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&display=swap" rel="stylesheet">
<link href="/common/css/style.css" rel="stylesheet">
<html>
<head>
    <title>임시 비밀번호 전송 완료</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* 화면 전체 높이 */
            margin: 0;
        }

        .container {
            background-color: #fff; /* 흰색 배경 */
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
            width: 400px; /* 고정 너비 */
            margin: auto; /* 중앙 정렬 */
            margin-top: 120px; /* 위쪽 여백 추가 */
            text-align: center; /* 중앙 정렬 */
        }

        h2 {
            margin-bottom: 20px;
            color: #333; /* 제목 색상 */
        }

        .btn-primary {
            margin-top: 20px; /* 버튼 위쪽 여백 */
        }
    </style>
</head>
<body>
<%
    String email = (String) session.getAttribute("userEmail");
    if(email == null){
        response.sendRedirect("findpw-form.jsp?error");
        return;
    }
%>
<%@include file="common/nav.jsp" %>
<div class="container">
    <h2>임시 비밀번호 전송 완료</h2>
    <p>입력하신 <%= email %>로 임시 비밀번호가 전송되었습니다.</p>
    <a href="changepw-form.jsp" class="btn btn-primary">비밀번호 변경하기</a>
</div>
<%@include file="common/footer.jsp" %>
</body>
</html>
