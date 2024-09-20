<%@ page import="com.jhta.afterpay.addr.AddrDao" %>
<%@ page import="com.jhta.afterpay.addr.Addr" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-09-19
  Time: 오전 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href=common/css/style.css rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
    <link href="/common/css/style.css" rel="stylesheet">
</head>
<body>
<%
    // 유저의 배송지 목록 가져오기
    AddrDao addrDao = new AddrDao();
    List<Addr> addrs = addrDao.getAllAddrByUserNo(7); // 세션 이용하기
%>
<div class="container-sm">
    <h2 class="text-start">배송지 목록</h2>
        <div class="row mb-3">
            <table class="table">
                <thead>
                <tr>
                    <th></th>
                    <th>배송지명</th>
                    <th>우편번호</th>
                    <th>주소</th>
                    <th>상세주소</th>
                </tr>
                </thead>
                <tbody>
                <%
                    // 배송지 목록 보여주기
                    for (Addr addr : addrs) {
                %>
                <tr>
                    <td><input class="form-check-input" type="checkbox" id="name" name="addrName" value="<%=addr.getName()%>"
                               onclick="oneCheckbox(this)"></td>
                    <td><%=addr.getName()%></td>
                    <td><input type="hidden" id="zipcode" value="<%=addr.getZipCode()%>"><%=addr.getZipCode()%></td>
                    <td><input type="hidden" id="address" value="<%=addr.getAddr1()%>"><%=addr.getAddr1()%></td>
                    <td><input type="hidden" id="detailAddress" value="<%=addr.getAddr2()%>"><%=addr.getAddr2()%></td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            </ul>
        </div>
        <div class="row">
            <div col="3">
                <input type="submit" value="선택" onclick="setParentText()" class="btn btn-primary btn">
            </div>
        </div>
</div>
<%--중복체크 방지--%>
<script type="text/javascript">
    function setParentText(){
        var obj = document.getElementsByName("pay");

        for(var i=0; i<obj.length; i++){

            if(obj[i] != a){

                obj[i].checked = false;

            }
        }
        window.close();
        opener.document.getElementById("sample6_postcode").value = document.getElementById("zipcode").value
        opener.document.getElementById("sample6_address").value = document.getElementById("address").value
        opener.document.getElementById("sample6_detailAddress").value = document.getElementById("detailAddress").value
    }
</script>
</body>
</html>
