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
        .container h1 {
            text-align: center;
        }
    </style>
</head>
<body>
<%
    String menu = "홈";
%>
<%@ include file="/common/nav.jsp" %>
<div class="container">
    <div class="row">
        <div class="my-5">
            <h1>공지 사항</h1>
        </div>
        <%
            int pageNo = Utils.toInt(request.getParameter("page"), 1);

            NoticeDao noticeDao = new NoticeDao();

            int totalRows = noticeDao.getTotalRows();

            Pagination pagination = new Pagination(pageNo, totalRows);
            List<Notice> notices = noticeDao.getNotices(pageNo, totalRows);
        %>
        <table class="table">
            <colgroup>

                <col width="*%">
                <col width="10%">
                <col width="10%">
                <col width="15%">
            </colgroup>
            <thead>
            <tr class="table-dark">

                <th>제목</th>
                <th>작성자</th>
                <th>조회수</th>
                <th>등록일</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (Notice notice : notices) {
            %>
            <tr>

                <td><a href="detail.jsp?nno=<%=notice.getNo()%>"><%=notice.getTitle()%></a></td>
                <td>관리자</td>
                <td>3</td>
                <td><%=notice.getCreatedDate()%>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <%
            if (session.getAttribute("USERID") != null) {
        %>
        <div class="float-end">
            <a href="/notice/form.jsp?" class="btn btn-primary">새 글</a>
        </div>
        <%
            }
        %>
        <%
            if (pagination.getTotalRows() > 0) {
                int beginPage = pagination.getBeginPage();
                int endPage = pagination.getEndPage();

        %>
        <div>
            <ul class="pagination justify-content-center">
                <li class="page-item <%=pagination.isFirst() ? "disabled" : ""%>">
                    <a href="list.jsp?page=<%=pagination.getPrev()%>" class="page-link">이전</a>
                </li>
                <%
                    for (int num = beginPage; num <= endPage; num++) {
                %>
                <li class="page-item">
                    <a href="list.jsp?page=<%=num%>" class="page-link <%=pageNo == num? "active" : ""%>">
                        <%=num%>
                    </a>
                </li>
                <%
                    }
                %>
                <li class="page-item <%=pagination.isLast() ? "disabled" : ""%>">
                    <a href="list.jsp?page<%=pagination.getNext()%>" class="page-link">다음</a>
                </li>
            </ul>
            <%
                }
            %>
        </div>
    </div>
</div>
<%@ include file="/common/footer.jsp" %>
</body>
</html>
