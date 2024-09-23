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
<%@ include file="../../common/nav.jsp" %>
<div class="container mb-5"  style="margin-top: 100px;">
    <div class="rom mb-3">
        <div class="col-10 offset-1">
            <h2 class="text-center"><strong>회원정보 등록</strong></h2>
        </div>
    </div>

    <div class="row mb-3">
        <div class="col-2">
            <%@include file="../admin-nav.jsp"%>
        </div>
        <div class="col-10">
            <form class="p-3" method="post" action="insert.jsp">
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">이름</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="name">
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">아이디</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="id">
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">비밀번호</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="password" name="pwd">
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">전화번호</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="tel" name="tel">
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">이메일</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="email" name="email">
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">등급</label>
                    <div class="col-sm-10">
                        <select class="form-select" name="gradeId">
                            <option>회원 등급을 선택하세요</option>
                            <option value="BRONZE">브론즈</option>
                            <option value="SILVER">실버</option>
                            <option value="GOLD">골드</option>
                        </select>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">정지여부</label>
                    <div class="col-sm-10">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="isBanned" value="Y">
                            <label class="form-check-label">Y</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="isBanned" value="N">
                            <label class="form-check-label">N</label>
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">탈퇴여부</label>
                    <div class="col-sm-10">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="isSignOut" value="Y">
                            <label class="form-check-label">Y</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="isSignOut" value="N">
                            <label class="form-check-label">N</label>
                        </div>
                    </div>
                </div>
                <!--버튼-->
                <div class="text-end">
                    <a href="user.jsp" class="btn btn-secondary">등록취소</a>
                    <button type="submit" class="btn btn-primary">등록완료</button>
                </div>
            </form>

        </div>
    </div>
</div>
<%@ include file="../../common/footer.jsp" %>
</body>
</html>