<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<html>
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
  <style>
  </style>
</head>
<body>
<%
  String menu = "공지사항";
%>
<%@ include file="/common/nav.jsp" %>
<%
//  if (loginedUserId == null) {
//    response.sendRedirect("/login-form.jsp");
//    return
//  }
%>
<div class="container">
  <h1>공지사항 작성폼</h1>
  <form class="border bg-light p-3" method="post" action="insert.jsp">
    <div class="mb-3">
      <label class="form-label">제목</label>
      <input type="text" class="form-control" name="title">
    </div>
    <div class="mb-3">
      <label class="form-label">내용</label>
      <input type="text" class="form-control" name="content">
    </div>
    <div>
      <button type="submit" class="btn btn-primary">등록</button>
    </div>
  </form>
</div>
<%@ include file="/common/footer.jsp" %>
</body>
</html>

