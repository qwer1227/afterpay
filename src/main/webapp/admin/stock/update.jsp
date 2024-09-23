<%@ page import="com.jhta.afterpay.product.Stock" %>
<%@ page import="com.jhta.afterpay.product.StockDao" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>

<%
    int productNo = Utils.toInt(request.getParameter("no"));
    int sStockNo = Utils.toInt(request.getParameter("SNo"));
    int mStockNo = Utils.toInt(request.getParameter("MNo"));
    int lStockNo = Utils.toInt(request.getParameter("LNo"));
    int sAmount = Utils.toInt(request.getParameter("SAmount"));
    int mAmount = Utils.toInt(request.getParameter("MAmount"));
    int lAmount = Utils.toInt(request.getParameter("LAmount"));

    StockDao stockDao = new StockDao();

    // 스몰 사이즈
    Stock smallProductStock = stockDao.getStockAmountByStockNo(sStockNo);
    smallProductStock.setAmount(sAmount);
    stockDao.updateStockAmount(smallProductStock);

    // 미들 사이즈
    Stock middleProductStock = stockDao.getStockAmountByStockNo(mStockNo);
    middleProductStock.setAmount(mAmount);
    stockDao.updateStockAmount(middleProductStock);

    // 라지 사이즈
    Stock largeProductStock = stockDao.getStockAmountByStockNo(lStockNo);
    largeProductStock.setAmount(lAmount);
    stockDao.updateStockAmount(largeProductStock);

    response.sendRedirect("detail.jsp?no=" + productNo);
%>

