<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.user.*" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>회원 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <%
        UserDao userDao = new UserDao();
        PointHistoryDao pointHistoryDao = new PointHistoryDao();

        List<User> users = userDao.getAllUsers();
        List<PointHistory> pointHistories = pointHistoryDao.getPointHistoriesByUserNo();

        int userNo = Utils.toInt(request.getParameter("no"));

        User user = userDao.getUserByNo(userNo);
    %>
    <form class="border bg-light p-3" method="post" action="update.jsp?no=<%=userNo%>">
        <div class="text-center">
            <h1>회원 수정</h1>
        </div>
        <div class="mb-3">
            <label class="form-label">이름</label>
            <input type="text" class="form-control" name="name" value="<%=user.getName() %>" readonly="readonly">
        </div>
        <div class="mb-3">
            <label class="form-label">아이디</label>
            <input type="text" class="form-control" name="id" value="<%=user.getId() %>" readonly="readonly">
        </div>
        <div class="mb-3">
            <label class="form-label">비밀번호</label>
            <label>
                <input class="form-control" type="password" name="pwd" value="<%=user.getPwd() %>">
            </label>
            <label class="form-label">비밀번호 확인?</label>
            <label>
                <input class="form-control" type="password" name="pwd" value="<%=user.getPwd() %>">
            </label>
        </div>
        <div class="mb-3">
            <label class="form-label">전화번호</label>
            <input class="form-control" type="tel" name="tel" value="<%=user.getTel() %>">
        </div>
        <div class="mb-3">
            <label class="form-label">이메일</label>
            <input class="form-control" type="email" name="email" value="<%=user.getEmail() %>">
        </div>
        <div class="mb-3">
            <label class="form-label">등급</label>
            <select class="form-select" name="gradeId">
                <option>회원 등급을 선택하세요</option>
                <option value="BRONZE">브론즈</option>
                <option value="SILVER">실버</option>
                <option value="GOLD">골드</option>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">정지 여부</label>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="isBanned" value="Y" >
                <label class="form-check-label">Y</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="isBanned" value="N">
                <label class="form-check-label">N</label>
            </div>
        </div>
        <div class="mb-3">
            <label class="form-label">탈퇴 여부</label>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="isSignOut" value="Y">
                <label class="form-check-label">Y</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="isSignOut" value="N">
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