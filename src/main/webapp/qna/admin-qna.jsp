<%@ page import="com.jhta.afterpay.qna.QnaDao" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.util.Pagination" %>
<%@ page import="com.jhta.afterpay.qna.Qna" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>QNA</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/common/css/style.css">
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<div class="container mb-5" style="margin-top: 100px;">
    <div class="row mb-3">
        <div class="col-9 offset-2">
            <h1 class="text-center">고객문의 게시판</h1>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col-2">
            <!-- 메뉴목록 -->
            <%@include file="../admin/admin-nav.jsp" %>
        </div>
        <div class="col-10">
            <!--문의목록-->
            <%
                QnaDao qnaDao = new QnaDao();

                // 요청페이지 번호를 조회한다.
                int pageNo = Utils.toInt(request.getParameter("page"), 1);

                // 총 데이터 갯수를 조회한다.
                int totalRows = qnaDao.getAllTotalRows();

                // Pagination 객체를 생성해서 페이지 번호와 데이터 총 갯수를 인수로 받는다.
                Pagination pagination = new Pagination(pageNo, totalRows);

                // 요청 페이지에 맞는 데이터를 조회한다.
                List<Qna> qnas = qnaDao.getAllQna(pagination.getBegin(), pagination.getEnd());
            %>
            <table class="table">
                <thead>
                <tr>
                    <th>문의번호</th>
                    <th>제목</th>
                    <th>작성일자</th>
                    <th>답변일자</th>
                    <th>답변상태</th>
                    <th>조회수</th>
                    <th>작성자</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (Qna qna : qnas) {
                %>
                <tr>
                    <td><%=qna.getNo()%>
                    </td>
                    <td><a href="detail.jsp?no=<%=qna.getNo()%>"><%=qna.getTitle()%>
                    </a></td>
                    <td><%=qna.getCreatedDate()%>
                    </td>
                    <td><%=qna.getRepliedDate()%>
                    </td>
                    <td>답변 준비중</td>
                    <td><%=qna.getCnt()%>
                    </td>
                    <td><%=qna.getUser().getName()%>
                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <!--페이지네이션 -->
            <%
                if (pagination.getTotalPages() > 0) {
            %>
            <div>
                <ul class="pagination justify-content-center">
                    <li class="page-item <%=pagination.isFirst() ? "disabled" : ""%>">
                        <a href="admin-qna.jsp?page=<%=pagination.getPrev() %>" class="page-link">이전</a>
                    </li>
                    <%
                        for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
                    %>
                    <li class="page-item <%=pageNo == num ? "active" : ""%>">
                        <a href="admin-qna.jsp?page=<%=num %>" class="page-link"><%=num %>
                        </a>
                    </li>
                    <%
                        }
                    %>
                    <li class="page-item <%=pagination.isLast()? "disabled" : ""%>">
                        <a href="admin-qna.jsp?page=<%=pagination.getNext()%>" class="page-link">다음</a>
                    </li>
                </ul>
            </div>
            <%
                }
            %>
        </div>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>
</body>
</html>
