<%@ page import="com.jhta.afterpay.addr.AddrDao" %>
<%@ page import="com.jhta.afterpay.addr.Addr" %>
<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page import="com.jhta.afterpay.payment.Payment" %>
<%@ page import="com.jhta.afterpay.payment.PaymentDao" %>
<%@ page import="com.jhta.afterpay.order.Order" %>
<%@ page import="com.jhta.afterpay.order.OrderDao" %>
<%@ page import="com.jhta.afterpay.user.UserDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.delivery.DeliveryDao" %>
<%@ page import="com.jhta.afterpay.delivery.Delivery" %>
<%@ page import="com.jhta.afterpay.product.Product" %>
<%@ page import="com.jhta.afterpay.delivery.Stock" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%

    // 쿼리 파라미터
    String address = request.getParameter("address");                               // 주소
    String detailAddr = request.getParameter("detailAddress");                      // 상세주소
    String tel = request.getParameter("tel");                                       // 전화번호
    String zipcode = request.getParameter("zipcode");                               // 우편번호
//    String email = request.getParameter("email");                                   // 이메일
    String recipient = request.getParameter("recipient");                           // 수령인
//    String userName = request.getParameter("userName");                             // 주문자명
//    int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));          // 주문 가격
//    int discountPrice = Integer.parseInt(request.getParameter("discountPrice"));    // 할인 가격
//    int deliveryPrice = Integer.parseInt(request.getParameter("deliveryPrice"));    // 배송비
    int paymentPrice = Integer.parseInt(request.getParameter("paymentPrice"));      // 결제 금액


    // 주문 회원 정보
    UserDao userDao = new UserDao();
    User user = userDao.getUserById("hong"); // 회원ID는 세션값으로 구할 예정

    // 배송지 저장
    AddrDao addrDao = new AddrDao();
    Addr addr = new Addr();

    addr.setAddr1(address);
    addr.setAddr2(detailAddr);
    addr.setTel(tel);
    addr.setZipCode(zipcode);
    addr.setName("집");
    addr.setIsAddrHome("Y");
    addr.setUser(user);

    addrDao.insertAddr(addr);

    List<Addr> addrs = addrDao.getAllAddrByUserNo(user.getNo());

    Addr wantAddr = new Addr();

    // 주소가 중복 저장된 경우에는 어떻게 ??
    wantAddr.setUser(user);
    for (Addr findAddr : addrs) {
        if(findAddr.getAddr1().equals(address) && findAddr.getAddr2().equals(detailAddr)) {
            wantAddr.setNo(findAddr.getNo());
        }
    }


    // 주문정보 저장
    OrderDao orderDao = new OrderDao();
    Order order = new Order();
    order.setPrice(paymentPrice);
    order.setAmount(1);
    order.setDeliveryPrice(1);
    order.setUsePoint(1);
    order.setDiscountPrice(1);
    order.setPaymentPrice(paymentPrice);
    order.setDepositPoint(1);
    order.setAddr(wantAddr);
    order.setUser(user);

    orderDao.insertOrder(order);

    Order payOrder = orderDao.getMostLatelyOrderNoByUserNo(user.getNo());

    // 배송상품 저장
    DeliveryDao deliveryDao = new DeliveryDao();
    Delivery delivery = new Delivery();

    Product product = new Product();
    product.setNo(10000);
    delivery.setProduct(product);

    delivery.setOrder(payOrder);
    delivery.setAmount(1);
    delivery.setProduct(product);
    delivery.setRecipient(recipient);

    Stock stock = new Stock();
    stock.setNo(1);
    delivery.setStock(stock);

    deliveryDao.insertDelivery(delivery);

    // 결제정보 저장
    PaymentDao paymentDao = new PaymentDao();

    Payment payment = new Payment();
    payment.setPrice(paymentPrice);
    payment.setOrder(payOrder);
    paymentDao.insertPayment(payment);

    response.sendRedirect("../index.jsp");
%>
