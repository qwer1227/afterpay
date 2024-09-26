<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>관리자 대시보드</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="/common/css/style.css">
    <style>
        a {
            text-decoration: none;
            color: black;
        }
    </style>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<%
    if (userID == null || !userID.equals("ADMIN")) {
        response.sendRedirect("../login-form.jsp?deny");
        return;
    } else {
%>
<div class="container  mb-5" style="margin-top: 100px;">
    <div class="text-center mb-3">
        <h1>관리자 대시보드</h1>
    </div>
    <div class="row mb-3">
        <div class="col-4">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between">
                        <i class="fas fa-money-bill-alt fa-3x text-success"></i>
                        <div class="text-right text-secondary">
                            <h5>수입</h5>
                            <h3>₩ 215,000</h3>
                        </div>
                    </div>
                    <a href="/admin/settlement/settlement.jsp" class="btn btn-primary">자세히</a>
                </div>
                <div class="card-footer text-secondary">
                    <i class="fas fa-sync mr-3"></i>
                    <span>Updated Now</span>
                </div>
            </div>
        </div>
        <div class="col-4">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between">
                        <i class="fas fa-users fa-3x text-info"></i>
                        <div class="text-right text-secondary">
                            <h5>회원수</h5>
                            <h3>28 명</h3>
                        </div>
                    </div>
                    <a href="/admin/user/user.jsp" class="btn btn-primary">자세히</a>
                </div>
                <div class="card-footer text-secondary">
                    <i class="fas fa-sync mr-3"></i>
                    <span>Updated Now</span>
                </div>
            </div>
        </div>
        <div class="col-4">
            <div class="card" style="width: 100%;">
                <div class="card-body">
                    <div class="d-flex justify-content-between">
                        <i class="fas fa-shopping-cart fa-3x text-warning"></i>
                        <div class="text-right text-secondary">
                            <h5>주문건수</h5>
                            <h3>83 건</h3>
                        </div>
                    </div>
                    <a href="/admin/order/order.jsp" class="btn btn-primary">자세히</a>
                </div>
                <div class="card-footer text-secondary">
                    <i class="fas fa-sync mr-3"></i>
                    <span>Updated Now</span>
                </div>
            </div>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col-6">
            <div class="card mb-3">
                <div class="card-header"><a href="/qna/admin-qna.jsp">문의 게시판</a></div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>상태</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1</td>
                            <td>배송이 안됩니다.</td>
                            <td>답변대기중</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>환불을 요청합니다.</td>
                            <td>답변대기중</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>제품이 손상되었습니다.</td>
                            <td>답변대기중</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="card">
                <div class="card-header"><a href="#">방문자 현황</a></div>
                <div class="card-body">
                    <canvas id="weChart">
                        <script>
                            let weCt = document.getElementById('weChart');

                            let weChart = new Chart(weCt, {
                                type: 'bar',
                                data: {
                                    labels: ['9월 25일', '9월 26일', '9월 27일', '9월 28일', '9월 29일'],
                                    datasets: [
                                        {
                                            label: '방문자수',
                                            data: [15, 20, 30, 20, 5],
                                        }
                                    ]
                                },
                            });
                        </script>
                    </canvas>
                </div>
            </div>
        </div>
        <div class="col-6">
            <div class="card">
                <div class="card-header"><a href="/admin/stock/stock.jsp">상품재고 수량</a></div>
                <div class="card-body">
                    <canvas id="yourChart">
                        <script>
                            let yourCt = document.getElementById('yourChart');

                            let yourChart = new Chart(yourCt, {
                                type: 'doughnut',
                                data: {
                                    labels: ['남성상의', '남성하의', '여성상의', '여성하의', "가방", "슈즈"],
                                    datasets: [
                                        {
                                            label: '수량',
                                            data: [29, 16, 11, 11, 8],
                                        }
                                    ]
                                },
                            });
                        </script>
                    </canvas>
                </div>
            </div>
        </div>
    </div>
</div>
<%
    }
%>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
