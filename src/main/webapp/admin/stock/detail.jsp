<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.product.Stock" %>
<%@ page import="com.jhta.afterpay.product.StockDao" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>상품 재고 수정</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/common/css/style.css">
</head>
<body>
<div class="container">
    <%
        int productNo = Utils.toInt(request.getParameter("no"));

        StockDao stockDao = new StockDao();
        List<Stock> stocks = stockDao.getAllStocksByNo(productNo);
    %>
    <div class="row">
        <div class="card">
            <div class="card-header">
                <h3 class="text-center">사이즈별 재고 사항</h3>
            </div>
            <div class="card-body">
                <table class="table">
                    <thead>
                    <tr>
                        <th class="text-center">사이즈</th>
                        <th class="text-center">재고수량</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        int totalStock = 0;
                        for (Stock stock : stocks) {
                            totalStock += stock.getAmount();
                    %>
                    <tr>
                        <td class="text-center"><%=stock.getSize()%></td>
                        <td class="text-center"><%=stock.getAmount() %> 개</td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
            <div class="card-footer text-end">
                <p>
                    <strong>총 재고수량 </strong>
                    <h3> <%=totalStock %> 개</h3>
                </p>
            </div>
        </div>
        <div class="text-end my-2">
            <a href="modify-form.jsp?no=<%=productNo %>" class="btn btn-primary">재고수정</a>
            <a href="#" class="btn btn-success">재고목록</a>
        </div>
    </div>
</div>
</body>
</html>
