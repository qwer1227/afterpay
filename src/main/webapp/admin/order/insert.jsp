<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.order.Order" %>

<%
    //요청 파라미터 값 조회
    int orderNo = Utils.toInt(request.getParameter("no"));
    String status = request.getParameter("status");


    //요청 파라미터 값 조회
    Order order = new Order();
    order.setStatus(status);

    //요청 파라미터 값 객체에 저장
    orderDao.InsertOrder(order);

    // 회원 목록 조회 페이지 재요청
    response.sendRedirect("order.jsp");
%>