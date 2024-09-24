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
<div class="container mb-5" style="margin-top: 100px;">
    <div class="rom mb-3">
        <div class="col-10 offset-1">
            <h2 class="text-center"><strong>적립금관리 페이지</strong></h2>
        </div>
    </div>

    <div class="row mb-3">
        <div class="col-2">
            <%@include file="../admin-nav.jsp" %>
        </div>
        <div class="col-10">
            <div class="row mb-3">
                <div class="card">
                    <div class="card-header">적립금 지급</div>
                    <div class="card-body pb-1">
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">아이디</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="name">
                            </div>
                            <div class="col-sm-3">
                                <button type="submit" class="btn btn-danger">조회</button>
                            </div>
                        </div>
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">적립금</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" name="name">
                        </div>
                        <div class="col-sm-3">
                            <button type="submit" class="btn btn-primary">확인</button>
                        </div>
                    </div>
                </div>
                </div>

                    <div class="row mt-3 mb-3">
                        <div class="col-sm-10">
                            <strong>[아이디] ADMIN</strong>
                        </div>
                        <div class="col-sm-10">
                            <strong>이름: 관리자</strong>
                        </div>
                        <div class="col-sm-10 border-bottom">
                            <strong>등급: GOLD</strong>
                        </div>
                        <div class="col-sm-10">
                            기존 적립금: 3800 원
                        </div>
                        <div class="col-sm-10">
                            추가 적립금: 400 원
                        </div>
                        <div class="col-sm-10">
                            총 보유 적립금: 4200 원
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@ include file="../../common/footer.jsp" %>

</body>
