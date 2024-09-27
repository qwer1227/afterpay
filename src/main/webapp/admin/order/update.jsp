<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.order.OrderDao" %>
<%@ page import="com.jhta.afterpay.order.Order" %>
<%@ page import="com.jhta.afterpay.delivery.DeliveryDao" %>
<%@ page import="com.jhta.afterpay.delivery.Delivery" %>

<%
    String userID = (String) session.getAttribute("USERID");
    if (userID == null || !userID.equals("ADMIN")) {
        response.sendRedirect("/login-form.jsp?deny");
        return;
    }

    int orderNo = Utils.toInt(request.getParameter("orderNo"));
    String orderStatus = request.getParameter("orderStatus");

    String[] deliveryNoArr = request.getParameterValues("deliveryNo");
    String[] deliveryStatusArr = request.getParameterValues("deliveryStatus");

    OrderDao orderDao = new OrderDao();
    DeliveryDao deliveryDao = new DeliveryDao();

    Order order = orderDao.getAllOrderByNo(orderNo);
    order.setStatus(orderStatus);
    orderDao.updateOrderStatus(order);

    for (int i = 0; i < deliveryNoArr.length; i++) {
        int deliveryNo = Utils.toInt(deliveryNoArr[i]);
        String status = deliveryStatusArr[i];

        Delivery del = deliveryDao.getDeliveryByNo(deliveryNo);
        del.setStatus(status);

        orderDao.updateDeliveryStatus(del);
    }
    response.sendRedirect("detail.jsp?no=" + orderNo);
%>