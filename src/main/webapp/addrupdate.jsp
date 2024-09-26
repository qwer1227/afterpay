<%@ page import="com.jhta.afterpay.addr.Addr" %>
<%@ page import="com.jhta.afterpay.addr.AddrDao" %>
<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.user.UserDao" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>

<%
    String addrNo = (String) session.getAttribute("ADDRNO");

    String userNos = String.valueOf(session.getAttribute("USERNO"));
    int userNo = Utils.toInt(userNos);

    String name = request.getParameter("name");
    String addrName = request.getParameter("addr_name");
    String phone = request.getParameter("phone");
    String zipcode = request.getParameter("zipcode");
    String address = request.getParameter("user_address");
    String detailAddress = request.getParameter("user_detail_address");

    UserDao userDao = new UserDao();
    User user = userDao.getUserByNo(userNo);

    Addr addr = new Addr();
    addr.setUser(user);
    addr.setRecipient(name);
    addr.setName(addrName);
    addr.setTel(phone);
    addr.setIsAddrHome("N");
    addr.setZipCode(zipcode);
    addr.setAddr1(address);
    addr.setAddr2(detailAddress);
    addr.setNo(Utils.toInt(addrNo));

    AddrDao addrDao = new AddrDao();
    addrDao.updateAddrByAddrNo(addr);

    response.sendRedirect("/user/modify-address-form.jsp");
%>