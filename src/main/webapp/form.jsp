<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
<link href="/common/css/style.css" rel="stylesheet">
<link href="/common/css/user.css" rel="stylesheet">
<script src="js/regist.js"></script>
<html>
<head>
    <title>회원가입</title>

</head>
<body>
<%@include file="common/nav.jsp" %>
<div class="alert-container">
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
</div>

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
        <input class="form-control" type="email" name="user_email" id="user_email" placeholder="이메일을 입력해주세요 예)abc@gmail.com">
    </div>
    <div class="mb-3">
        <label class="form-label">전화번호*</label>
        <input class="form-control" type="text" name="user_phone" id="user_phone" placeholder="전화번호를 입력해주세요 예)010-1234-5678">
    </div>
    <div class="text-end">
        <button type="submit" class="btn btn-primary" id="signup-button">가입하기</button>
    </div>
    <div>
        <label for="terms">
            <input type="checkbox" id="terms" name="terms"> 이용약관에 동의합니다.
        </label>
    </div>

    <div>
        <textarea id="termsContent" readonly style="width: 100%; height: 200px; resize: none;">
            이용약관
        </textarea>
    </div>
</form>
<%@include file="common/footer.jsp" %>
</body>
</html>
