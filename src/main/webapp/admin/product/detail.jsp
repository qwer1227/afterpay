<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.product.*" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>상품상세페이지</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/common/css/style.css">
</head>
<body>
<%@ include file="../../common/nav.jsp" %>
<div class="container">
    <div class="row">
        <div class="text-center">
            <h1 class="my-5">상품 상세 관리 페이지</h1>
        </div>
        <%
            int productNo = Utils.toInt(request.getParameter("no"));

            // 요청파라미터로 전달받은 상품번호에 해당하는 상품 상세정보를 조회한다.
            ProductDao productDao = new ProductDao();
            Product product = productDao.getProductByNo(productNo);

            // 재고값
            StockDao stockDao = new StockDao();
            List<Stock> stocks = stockDao.getAllStocksByNo(productNo);

            // 이미지
            List<Image> images = productDao.getAllImagesByNo(productNo);
        %>
        <div class="col-5">
            <img src="../../img/<%=images.get(0).getName()%>" width="100%">
        </div>
        <div class="col-7">
            <table class="table table-bordered">
                <colgroup>
                    <col width="15%">
                    <col width="35%">
                    <col width="15%">
                    <col width="35%">
                </colgroup>
                <thead class="table-dark">
                <tr>
                    <th>항목</th>
                    <th>값</th>
                    <th>항목</th>
                    <th>값</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th>번호</th>
                    <td><%=product.getNo()%>
                    </td>
                    <th>이름</th>
                    <td><%=StringEscapeUtils.escapeHtml4(product.getName())%>
                    </td>
                </tr>
                <tr>
                    <th>카테고리</th>
                    <td><%=product.getCategory().getName()%>
                    </td>
                    <th>가격</th>
                    <td><%=Utils.toCurrency(product.getPrice())%>
                    </td>
                </tr>

                <tr>
                    <th>평점</th>
                    <td><%=product.getTotalRating()%>
                    </td>
                    <th>조회수</th>
                    <td><%=product.getViewCount()%>
                    </td>
                </tr>
                <tr>
                    <th>등록일자</th>
                    <td><%=product.getCreatedDate()%>
                    </td>
                    <th>상태</th>
                    <td><%=product.getStatus()%>
                    </td>
                </tr>
                <tr>
                    <th>상품설명</th>
                    <td colspan="3">
                        <%=product.getHtmlContent()%>
                    </td>
                </tr>
                </tbody>
            </table>

            <div class="row">
                <div class="col-6">
                    <div class="card">
                        <div class="card-header">사이즈별 재고현황</div>
                        <div class="card-body">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>사이즈</th>
                                    <th>재고수량</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    int totalAmount = 0;
                                    for (Stock stock : stocks) {
                                        totalAmount += stock.getAmount();
                                %>
                                <tr>
                                    <td><%=stock.getSize()%>
                                    </td>
                                    <td><%=stock.getAmount()%>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>

                                </tbody>
                            </table>
                        </div>
                        <div class="card-footer">

                            <p><strong>총 재고수량 : </strong> <%=totalAmount %> 개</p>
                        </div>
                    </div>
                </div>
                <div class="col-6 text-end">
                    <a href="delete.jsp?no=<%=product.getNo() %>" class="btn btn-danger">상품삭제</a>
                    <a href="modify-form.jsp?no=<%=product.getNo() %>" class="btn btn-primary">상품수정</a>
                    <a href="product.jsp" class="btn btn-success">상품목록</a>
                </div>
            </div>
        </div>
        <!--버튼-->

    </div>
</div>
<%@ include file="../../common/footer.jsp" %>
</body>
</html>
