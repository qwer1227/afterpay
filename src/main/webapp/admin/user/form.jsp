<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>새 회원 등록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <form class="border bg-light p-3" method="post" action="insert.jsp">
        <div class="text-center">
            <h1>새 회원등록</h1>
        </div>

        <div class="mb-3">
            <label class="form-label">이름</label>
            <input type="text" class="form-control" name="name">
        </div>
        <div class="mb-3">
            <label class="form-label">아이디</label>
            <input type="text" class="form-control" name="id">
        </div>
        <div class="mb-3">
            <label class="form-label">비밀번호</label>
            <label>
                <input class="form-control" type="password" name="pwd">
            </label>
        </div>
        <div class="mb-3">
            <label>전화번호
                        <select>
                            <option value="010">010</option>
                            <option value="011">011</option>
                            <option value="012">012</option>
                            <option value="013">013</option>
                        </select>
                    -
                    <input name="" type="text">
                    -
                    <input name="" type="text">
            </label>
        </div>
        <div class="mb-3">
            <label class="form-label">이메일</label>
            <input class="form-control" type="email" name="email">
        </div>
        <div class="mb-3">
            <label class="form-label">등급</label>
            <select class="form-select" name="gradeId">
                <option>회원 등급을 선택하세요</option>
                <option value="11">브론즈</option>
                <option value="12">실버</option>
                <option value="13">골드</option>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">정지 여부</label>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="banStatus" value="banYes">
                <label class="form-check-label">Y</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="banStatus" value="banNo">
                <label class="form-check-label">N</label>
            </div>
        </div>
        <div class="mb-3">
            <label class="form-label">탈퇴 여부</label>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="signOutStatus" value="signOutYes">
                <label class="form-check-label">Y</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="signOutstatus" value="signOutNo">
                <label class="form-check-label">N</label>
            </div>
        </div>
        <div class="text-end">
            <a href="user.jsp" class="btn btn-secondary">취소</a>
            <button type="submit" class="btn btn-primary">등록</button>
        </div>
    </form>
</div>
</body>
</html>