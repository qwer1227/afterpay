<%@ page import="com.jhta.afterpay.qna.QnaDao" %>
<%@ page import="com.jhta.afterpay.qna.Qna" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>

<%
    // 조회
    int qnaNo = Utils.toInt(request.getParameter("qno"));
    QnaDao qnaDao = new QnaDao();
    Qna qna = qnaDao.getQnaByQnaNo(qnaNo);

    //
    qna.setNo(qnaNo);
    qna.setIsQnaDeleted("Y");
    qnaDao.updateQna(qna);

    //
    response.sendRedirect("detail.jsp?no="+qnaNo);
%>
