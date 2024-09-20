<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.product.Product" %>
<%@ page import="com.jhta.afterpay.product.Category" %>
<%@ page import="com.jhta.afterpay.product.ProductDao" %>
<%@ page import="com.jhta.afterpay.product.Stock" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
    // 요청 파라미터 값을 조회
    int catNo = Utils.toInt(request.getParameter("catNo"));
    String name = request.getParameter("name");
    int price = Utils.toInt(request.getParameter("price"));
    String status = request.getParameter("status");
    String description = request.getParameter("description");
    String smallSize = request.getParameter("smallSize");
    String mediumSize = request.getParameter("mediumSize");
    String largeSize = request.getParameter("largeSize");
    int smallAmount = Utils.toInt(request.getParameter("smallAmount"));
    int mediumAmount = Utils.toInt(request.getParameter("mediumAmount"));
    int largeAmount = Utils.toInt(request.getParameter("largeAmount"));



    ProductDao productDao = new ProductDao();

    int seq = productDao.getSequence();
    // 객체 안에 담기
    Product product = new Product();
    product.setNo(seq);
    product.setCategory(new Category(catNo));
    product.setName(name);
    product.setPrice(price);
    product.setStatus(status);
    product.setContent(description);
    // 저장하기
    productDao.insertProduct(product);

    Stock stock1 = new Stock();
    stock1.setSize(smallSize);
    stock1.setAmount(smallAmount);
    stock1.setProductNo(seq);
    productDao.insertProductStock(stock1);

    Stock stock2 = new Stock();
    stock2.setSize(mediumSize);
    stock2.setAmount(mediumAmount);
    stock2.setProductNo(seq);
    productDao.insertProductStock(stock2);

    Stock stock3 = new Stock();
    stock3.setSize(largeSize);
    stock3.setAmount(largeAmount);
    stock3.setProductNo(seq);
    productDao.insertProductStock(stock3);


    response.sendRedirect("product.jsp");
%>
