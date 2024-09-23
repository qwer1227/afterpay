<%@ page import="com.jhta.afterpay.product.StockDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.product.Stock" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.product.ProductDao" %>
<%@ page import="com.jhta.afterpay.product.Product" %>
<%@ page import="com.jhta.afterpay.util.Pagination" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <title>상품재고현황</title>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>상품관리페이지</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="/common/css/style.css">
    </head>
</head>
<body>
<%@ include file="../../common/nav.jsp" %>
    <div class="container mb-5" style="margin-top: 100px;">
        <div class="row mb-3">
            <div class="col-9 offset-2">
                <h1 class="text-center">재고관리 현황</h1>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-2">
                <!-- 메뉴목록 -->
                <%@include file="../admin-nav.jsp"%>
            </div>
            <div class="col-10">
                <table class="table">
                    <thead>
                        <tr class="table-dark">
                            <th>번호</th>
                            <th>상품이름</th>
                            <th>S 사이즈 수량</th>
                            <th>M 사이즈 수량</th>
                            <th>L 사이즈 수량</th>
                            <th>총 수량</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int pageNo = Utils.toInt(request.getParameter("page"), 1);

                            ProductDao productDao = new ProductDao();
                            int totalRows = productDao.getAllTotalRows();
                            Pagination pagination = new Pagination(pageNo, totalRows);

                            List<Product> products = productDao.getAllProducts(pagination.getBegin(), pagination.getEnd());

                            StockDao stockDao = new StockDao();

                            for (Product product : products) {
                                List<Stock> stocks = stockDao.getAllStocksByNo(product.getNo());
                        %>
                            <tr>

                                <td><%=product.getNo()%></td>
                                <td colspan="<%=4-stocks.size()%>"><a href="detail.jsp?no=<%=product.getNo()%>"><%=product.getName()%></a></td>
                                <%
                                    int totalAmount = 0;
                                    for (Stock stock : stocks) {
                                        totalAmount += stock.getAmount();
                                %>
                                <td><%=stock.getAmount()%> 개</td>
                                <%
                                    }
                                %>
                                <td><%=totalAmount%> 개</td>
                            </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <!--페이지네이션 -->
                <%
                    if (pagination.getTotalPages() > 0) {
                %>
                <div>
                    <ul class="pagination justify-content-center">
                        <li class="page-item <%=pagination.isFirst() ? "disabled" : "" %>">
                            <a class="page-link" href="stock.jsp?page=<%pagination.getPrev(); %>">이전</a>
                        </li>
                        <%
                            for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
                        %>
                        <li class="page-item <%=pageNo == num? "active" : "" %>">
                            <a href="stock.jsp?page=<%=num %>" class="page-link"><%=num %></a>
                        </li>
                        <%
                            }
                        %>
                        <li class="page-item <%=pagination.isLast() ? "disabled" : ""%>">
                            <a class="page-link" href="stock.jsp?page=<%=pagination.getNext() %>" >다음</a>
                        </li>
                    </ul>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
<%@ include file="../../common/footer.jsp" %>
</body>
</html>
