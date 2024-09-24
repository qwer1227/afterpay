<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.product.ProductDao" %>
<%@ page import="com.jhta.afterpay.product.Product" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
  int no = Utils.toInt(request.getParameter("pno"));
  int pageNo = Utils.toInt(request.getParameter("page"));

  ProductDao productDao = new ProductDao();

  Product product = productDao.getProductByNo(no);

  product.setViewCount(product.getViewCount() + 1);

  productDao.updateProduct(product);

  response.sendRedirect("detail.jsp?pno=" + no + "&page=" + pageNo);
%>