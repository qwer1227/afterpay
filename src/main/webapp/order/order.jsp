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
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%

    // 쿼리 파라미터
    String address = request.getParameter("address");                               // 주소
    String detailAddr = request.getParameter("detailAddress");                      // 상세주소
    String tel = request.getParameter("tel");                                       // 전화번호
    String zipcode = request.getParameter("zipcode");                               // 우편번호
    String email = request.getParameter("email");                                   // 이메일
    String recipient = request.getParameter("recipient");                           // 수령인
    String userName = request.getParameter("userName");                             // 주문자명
    int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));          // 주문 가격
    int discountPrice = Integer.parseInt(request.getParameter("discountPrice"));    // 할인 가격
    int deliveryPrice = Integer.parseInt(request.getParameter("deliveryPrice"));    // 배송비
    int paymentPrice = Integer.parseInt(request.getParameter("paymentPrice"));      // 결제 금액
    String[] proNoArr = request.getParameterValues(request.getParameter("productNo")); // 상품 번호
    String[] amountArr = request.getParameterValues(request.getParameter("amount"));    // 주문 상품 개수


    UserDao userDao = new UserDao();
    AddrDao addrDao = new AddrDao();
    DeliveryDao deliveryDao = new DeliveryDao();
    OrderDao orderDao = new OrderDao();
    PaymentDao paymentDao = new PaymentDao();

    // 주문 회원 정보
    User user = userDao.getUserById("hong"); // 회원ID는 세션값으로 구할 예정

    // 배송지 저장
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
    Order order = new Order();
    order.setPrice(paymentPrice);
    order.setAmount(1);
    order.setDeliveryPrice(deliveryPrice);
    order.setUsePoint(1);
    order.setDiscountPrice(discountPrice);
    order.setPaymentPrice(paymentPrice);
    order.setDepositPoint(1);
    order.setAddr(wantAddr);
    order.setUser(user);

    orderDao.insertOrder(order);

    Order payOrder = orderDao.getMostLatelyOrderNoByUserNo(user.getNo());

    // 배송상품 저장

    for (String proNo : proNoArr) {
        int productNo = Integer.parseInt(proNo);
        Delivery delivery = new Delivery();
        Product product = new Product(); // productDao 필요
        Stock stock = new Stock(); // stockDao 필요
        stock.setNo(1);
        product.setNo(10000);
        delivery.setProduct(product);
        delivery.setOrder(payOrder);
        delivery.setAmount(1);
        delivery.setProduct(product);
        delivery.setRecipient(recipient);
        delivery.setStock(stock);

        deliveryDao.insertDelivery(delivery);
    }

    // 결제정보 저장
    Payment payment = new Payment();
    payment.setPrice(paymentPrice);
    payment.setOrder(payOrder);
    paymentDao.insertPayment(payment);

    response.sendRedirect("/orderSuccess.jsp");
%>
