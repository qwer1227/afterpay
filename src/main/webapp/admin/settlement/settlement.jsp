<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>상품관리페이지</title>
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
<div class="container mb-5" style="margin-top: 100px;">
    <div class="row mb-3">
        <div class="col-9 offset-2">
            <h1 class="text-center">정산관리</h1>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col-2">
            <!-- 메뉴목록 -->
            <%@include file="../admin-nav.jsp" %>
        </div>

        <div class="col-10">
            <table class="table">
                <thead>
                <tr>
                    <th>거래번호</th>
                    <th>거래날짜</th>
                    <th>거래유형</th>
                    <th>고객</th>
                    <th>상품서비스</th>
                    <th>수입금액</th>
                    <th>지출금액</th>
                    <th>결제방법</th>
                    <th>세금</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>2024-09-22</td>
                    <td>판매</td>
                    <td>홍길동</td>
                    <td>로프 체인 로퍼 블랙</td>
                    <td>169,000</td>
                    <td>0</td>
                    <td>카드</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>2024-09-22</td>
                    <td>환불</td>
                    <td>김유신</td>
                    <td>다미에 프린티드 진스 브라운</td>
                    <td>0</td>
                    <td>149,000</td>
                    <td>현금</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>2024-09-22</td>
                    <td>구입</td>
                    <td>손흥민</td>
                    <td>카펜터 워시드 데님 진스 인디고</td>
                    <td>195,000</td>
                    <td>0</td>
                    <td>계좌이체</td>
                    <td>0</td>
                </tr>
                </tbody>
            </table>
            <div>
                <ul class="pagination justify-content-center mb-3">
                    <li class="page-item"><a class="page-link" href="#">이전</a></li>
                    <li class="page-item"><a href="#" class="page-link">1</a></li>
                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                    <li class="page-item"><a href="#" class="page-link">3</a></li>
                    <li class="page-item"><a href="#" class="page-link">4</a></li>
                    <li class="page-item"><a href="#" class="page-link">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">다음</a></li>
                </ul>
            </div>
            <div class="mt-3">
            <table class="table">
                <colgroup>
                    <col width="25%">
                    <col width="25%">
                    <col width="25%">
                    <col width="25%">
                </colgroup>
                <tr>
                    <th>총 수입금액</th>
                    <th>총 지출금액</th>
                    <th>세금</th>
                    <th class="table-dark">최종 결재금액</th>
                </tr>
                <tr>
                    <th><strong>364,000</strong> 원</th>
                    <th><strong>149,000</strong> 원</th>
                    <th><strong>0</strong></th>
                    <th class="table-dark"><strong>215,000</strong> 원</th>
                </tr>
            </table>
            </div>
        </div>
    </div>
</div>
<%@ include file="../../common/footer.jsp" %>
</body>
</html>
