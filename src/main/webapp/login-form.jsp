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
<script src="js/login.js"></script>
<html>
<head>
    <title>로그인</title>
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
            margin-top: auto; /* 위쪽 여백 추가 */
            margin-bottom: 20px; /* 푸터와의 간격 */
        }

        h2 {
            margin-bottom: 20px;
            color: #333; /* 제목 색상 */
            text-align: center; /* 중앙 정렬 */
        }

        .form-label {
            font-weight: 700; /* 라벨 두껍게 */
            color: #555; /* 라벨 색상 */
        }

        .form-control {
            border-radius: 5px; /* 둥근 모서리 */
            border: 1px solid #ced4da; /* 테두리 색상 */
        }

        .form-control:focus {
            border-color: #007bff; /* 포커스 시 테두리 색상 변경 */
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25); /* 포커스 시 그림자 */
        }

        .btn-primary {
            background-color: #007bff; /* 버튼 배경색 */
            border: none; /* 테두리 제거 */
            border-radius: 5px; /* 둥근 모서리 */
            padding: 10px; /* 패딩 추가 */
            transition: background-color 0.3s; /* 부드러운 전환 효과 */
            width: 100%; /* 버튼을 전체 너비로 조정 */
        }

        .btn-primary:hover {
            background-color: #0056b3; /* 호버 시 색상 변경 */
        }

        .wrap_find {
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
            font-size: 0.9rem; /* 작은 폰트 크기 */
            text-align: center; /* 중앙 정렬 */
        }

        .join {
            margin-top: 20px;
            text-align: center; /* 중앙 정렬 */
        }

        footer {
            padding: 20px; /* 푸터 여백 */
            text-align: center; /* 중앙 정렬 */
            background-color: #f1f1f1; /* 푸터 배경색 */
        }
    </style>
</head>
<body>
<%
    String message = null;
    if (request.getParameter("invaild") != null) {
        message = "아이디 혹은 비밀번호가 올바르지 않습니다.";
    }

    if (request.getParameter("disabled") != null) {
        message = "사용이 정지된 사용자는 로그인할 수 없습니다.";
    }

    if (request.getParameter("deny") != null) {
        message = "로그인이 필요한 서비스입니다";
    }
%>

<%
    if (message != null) {
%>
<div class="alert alert-danger">
    <%= message %>
</div>
<%
    }
%>
<%@include file="common/nav.jsp" %>
<div class="container">
    <h2>로그인</h2>
    <form method="post" action="login.jsp" onsubmit="return sendit(this.form)">
        <div class="mb-3">
            <label class="form-label">아이디</label>
            <input class="form-control" type="text" name="id" id="user_id" placeholder="아이디를 입력해주세요">
        </div>
        <div class="mb-3">
            <label class="form-label">비밀번호</label>
            <input class="form-control" type="password" name="pwd" id="user_pw" placeholder="비밀번호를 입력해주세요">
        </div>
        <button type="submit" class="btn btn-primary">로그인</button>
        <div class="wrap_find">
            <a href="findid-form.jsp">아이디 찾기</a>
            <a href="findpw-form.jsp">비밀번호 찾기</a>
        </div>
        <div class="join">
            <a href="form.jsp" class="btn btn-primary">회원가입</a>
        </div>
    </form>
</div>
<%@include file="common/footer.jsp" %>
</body>
</html>
