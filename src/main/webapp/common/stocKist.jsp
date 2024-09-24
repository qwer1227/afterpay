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
      text-align: center;
      margin-bottom: 20px;
    }
    h5 {
      text-align: center;
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
  <p>스톡키스트</p>
  <h3>고객 센터</h3>
  <h5>
    애프터페이의 제품 관련 문의 및 온라인 C/S 상담은 연락주시면 <br>
    상담원이 친절하게 답변 드리겠습니다. <br>
    영업시간 : 월 - 금 10:00 ~ 18:00 / 점심시간 : 12:30 ~ 14:00 <br>
    연락처 : 1577 - 1111
  </h5>
  <h3>비즈니스 및 마케팅 이메일</h3>
  <h5>이메일 : afterpay@gmail.com</h5>
  <h3>본사 주소</h3>
  <h5>서울특별시 종로구 율곡로 10길 105 4층</h5>
  <h5>대표 홍기문</h5>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
