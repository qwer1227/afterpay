<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.notice.NoticeDao" %>
<%@ page import="com.jhta.afterpay.util.Pagination" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.notice.Notice" %>
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
    String menu = "홈";
%>
<%@ include file="/common/nav.jsp" %>
<%
    int pageNo = Utils.toInt(request.getParameter("page"), 1);
    int noticeNo = Utils.toInt(request.getParameter("nno"));

    NoticeDao noticeDao = new NoticeDao();

    Notice notice = noticeDao.getNoticeDetailByNo(noticeNo);
%>
<div class="container">
    <div class="row mb-10">
        <div class="">
            <div class="card-header my-5">
                <h4>공지사항</h4>
            </div>
            <div class="card-body">
                <table class="table">
                    <colgroup>
                        <col width="15%"/>
                        <col width="*%"/>
                        <col width="10%"/>
                        <col width="10%"/>
                    </colgroup>
                    <tr>
                        <th>제목</th>
                        <td><%=notice.getTitle()%>
                        </td>
                        <th>작성자</th>
                        <td>관리자</td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><%=notice.getContent()%>
                        </td>
                    </tr>
                    <tr>
                        <th>조회수</th>
                        <td></td>
                        <th>작성일</th>
                        <td><%=notice.getCreatedDate()%>
                        </td>
                    </tr>
                </table>
                <div class="float-end">
                    <a href="/notice/form.jsp?nno=<%=noticeNo%>" class="btn btn-warning">수정</a>
                    <a href="/notice/delete.jsp?nno=<%=noticeNo%>" class="btn btn-danger">삭제</a>
                    <a href="/notice/list.jsp?page=<%=pageNo %>" class="btn btn-primary">목록</a>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/common/footer.jsp" %>
</body>
</html>

