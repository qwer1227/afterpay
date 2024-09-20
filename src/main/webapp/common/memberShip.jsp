<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>AFTER PAY</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/style.css">
    <style>
        p {
            font-size: 30px;
            font-weight: bolder;
            padding: 0 0 10px;
            text-align: center;
            border-bottom: 1px solid #ccc;
        }
        h3 {
            font-weight: bolder;
            font-size: 20px;
            margin-bottom: 20px;
        }
        h5 {
            font-size: 13px;
            margin-bottom: 35px;
        }
    </style>
</head>
<body>
<%
    String menu = "홈";
%>
<%@ include file="../common/nav.jsp" %>
<div class="container">
    <p>멤버십</p>
    <h3>애프터 페이 멤버십 제도</h3>
    <h5>
        애프터페이 멤버십 제도 공식 온라인 부티크에 방문해 주신 고객님께 차별화된 혜택을 제공하기 위해 멤버십 제도를 운용합니다.
    </h5>
    <h3>오프라인 프레젠테이션 로열티</h3>
    <h5>
        매 시즌 GOLD 등급 회원분들에게 애프터페이의 오프라인 프레젠테이션 초대장을 발송 드립니다.
    </h5>
    <h3>생일 기념 쿠폰</h3>
    <h5>
        애프터페이 공식 홈페이지의 모든 회원분들의 생일을 기념하는 연 1회, 10% 쿠폰을 제공합니다. <br>

    </h5>
    <h3>추천인 프로모션</h3>
    <h5>
        신규 가입 시 추천인 ID 입력 후 회원가입 시 5,000원 적립금이 지급됩니다. <br>
        추천인 ID를 입력하신 신규  가입자가 상품 구매 시 추천인에게 10,000원 적립금이 지급됩니다. <br>
        적립금은 지급일로부터 1년 동안 사용 가능합니다.
    </h5>
    <h3>이용 약관</h3>
    <h5>
        • 멤버십 등급에 해당하지 않는 일반 회원의 경우, 구매 적립 2%의 혜택을 제공합니다.<br>
        • 멤버십 등급은 구매 확정 기준, 매월 1일 자동 변경됩니다. <br>
        • 멤버십 등급의 산정 조건은 최근 12개월 동안의 누적 결제금액 기준이며, 멤버십 등급은 12개월 동안 유지됩니다.<br>
        • 멤버십 등급은 오직 애프터프레이 공식 온라인 부티크에만 적용됩니다.<br>
        • 멤버십 등급에 따른 혜택은 내부 규정에 의해 일부 변경될 수 있습니다.<br>
        • 부정한 방법으로 부여된 멤버십 회원 등급은 멤버십 해제 및 적립금이 전액 회수될 수 있습니다.

    </h5>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
