<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.order.Order" %>
<%@ page import="com.jhta.afterpay.user.UserDao" %>
<%@ page import="com.jhta.afterpay.addr.AddrDao" %>
<%@ page import="com.jhta.afterpay.delivery.DeliveryDao" %>
<%@ page import="com.jhta.afterpay.order.OrderDao" %>
<%@ page import="com.jhta.afterpay.payment.PaymentDao" %>
<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page import="com.jhta.afterpay.delivery.Delivery" %>
<%@ page import="com.jhta.afterpay.product.Product" %>
<%@ page import="com.jhta.afterpay.delivery.Stock" %>
<%@ page import="com.jhta.afterpay.payment.Payment" %>

<%
    //요청 파라미터 값 조회
    int no = Utils.toInt(request.getParameter("orderNo"));
    String name = request.getParameter("userName");                                         // 주문자명
    String id = request.getParameter("userId");                                             // 주문자아이디
    String status = request.getParameter("status");                                    // 주문상태
    String address = request.getParameter("address");                                       // 주소
    String detailAddr = request.getParameter("detailAddress");                              // 상세주소
    String tel = request.getParameter("tel");                                               // 전화번호
    String zipcode = request.getParameter("zipcode");                                       // 우편번호
    String email = request.getParameter("email");                                           // 이메일
    String recipient = request.getParameter("recipient");                                   // 수령인
    int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));                  // 할인 가격
    int deliveryPrice = Integer.parseInt(request.getParameter("deliveryPrice"));            // 배송비
    int paymentPrice = Integer.parseInt(request.getParameter("paymentPrice"));              // 결제 금액
    String[] proNoArr = request.getParameterValues(request.getParameter("productNo"));      // 상품 번호
    String[] amountArr = request.getParameterValues(request.getParameter("amount"));        // 주문 상품 개수

    UserDao userDao = new UserDao();
    DeliveryDao deliveryDao = new DeliveryDao();
    OrderDao orderDao = new OrderDao();
    PaymentDao paymentDao = new PaymentDao();

    //요청 파라미터 값 객체에 저장

    // 주문회원정보 저장
    int userNo = Utils.toInt(request.getParameter("no"));
    User user = userDao.getUserByNo(userNo);

    user.setId(id);
    user.setName(name);

    //주문정보 저장
    Order order = new Order();
    order.setPrice(totalPrice);
    order.setAmount(1);
    order.setStatus(status);
    order.setDeliveryPrice(deliveryPrice);
    order.setPaymentPrice(paymentPrice);
    order.setUser(user);

    orderDao.insertOrder(order);

    //상품정보 저장


    //배송정보 저장
    Delivery delivery = new Delivery();
    Product product = new Product(); // productDao 필요
    Stock stock = new Stock(); // stockDao 필요
    stock.setNo(1);

    product.setNo(10000);
    delivery.setProduct(product);
    delivery.setAmount(1);
    delivery.setRecipient(recipient);
    delivery.setStock(stock);

    deliveryDao.insertDelivery(delivery);

    //결제정보 저장
    Payment payment = new Payment();
    payment.setPrice(paymentPrice);
    paymentDao.insertPayment(payment);

    // 회원 목록 조회 페이지 재요청
    response.sendRedirect("order.jsp");
%>