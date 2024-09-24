<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.order.OrderDao" %>
<%@ page import="com.jhta.afterpay.order.Order" %>
<%@ page import="com.jhta.afterpay.delivery.DeliveryDao" %>
<%@ page import="com.jhta.afterpay.delivery.Delivery" %><%
    // 1. 요청 파라미터 정보 조회하기
    int orderNo = Utils.toInt(request.getParameter("orderNo"));
    // 주문상태, 배송상태
    String orderStatus = request.getParameter("name");
    String deliveryStatus = request.getParameter("status");

    // 2. Order 객체를 생성해서 요청파라미터 정보를 저장한다.

    // 3. OrderDao 객체를 생성하고, updateAllOrder() 메소드를 실행한다.
    OrderDao orderDao = new OrderDao();
    DeliveryDao deliveryDao = new DeliveryDao();

    Order order = orderDao.getAllOrderByNo(orderNo);
    Delivery delivery = deliveryDao.getAllDeliveryByOrderNo(orderNo);

    order.setStatus(orderStatus);
    delivery.setStatus(deliveryStatus);

    orderDao.updateOrderStatus(order);
    deliveryDao.updateDelivery(delivery);

    // 4. 재요청 URL을 응답으로 보낸다.
    response.sendRedirect("detail.jsp?no=" + orderNo);
%>