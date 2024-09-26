<%@ page import="com.jhta.afterpay.product.StockDao" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.product.Stock" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <title>재고 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
</head>
<body>
<%
    String userID = (String) session.getAttribute("USERID");
    if (userID == null || !userID.equals("ADMIN")) {
        response.sendRedirect("/login-form.jsp?deny");
        return;
    } else {
%>
<div class="container">
    <%
        StockDao stockDao = new StockDao();

        int productNo = Utils.toInt(request.getParameter("no"));

        List<Stock> stocks = stockDao.getAllStocksByNo(productNo);
    %>
    <form class="border bg-light p-3" method="post" action="update.jsp?no=<%=productNo %>">
        <div class="text-center">
            <h1>상품 수정</h1>
        </div>
        <%
            for (Stock stock : stocks) {
        %>
        <div class="mb-3">
            <label class="form-label"><%=stock.getSize()%> 사이즈 수량</label>
            <input type="hidden" name="<%=stock.getSize()%>No" value="<%=stock.getNo()%>">
            <input type="text" class="form-control" name="<%=stock.getSize()%>Amount" value="<%=stock.getAmount()%>">
        </div>
        <%
            }
        %>
        <div class="text-end">
            <a href="stock.jsp" class="btn btn-secondary">취소</a>
            <button type="submit" class="btn btn-primary">등록</button>
        </div>
    </form>
</div>
<%
    }
%>
</body>
</html>
