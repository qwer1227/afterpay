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
  <p>배송 안내</p>
  <h3>일반 배송</h3>
  <h5>
    애프터프레이의 모든 상품들은 대한민국 국내에 한하여 주문이 가능합니다.
    국내 배송의 경우 평균 1–3일 정도 소요됩니다.
    단, 지역 운송사 사정에 따라 다소 차이가 있을 수 있습니다.
    예약 배송의 경우, 상품 설명에 기재된 일정에 따라 순차적으로 출고됩니다.
  </h5>
  <h3>주문 상황 조회</h3>
  <h5>
    주문하신 상품의 진행 상황은 공식 홈페이지 내 [내 정보] &gt; [주문 내역]에서 확인하실 수 있습니다.
    결제가 완료되지 않은 주문 내역은 3일 후 자동으로 취소됩니다.
  </h5>
  <h3>배송 현황 조회</h3>
  <h5>
    결제가 완료되면 평일 기준 24시간 내 카카오톡으로 운송장 번호가 전송됩니다.
    안내 받으신 송장 번호는 당일 오후 7시 이후부터 배송 조회가 가능합니다.
  </h5>
  <h3>배송지 변경</h3>
  <h5>

    1577-1111 또는 1:1문의로 연락 주시기 바랍니다.
    단, 이미 상품이 발송된 경우 배송지 변경이 불가합니다.
  </h5>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>

