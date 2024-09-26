<%@ page import="com.jhta.afterpay.addr.AddrDao" %>
<%@ page import="com.jhta.afterpay.addr.Addr" %>
<%@ page import="com.jhta.afterpay.user.UserDao" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>

<%
    String userNos = String.valueOf(session.getAttribute("USERNO"));
    int userNo = Utils.toInt(userNos);
    System.out.println(userNo);

    String name = request.getParameter("name");
    String addrName = request.getParameter("addr_name");
    String phone = request.getParameter("phone");
    String zipcode = request.getParameter("zipcode");
    String address = request.getParameter("user_address");
    String detailAddress = request.getParameter("user_detail_address");

    UserDao userDao = new UserDao();
    User user = userDao.getUserByNo(userNo);

    System.out.println(user.getNo());

    AddrDao addrDao = new AddrDao();
    Addr addr = new Addr();

    addr.setUser(user);
    addr.setRecipient(name);
    addr.setName(addrName);
    addr.setTel(phone);
    addr.setIsAddrHome("N");
    addr.setZipCode(zipcode);
    addr.setAddr1(address);
    addr.setAddr2(detailAddress);

    addrDao.insertAddr(addr);

    response.sendRedirect("/user/modify-address-form.jsp");
%>