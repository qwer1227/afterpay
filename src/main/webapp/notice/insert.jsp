<%@ page import="com.jhta.afterpay.notice.Notice" %>
<%@ page import="com.jhta.afterpay.notice.NoticeDao" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
  String title = request.getParameter("title");
  String content = request.getParameter("content");

//  int userNo = (Integer) session.getAttribute("USERNO");
//  User user = new User(userNo);

  Notice notice = new Notice();
  notice.setTitle(title);
  notice.setContent(content);
//  notice.setUser(user);

  NoticeDao noticeDao = new NoticeDao();
  noticeDao.insertNotice(notice);

  response.sendRedirect("/notice/list.jsp");
%>