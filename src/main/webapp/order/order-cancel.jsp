<%@ page import="com.jhta.afterpay.order.OrderDao" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.order.Order" %>
<%@ page import="com.jhta.afterpay.delivery.Delivery" %>
<%@ page import="com.jhta.afterpay.delivery.DeliveryDao" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-09-25
  Time: 오후 2:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
    int userNo = Utils.toInt(String.valueOf(session.getAttribute("USERNO")));
    // 전달 받은 상품 재고 번호
    int stockNo = Utils.toInt(request.getParameter("stockNo"));
    //  전달 받은 상품 주문 수량
    int amount = Utils.toInt(request.getParameter("amount"));
    int orderNo = Utils.toInt(request.getParameter("orderNo"));

    OrderDao orderDao = new OrderDao();
    Order order = orderDao.getOrderByNo(orderNo);
    order.setStatus("취소");
    orderDao.updateOrderStatus(order);

    response.sendRedirect("/user/orders.jsp");
%>
