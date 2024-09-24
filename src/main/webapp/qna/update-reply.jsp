<%@ page import="com.jhta.afterpay.qna.Qna" %>
<%@ page import="com.jhta.afterpay.qna.QnaDao" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>

<%

    // 요청 파라미터 값 요청
    int qnaNo = Utils.toInt(request.getParameter("qno"));
    String content = request.getParameter("content");

    // Qna 객체에 답변 내용 넣기
    QnaDao qnaDao = new QnaDao();
    // Qna 객체에서 정보를 조회하기
    Qna qna = qnaDao.getQnaByQnaNo(qnaNo);

    qna.setNo(qnaNo);
    qna.setRepliedContent(content);
    qna.setRepliedDate(new Date());

    qnaDao.updateQna(qna);

    response.sendRedirect("detail.jsp?no="+qnaNo);
%>
