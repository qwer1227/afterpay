<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.product.ProductDao" %>
<%@ page import="com.jhta.afterpay.product.Product" %>
<%@ page import="com.jhta.afterpay.product.Category" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>

<%
    // 1. 요청 파라미터값을 조회한다.
    int no = Utils.toInt(request.getParameter("no"));
    int catNo = Utils.toInt(request.getParameter("catNo"));
    String name = request.getParameter("name");
    int price = Utils.toInt(request.getParameter("price"));
    String status = request.getParameter("status");
    String content = request.getParameter("description");

    // 2. 상품번호를 조회한다.
    ProductDao productDao = new ProductDao();
    Product product = productDao.getAllProductByNo(no);

    // 3. 조회된 상품정보에 요청파라미터로 조회한 값을 대입해서 정보를 수정한다.
    product.setCategory(new Category(catNo));
    product.setName(name);
    product.setPrice(price);
    product.setStatus(status);
    product.setContent(content);

    // 4. 수정된 정보 저장
    productDao.updateAllProduct(product);

    // 5. detail.jsp를 재요청하는 URL을 응답으로 보내기
    response.sendRedirect("detail.jsp?no=" + no);
%>

