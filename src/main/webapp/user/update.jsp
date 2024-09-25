<%@ page import="com.jhta.afterpay.user.UserDao" %>
<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.order.OrderDao" %>
<%@ page import="com.jhta.afterpay.order.Order" %>
<%@ page import="com.jhta.afterpay.addr.AddrDao" %>
<%@ page import="com.jhta.afterpay.addr.Addr" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
  //1. 요청 파라미터 값 조회
  //2. 사용자번호로 사용자정보 조회
  //3. 조회된 사용자번호에 요청파라미터로 전달받은 값을 대입하여 정보 수정
  //4. 수정된 정보가 반영된 User객체를 UserDao의 updateUserInfoByNo로 전달하여 db 반영
  //5. info.jsp를 재요청하는 URL을 응답으로 전송

  // 세션에서 사용자 번호를 가져온다.
  int userNo = Utils.toInt(String.valueOf(session.getAttribute("USERNO")));
  String tel = request.getParameter("tel");
  String email = request.getParameter("email");
  String zipcode = request.getParameter("zipcode");
  String address = request.getParameter("address");
  String detailAddr = request.getParameter("detailAddress");

  UserDao userDao = new UserDao();
  User user = userDao.getUserByNo(userNo);
  user.setTel(tel);
  user.setEmail(email);
  userDao.updateUser(user);

//  AddrDao addrDao = new AddrDao();
//  Addr addr = addrDao.getHomeAddrByUserNo(userNo);
//  addr.setZipCode(zipcode);
//  addr.setAddr1(address);
//  addr.setAddr2(detailAddr);
//  addr.setNo(addr.getNo());
//  addrDao.updateAddrByAddrNo(addr);

  response.sendRedirect("info.jsp");
%>