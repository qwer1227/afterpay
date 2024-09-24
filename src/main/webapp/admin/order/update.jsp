<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.order.OrderDao" %>
<%@ page import="com.jhta.afterpay.order.Order" %><%
    // 1. 요청 파라미터 정보 조회하기
    int no = Utils.toInt(request.getParameter("no"));

    // 2. Order 객체를 생성해서 요청파라미터 정보를 저장한다.
    Order order = new Order();

    // 3. OrderDao 객체를 생성하고, updateAllOrder() 메소드를 실행한다.
    OrderDao orderDao = new OrderDao();
    orderDao.updateAllOrder(order);

    // 4. 재요청 URL을 응답으로 보낸다.
    response.sendRedirect("order.jsp?no=" + no);
%>