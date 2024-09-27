<%@ page import="com.jhta.afterpay.user.CartDao" %>
<%@ page import="com.jhta.afterpay.user.Cart" %>
<%@ page import="com.jhta.afterpay.product.StockDao" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.product.Stock" %>
<%@ page import="com.jhta.afterpay.product.ProductDao" %>
<%@ page import="com.jhta.afterpay.product.Product" %>
<%@ page import="com.jhta.afterpay.user.UserDao" %>
<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-09-25
  Time: 오후 2:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../../common/nav.jsp" %>
<%
    int userNo = Utils.toInt(String.valueOf(session.getAttribute("USERNO")));
    if (userID == null) {
        response.sendRedirect("../login-form.jsp?deny");
        return;
    }
    // 상품수량
    int amount = Utils.toInt(request.getParameter("amount"));
    // 상품 재고 번호
    int stockNo = Utils.toInt(request.getParameter("stockNo"));
    StockDao stockDao = new StockDao();
    Stock stock = stockDao.getStockByNo(stockNo);

    CartDao cartDao = new CartDao();
    List<Cart> carts = cartDao.getAllCartsByUserNo(userNo);

    Cart cart = null;
    for (Cart c : carts) {
        if (c.getStock().getNo() == stock.getNo()) {
            cart = c;
            break;
        }
    }

    if (cart == null) {
        cart = new Cart();
        cart.setStock(stock);
        cart.setAmount(amount);

        ProductDao productDao = new ProductDao();
        Product product = productDao.getProductByNo(stock.getProductNo());
        cart.setProduct(product);

        UserDao userDao = new UserDao();
        User user = userDao.getUserByNo(userNo);
        cart.setUser(user);

        cartDao.insertCart(cart);
    } else {
        cart.setAmount(cart.getAmount() + amount);
        cartDao.updateCartAmount(cart);
    }

    response.sendRedirect("cart.jsp");
%>

