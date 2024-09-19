<%@ page import="com.jhta.afterpay.product.StockDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.product.Stock" %>
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
    <div class="container">
        <div class="text-center">
            <h1 class="my-5">상품재고 현황표</h1>
        </div>
        <div class="row">
            <div class="col-2 pt-5">
                <!-- 메뉴목록 -->
                <ul class="list-group">
                    <li class="list-group-item"><a href="../home.jsp">관리자메인</a></li>
                    <li class="list-group-item"><a href="#">회원관리</a></li>
                    <li class="list-group-item"><a href="#">주문관리</a></li>
                    <li class="list-group-item"><a href="#">적립금관리</a></li>
                </ul>
                <ul class="list-group">
                    <li class="list-group-item"><a href="../product/product.jsp">상품관리</a></li>
                    <li class="list-group-item"><a href="../qna/qna.jsp">문의관리</a></li>
                    <li class="list-group-item"><a href="../product/stock.jsp">상품재고현황</a></li>
                    <li class="list-group-item"><a href="#">정산관리</a></li>
                </ul>
            </div>
            <div class="col-10 my-1">
                <%
                    StockDao stockDao = new StockDao();
                    List<Stock> stockList = stockDao.getAllStocks();
                %>
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
                        for(Stock stock : stockList) {
                    %>
                        <tr>
                            <td><%=stock.getNo() %></td>
                            <td>어포지션 하프 패널 풀오버 후디 베이지</td>
                            <td><%=stock.getAmount()%></td>
                            <td>5 개</td>
                            <td>20 개</td>
                            <td>55 개</td>
                        </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<%@ include file="../../common/footer.jsp" %>
</body>
</html>
