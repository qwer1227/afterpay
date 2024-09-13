<%@ page import="com.jhta.afterpay.addr.AddrDao" %>
<%@ page import="com.jhta.afterpay.addr.AddrDto" %>
<%@ page import="com.jhta.afterpay.order.UserDto" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%

    // 쿼리 파라미터
    String address = request.getParameter("address");   // 주소
    String detailAddr = request.getParameter("detailAddress");  // 상세주소
    String tel = request.getParameter("tel");       // 전화번호
    String zipcode = request.getParameter("zipcode");   // 우편번호
    String email = request.getParameter("email");   // 이메일
    String recipient = request.getParameter("recipient");   //수령인

    AddrDao addrDao = new AddrDao();
    AddrDto addr = new AddrDto();
    UserDto user = new UserDto();
    user.setNo(6);

    addr.setName("집");
    addr.setUser(user);
    addr.setAddr1(address);
    addr.setAddr2(detailAddr);
    addr.setTel(tel);
    addr.setZipCode(zipcode);
    addr.setIsAddrHome("Y");
    addr.setNo(10);


    addrDao.insertAddr(addr);

    response.sendRedirect("../index.jsp");
%>
