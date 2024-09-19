<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>상품상세페이지</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/common/css/style.css">
</head>
<body>
<%@ include file="../../common/nav.jsp" %>
    <div class="container">
        <div class="row">
            <div class="text-center">
                <h1 class="my-5">상품 상세 관리 페이지</h1>
            </div>
            <div class="col-5">
                <img src="#" width="100%">
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
                        <td>10067</td>
                        <th>이름</th>
                        <td>풀 프린트 크로스 백 레코즈 블루</td>
                    </tr>
                    <tr>
                        <th>카테고리</th>
                        <td>여성가방</td>
                        <th>가격</th>
                        <td>109,000</td>
                    </tr>
                    <tr>
                        <th>재고수량</th>
                        <td colspan="3">
                            <p>S : 10</p>
                            <p>M : 10</p>
                            <p>L : 10</p>
                        </td>
                    </tr>
                    <tr>
                        <th>가격</th>
                        <td>109,000</td>
                        <th>상태</th>
                        <td>준비중</td>
                    </tr>
                    <tr>
                        <th>등록일자</th>
                        <td>2024-09-19</td>
                        <th>수정일자</th>
                        <td>2024-09-19</td>
                    </tr>
                    <tr>
                        <th>상품설명</th>
                        <td colspan="3">카드 패브릭에 디지털 프린팅을 적용한 크로스백입니다.
                            일상 생활에 적합한 크기로 디자인 되었으며, 가방 밑단의 입체 다트와 내부 포켓은 수납에 더욱 용이하도록 설계되었습니다.
                            가방 측면부에 달린 스냅 버튼을 활용해 폴디드 형태로도 착용이 가능합니다.
                            가방 전면부에는 아이보리 컬러의 애프터프레이 로고 스웨이드 패치가 있습니다. 폴리에스터 100% 단독 손세탁 권장 (표백제 및 회전식 건조 불가)
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <!--버튼-->
            <div class="text-end my-2">
                <a href="#" class="btn btn-danger">상품삭제</a>
                <a href="#" class="btn btn-primary">상품수정</a>
                <a href="product.jsp" class="btn btn-success">상품목록</a>
            </div>
        </div>
    </div>
<%@ include file="../../common/footer.jsp" %>
</body>
</html>
