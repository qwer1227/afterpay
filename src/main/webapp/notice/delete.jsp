<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.notice.NoticeDao" %>
<%@ page import="com.jhta.afterpay.notice.Notice" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
  int noticeNo = Utils.toInt(request.getParameter("nno"));
  NoticeDao noticeDao = new NoticeDao();

  Notice notice = noticeDao.getNoticeDetailByNo(noticeNo);


  notice.setIsDeleted("Y");
  noticeDao.updateNotice(notice);

  response.sendRedirect("/notice/list.jsp?");
%>