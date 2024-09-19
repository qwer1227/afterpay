<%@ page import="com.jhta.afterpay.user.dao.UserDao" %>
<%@ page import="com.jhta.afterpay.user.vo.User" %>
<%@ page import="com.jhta.afterpay.user.vo.Address" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
  //1. 요청 파라미터 값 조회
  //2. 사용자번호로 사용자정보 조회
  //3. 조회된 사용자번호에 요청파라미터로 전달받은 값을 대입하여 정보 수정
  //4. 수정된 정보가 반영된 User객체를 UserDao의 updateUserInfoByNo로 전달하여 db 반영
  //5. info.jsp를 재요청하는 URL을 응답으로 전송

  // 세션에서 사용자 번호를 가져온다.
  int userNo = 19;
  String tel = request.getParameter("tel");
  String email = request.getParameter("email");

  UserDao userDao = new UserDao();
  User user = userDao.getUserByNo(userNo);

  user.setTel(tel);
  user.setEmail(email);
  userDao.updateUser(user);


  response.sendRedirect("info.jsp");
%>