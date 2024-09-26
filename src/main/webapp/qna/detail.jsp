<%@ page import="com.jhta.afterpay.qna.QnaDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.qna.Qna" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
    <link href="/common/css/style.css" rel="stylesheet">
    <title>AFTER PAY</title>
</head>
<style>
    h2 {
        text-align: center;
    }
</style>
<body>
<%@include file="../common/nav.jsp" %>
<%
    int qnaNo = Utils.toInt(request.getParameter("no"));
    QnaDao qnaDao = new QnaDao();
    Qna qna = qnaDao.getQnaByQnaNo(qnaNo);
%>
<div class="container">
    <form method="post" action="update.jsp?no=<%=qna.getNo()%>">
        <div class="row">
            <div class="col-2">
                <%@include file="../common/user-nav.jsp" %>
            </div>
            <div class="col-10">
                <h2 class="m-4"><strong>1:1 문의 상세</strong></h2>
                <hr style="border:solid 1px gray;"/>

                <table class="table table-borderless">
                    <colgroup>
                        <col width="10%">
                        <col width="40%">
                        <col width="10%">
                        <col width="40%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row" class="text-center">문의 제목</th>
                        <td class="text-start"><%=qna.getTitle()%>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="text-center">문의 일자</th>
                        <td class="text-start"><%=qna.getCreatedDate()%>
                        </td>
                        <th scope="row" class="text-center">답변 상태</th>
                        <%
                            if (qna.getRepliedContent() == null) {
                        %>
                        <td class="text-start">
                            <span class="badge text-bg-secondary">답변대기</span>
                        </td>
                        <%
                        } else {
                        %>
                        <td class="text-start">
                            <span class="badge text-bg-primary">답변완료</span>
                        </td>
                        <%
                            }
                        %>
                    </tr>
                    <tr>
                        <th scope="row" class="text-center">상세 문의</th>
                    </tr>
                    <tr>
                        <th class="text-start" colspan="4">
                            <%
                                if (qna.getRepliedContent() == null) {
                            %>
                            <textarea class="form-control" rows="5" name="description"><%=qna.getContent()%></textarea>
                            <%
                            } else {
                            %>
                            <div class="card">
                                <div class="card-body">
                                    <%=qna.getContent()%>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </th>
                    </tr>
                    </tbody>
                </table>

                <%
                    if (qna.getRepliedContent() != null) {
                %>
                <div class="m-3 card">
                    <div class="card-header text-center">문의 답변</div>
                    <div class="card-body">
                        <%=qna.getRepliedContent()%>
                    </div>
                </div>
                <%
                    }
                %>

                <div class="text-end m-3">
                    <a href="user-qna.jsp" type="button" class="btn btn-primary">
                        목록
                    </a>
                    <%
                        if (qna.getRepliedContent() == null) {
                    %>
                    <button type="submit" class="btn btn-warning">
                        수정
                    </button>
                    <a href="delete.jsp?no=<%=qna.getNo()%>" type="button" class="btn btn-danger">
                        삭제
                    </a>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </form>
    <!--관리자 답변 -->
<%
    if (userID != null && "ADMIN".equals(userID)) {
%>
    <div class="row">
        <div class="col-2"></div>
        <div class="col-10">
            <div class="mt-3">
                <%
                    if (qna.getRepliedContent() == null) {
                %>
                <label><h4><strong>관리자답변</strong></h4></label>
                <div class="border p-2 mb-2">
                    <div class="small d-flex justify-content-between">
                        <p>답변을 기달려주세요.</p>
                    </div>
                    <div>
                        <button type="button" class="btn btn-outline-dark btn-sm" onclick="showReply()">답변</button>
                        <a href="/qna/admin-qna.jsp" class="btn btn-outline-dark btn-sm">목록</a>
                    </div>
                </div>
                <%
                } else {
                %>
                <label><h4><strong>관리자답변</strong></h4></label>
                <div class="border p-2 mb-2">
                    <div class="small d-flex justify-content-between">
                        <div>
                            <span class="small">관리자</span>
                            <span class="small"><%=qna.getRepliedDate()%></span>
                        </div>
                        <div class="">
                            <button type="button" class="btn btn-outline-dark btn-sm" onclick="showForm()">수정</button>
                            <a href="delete-reply.jsp?no=<%=qnaNo%>" class="btn btn-outline-dark btn-sm">삭제</a>
                            <a href="/qna/admin-qna.jsp" class="btn btn-outline-dark btn-sm">목록</a>
                        </div>
                    </div>
                    <p class="mb-0"><%=qna.getRepliedContent()%>
                    </p>
                </div>
                <%
                    }
                %>
            </div>
            <form id="modify-form" class="border bg-light p-3 mt-3 d-none" method="post" action="update-reply.jsp">
                <input type="hidden" name="qno" value="<%=qna.getNo()%>"/>
                <div class="mb-3">
                    <textarea rows="3" class="form-control" name="content"></textarea>
                </div>
                <div class="text-end">
                    <button type="submit" class="btn btn-primary btn-sm">등록</button>
                </div>
            </form>

        </div>
    </div>
<%
    }
%>
</div>
<script type="text/javascript">
    function showForm() {
        document.getElementById("modify-form").classList.toggle("d-none");
    }

    function showReply() {
        document.getElementById("modify-form").classList.toggle("d-none");
    }
</script>
<%@include file="../common/footer.jsp" %>
</body>
</html>
