<%@ page import="com.jhta.afterpay.user.UserDao" %>
<%@ page import="com.jhta.afterpay.addr.AddrDao" %>
<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
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
<%
    if (userID == null || !userID.equals("ADMIN")) {
        response.sendRedirect("/login-form.jsp?deny");
        return;
    } else {
%>
<div class="container mb-5" style="margin-top: 100px;">
    <div class="rom mb-3">
        <div class="col-10 offset-1">
            <h2 class="text-center"><strong>회원정보 수정</strong></h2>
        </div>
    </div>

    <div class="row mb-3">
        <div class="col-2">
            <%@include file="../admin-nav.jsp" %>
        </div>
        <div class="col-10">
            <%
                // http://localhost/user/modify-form.jsp?no=xxx
                // 파라미터값을 전달받아 해당하는 정보를 받아 회원정보 폼에 각 값을 나타낸다.
                UserDao userDao = new UserDao();

                // 세션에서 사용자 번호 가져온다.
                int userNo = Utils.toInt(request.getParameter("no"));
                User user = userDao.getUserByNo(userNo);
            %>
            <form class="p-3" method="post" action="update.jsp?<%=userNo%>">
                <input type="hidden" name="no" value="<%=user.getNo()%>">
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">이름</label>
                    <div class="col-sm-10">
                        <input class="form-control" name="name" value="<%=user.getName()%>" readonly="readonly">
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">아이디</label>
                    <div class="col-sm-10">
                        <input class="form-control" name="id" value="<%=user.getId()%>" readonly="readonly">
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">비밀번호</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="password" name="pwd" value="<%=user.getPwd()%>">
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">전화번호</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="tel" name="tel" value="<%=user.getTel()%>">
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">이메일</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="email" name="email" value="<%=user.getEmail()%>">
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">등급</label>
                    <div class="col-sm-10">
                        <select class="form-select" name="gradeId">
                            <option value="gradeId">회원 등급을 선택하세요</option>
                            <option value="BRONZE" <%= user.getGradeId() == "BRONZE" ? "selected" : "" %>>브론즈</option>
                            <option value="SILVER" <%= user.getGradeId() == "SILVER" ? "selected" : "" %>>실버</option>
                            <option value="GOLD" <%= user.getGradeId() == "GOLD" ? "selected" : "" %>>골드</option>
                        </select>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">정지여부</label>
                    <div class="col-sm-10">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="isBanned"
                                   value="Y" <% if("Y".equals(user.getIsBanned())){%>checked<%}%>>
                            <label class="form-check-label">Y</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="isBanned"
                                   value="N" <% if("N".equals(user.getIsBanned())){%>checked<%}%>>
                            <label class="form-check-label">N</label>
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">탈퇴여부</label>
                    <div class="col-sm-10">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="isSignOut"
                                   value="Y" <% if("Y".equals(user.getIsSignOut())){%>checked<%}%>>
                            <label class="form-check-label">Y</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="isSignOut"
                                   value="N" <% if("N".equals(user.getIsSignOut())){%>checked<%}%>>
                            <label class="form-check-label">N</label>
                        </div>
                    </div>
                </div>
                <!--버튼-->
                <div class="text-end my-2">
                    <a href="delete.jsp?no=<%=userNo%>" class="btn btn-danger">정보삭제</a>
                    <a href="user.jsp" class="btn btn-success">수정취소</a>
                    <button type="submit" class="btn btn-primary">수정완료</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="../../common/footer.jsp" %>
<%
    }
%>
</body>
</html>