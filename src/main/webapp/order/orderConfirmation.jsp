<%@ page import="java.net.URLDecoder" %><%--
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

    Cookie[] cookies = request.getCookies();
    if(cookies!=null){
        for(int i=0; i<cookies.length; i++) {
            Cookie thisCookie = cookies[i];
            String n = thisCookie.getName();
            if(n.equals("address")) {
                address = URLDecoder.decode((thisCookie.getValue()), "utf-8");
            }
        }
    }

    String test = "asdasd";
    // addressDao.insert( .... )

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
