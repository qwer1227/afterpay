<%@ page import="java.net.URLDecoder" %>
<%@ page import="com.jhta.afterpay.addr.AddrDto" %>
<%@ page import="com.jhta.afterpay.addr.AddrDao" %>
<%@ page import="com.jhta.afterpay.order.UserDto" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-09-11
  Time: 오후 3:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String address = "";
    String detailAddress = "";
    String tel = "";
    String zipcode = "";

    Cookie[] cookies = request.getCookies();
    if(cookies!=null){
        for(int i=0; i<cookies.length; i++) {
            Cookie thisCookie = cookies[i];
            String n = thisCookie.getName();

            if (n.equals("address")) {
                address = URLDecoder.decode((thisCookie.getValue()), "utf-8");
            }
            if (n.equals("detailAddress")) {
                detailAddress = URLDecoder.decode((thisCookie.getValue()),"utf-8");
            }
            if (n.equals("tel")) {
                tel = URLDecoder.decode((thisCookie.getValue()),"utf-8");
            }
            if (n.equals("zipcode")) {
                zipcode = URLDecoder.decode((thisCookie.getValue()),"utf-8");
            }
        }
    }

    UserDto user = new UserDto();
    user.setNo(1);

    AddrDto addr = new AddrDto();
    addr.setNo(3);
    addr.setAddr1(address);
    addr.setAddr2(detailAddress);
    addr.setTel(tel);
    addr.setUser(user);
    addr.setZipCode(zipcode);
    addr.setAddrHome("Y");
    addr.setName("집");
    addr.setIsAddrHome("Y");

    AddrDao addrDao = new AddrDao();
    addrDao.insertAddr(addr);


%>
<html>
<head>
    <title>주문 정보</title>
</head>
<body>

<strong>주소</strong><br>

<p><%=address%></p>


</body>
</html>
