<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.order.OrderDao" %>
<%@ page import="com.jhta.afterpay.order.Order" %>

<%
    // 요청 값 받기
    int orderNo = Utils.toInt(request.getParameter("no"));

    //조회하기
    OrderDao orderDao = new OrderDao();
    Order order = orderDao.getOrderByNo(orderNo);

    //삭제여부를 Y로 변경하기
    order.setIsDeleted("Y");
    orderDao.deleteOrder(order);

    // 재요청 URL을 응답으로 보내기
    response.sendRedirect("order.jsp");


%>