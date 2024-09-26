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
<%@ page import="com.jhta.afterpay.product.Stock" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.product.StockDao" %>
<%@ page import="com.jhta.afterpay.product.ProductDao" %>
<%@ page import="java.util.Optional" %>
<%@ page import="com.jhta.afterpay.user.Cart" %>
<%@ page import="com.jhta.afterpay.user.CartDao" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
    int userNo = Utils.toInt(String.valueOf(session.getAttribute("USERNO")));
    String userID = String.valueOf(session.getAttribute("USERID"));
    System.out.println(userID);

    if (userID == null) {
        response.sendRedirect("../login-form.jsp?deny");
        return;
    }


    // 쿼리 파라미터
    String address = request.getParameter("address");                                       // 주소
    String detailAddr = request.getParameter("detailAddress");                              // 상세주소
    String tel = request.getParameter("tel");                                               // 전화번호
    String zipcode = request.getParameter("zipcode");                                       // 우편번호
    String email = request.getParameter("emailId") + "@" + request.getParameter("domain");  // 이메일
    String recipient = request.getParameter("recipient");                                   // 수령인
    String userName = request.getParameter("userName");                                     // 주문자명
    int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));                  // 주문 가격
    int discountPrice = Integer.parseInt(request.getParameter("discountPrice"));            // 할인 가격
    int deliveryPrice = Integer.parseInt(request.getParameter("deliveryPrice"));            // 배송비
    int paymentPrice = Integer.parseInt(request.getParameter("paymentPrice"));              // 결제 금액
    String message = request.getParameter("message");                                       // 배송 메세지
    int totalAmount = Utils.toInt(request.getParameter("totalAmount"));                     // 주문 상품 전체 개수

    // 주문 상품 개수
    String[] amount = request.getParameterValues("amount");
    int[] amountArr = new int[amount.length];
    for (int i = 0; i < amountArr.length; i++) {
        amountArr[i] = Utils.toInt(amount[i]);
    }

    int totalAmonut = 0;
    for (int a : amountArr) {
        totalAmonut += a;
    }

    // 상품 재고 번호 가져오기
    String[] stockNo = request.getParameterValues("stockNo");
    int[] stockNoArr = null;


    // 장바구니 주문시 장바구니에서 해당 상품 삭제
    CartDao cartDao = new CartDao();
    String[] cartNo = request.getParameterValues("cartNo");
    int[] cartNoArr = null;
    List<Cart> carts = new ArrayList<>();
    if (cartNo != null && !cartNo[0].equals("0")) {
        cartNoArr = new int[cartNo.length];
        stockNoArr = new int[cartNoArr.length];
        for (int i = 0; i < cartNoArr.length; i++) {
            cartNoArr[i] = Utils.toInt(cartNo[i]);
            Cart cart = cartDao.getCartByNo(cartNoArr[i]);
            carts.add(cart);
            stockNoArr[i] = cart.getStock().getNo();
            cartDao.deleteCartByNo(cartNoArr[i]);
        }
    } else {
        stockNoArr = new int[stockNo.length];
        for (int i = 0; i < stockNoArr.length; i++) {
            stockNoArr[i] = Utils.toInt(stockNo[i]);
        }
    }


    UserDao userDao = new UserDao();
    AddrDao addrDao = new AddrDao();
    DeliveryDao deliveryDao = new DeliveryDao();
    OrderDao orderDao = new OrderDao();
    PaymentDao paymentDao = new PaymentDao();
    ProductDao productDao = new ProductDao();
    StockDao stockDao = new StockDao();

    // 주문 회원 정보
    User user = userDao.getUserById(userID); // 회원ID는 세션값으로 구할 예정
    user.setEmail(email);
    user.setTel(tel);
    user.setName(userName);


    // 배송지 저장
    List<Addr> addrs = addrDao.getAllAddrByUserNo(userNo);
    Addr addr = new Addr();
    if (recipient == null) {
        recipient = userDao.getUserByNo(userNo).getName();
    }
    if (detailAddr == null) {
        detailAddr = "없음";
    }
    // 입력받은 주소와 상세주소가 같은 배송지가 이미 있으면 저장하지 않는다.
    for (Addr findAddr : addrs) {
        if (findAddr.getAddr2() == null) {
            findAddr.setAddr2("");
        }
        if (findAddr.getAddr1().equals(address)
                && findAddr.getAddr2().equals(detailAddr)) {
            break;
        } else {
            addr.setName("새 배송지");
            addr.setTel(tel);
            addr.setZipCode(zipcode);
            addr.setAddr1(address);
            addr.setAddr2(detailAddr);
            addr.setUser(user);
            addr.setRecipient(recipient);
            if (findAddr.getIsAddrHome().equals("Y")) {
                addr.setIsAddrHome("N");
            }
            addrDao.insertAddr(addr);
            break;
        }
    }

    // 새로 추가된 배송지 번호 가져오기
    addrs = addrDao.getAllAddrByUserNo(userNo);
    for (Addr findAddr : addrs) {
        if (findAddr.getAddr2() == null) {
            findAddr.setAddr2("없음");
        }
        if (findAddr.getAddr1().equals(address) && findAddr.getAddr2().equals(detailAddr)) {
            addr.setNo(findAddr.getNo());
        }
    }

    // 상품재고 개수 감소
    for (int i = 0; i < amountArr.length; i++) {
        Stock s = stockDao.getStockByNo(stockNoArr[i]);
        int remaining = s.getAmount() - amountArr[i];
        s.setAmount(remaining);
        stockDao.updateStockAmount(s);
        if (remaining <= 0) {
            s.setAmount(0);
        }
        stockDao.updateStockAmount(s);
    }

    // 주문정보 저장
    Order order = new Order();
    order.setPrice(totalPrice);
    order.setAmount(totalAmount);
    order.setDeliveryPrice(deliveryPrice);
    order.setUsePoint(1);
    order.setDiscountPrice(discountPrice);
    order.setPaymentPrice(paymentPrice);
    order.setDepositPoint(1);
    order.setTel(tel);
    order.setEmail(email);
    order.setAddr(addr);
    order.setUser(user);
    order.setDeliveryMessage(message);

    orderDao.insertOrder(order);

    Order payOrder = orderDao.getMostLatelyOrderNoByUserNo(userNo);

    // 배송상품 저장
    for (int i = 0; i < stockNoArr.length; i++) {
        Stock stock = stockDao.getStockByNo(stockNoArr[i]);
        int productNo = stock.getProductNo();
        Delivery delivery = new Delivery();
        Product product = productDao.getProductByNo(productNo);
        stock.setNo(stockNoArr[i]);
        product.setNo(productNo);

        delivery.setProduct(product);
        delivery.setPrice(product.getPrice());
        delivery.setOrder(payOrder);
        delivery.setAmount(amountArr[i]);
        delivery.setRecipient(recipient);
        delivery.setStock(stock);

        deliveryDao.insertDelivery(delivery);
    }

    // 결제정보 저장
    Payment payment = new Payment();
    payment.setPrice(paymentPrice);
    payment.setOrder(payOrder);
    paymentDao.insertPayment(payment);

    response.sendRedirect("order-success.jsp");
%>
