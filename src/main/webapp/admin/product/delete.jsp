<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.product.ProductDao" %>
<%@ page import="com.jhta.afterpay.product.Product" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>

<%
    // 요청 값 받기
    int productNo = Utils.toInt(request.getParameter("no"));

    //조회하기
    ProductDao productDao = new ProductDao();
    Product product = productDao.getAllProductByNo(productNo);

    //삭제여부를 Y로 변경하기!
    product.setDeleted("Y");
    productDao.updateAllProduct(product);

    // 재요청 URL을 응답으로 보내기
    response.sendRedirect("product.jsp");


%>


