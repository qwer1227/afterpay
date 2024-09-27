<%@ page import="com.jhta.afterpay.notice.Notice" %>
<%@ page import="com.jhta.afterpay.notice.NoticeDao" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    Notice notice = new Notice();
    notice.setTitle(title);
    notice.setContent(content);

    NoticeDao noticeDao = new NoticeDao();
    noticeDao.insertNotice(notice);

    response.sendRedirect("/notice/list.jsp");
%>