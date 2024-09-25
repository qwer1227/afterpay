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
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<div class="container mb-5">
    <div class="row mb-5">
        <div class="col-6 my-5">
            <div class="card" style="width: 100%;">
                <div class="card-body">
                    <div class="d-flex justify-content-between">
                        <i class="fas fa-shopping-cart fa-3x text-warning"></i>
                        <div class="text-right text-secondary">
                            <h5>수입</h5>
                            <h3>215,000</h3>
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
        <div class="col-6 my-5">
            <div class="card" style="width: 100%;">
                <div class="card-body">
                    <div class="d-flex justify-content-between">
                        <i class="fas fa-shopping-cart fa-3x text-warning"></i>
                        <div class="text-right text-secondary">
                            <h5>수입</h5>
                            <h3>215,000</h3>
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
    <div class="row">
        <div>
            <div class="card" style="width: 100%;">
                <div class="card-header">
                    <h1>문의 게시판</h1>
                </div>
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                    <a href="/qna/admin-qna.jsp" class="btn btn-primary">자세히</a>
                </div>
            </div>
        </div>
    </div>
    <div>
        <canvas id="myChart" width="300" height="100">
            <script>
                let myCt = document.getElementById('myChart');

                let myChart = new Chart(myCt, {
                    type: 'bar',
                    data: {
                        labels: ['2020', '2021', '2022', '2023'],
                        datasets: [
                            {
                                label: 'Dataset',
                                data: [10,20,30,40],
                            }
                        ]
                    },
                });
            </script>
        </canvas>
        <canvas>
            <script>

            </script>
        </canvas>
    </div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
