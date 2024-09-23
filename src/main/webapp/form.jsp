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
<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
<link href="/common/css/style.css" rel="stylesheet">
<script src="js/regist.js"></script>
<html>
<head>
    <title>회원가입</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
            background-color: #f8f9fa; /* 페이지 배경색 */
        }

        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            width: 400px;
            margin: auto;
            margin-top: 40px;
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: 700;
            color: #555;
        }

        .form-control {
            border-radius: 5px;
            border: 1px solid #ced4da;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            padding: 10px;
            transition: background-color 0.3s;
            width: 100%;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .alert {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<%
    String message = null;
    if (request.getParameter("error") != null) {
        message = "중복된 아이디 혹은 이메일이 있습니다";
%>
<div class="alert alert-danger">
    <%= message %>
</div>
<%
    }
%>

<%@include file="common/nav.jsp" %>
<form class="container" method="post" action="insert.jsp" onsubmit="return sendit(this.form)">
    <h2 class="text-center mb-4">회원가입</h2>
    <div class="mb-3">
        <label class="form-label">이름*</label>
        <input class="form-control" type="text" name="user_name" id="user_name" placeholder="이름을 작성해주세요 예)홍길동">
    </div>
    <div class="mb-3">
        <label class="form-label">아이디*</label>
        <input class="form-control" type="text" name="user_id" id="user_id" placeholder="아이디를 입력해주세요 예)abc1234">
    </div>
    <div class="mb-3">
        <label class="form-label">비밀번호*</label>
        <input class="form-control" type="password" name="user_pw" id="user_pw" placeholder="대,소문자 및 특수문자 8~16자 이내">
    </div>
    <div class="mb-3">
        <label class="form-label">비밀번호 확인*</label>
        <input class="form-control" type="password" name="user_pw_vali" id="user_pw_vali" placeholder="한 번 더 입력해주세요">
    </div>
    <div class="mb-3">
        <label class="form-label">이메일*</label>
        <input class="form-control" type="email" name="user_email" id="user_email"
               placeholder="이메일을 입력해주세요 예)abc@gmail.com">
    </div>
    <div class="mb-3">
        <label class="form-label">전화번호*</label>
        <input class="form-control" type="text" name="user_phone" id="user_phone"
               placeholder="전화번호를 입력해주세요 예)01012345678">
    </div>
    <div class="text-end">
        <button type="submit" class="btn btn-primary" id="signup-button">가입하기</button>
    </div>
</form>
<%@include file="common/footer.jsp" %>
</body>
</html>
