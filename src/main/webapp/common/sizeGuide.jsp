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
  <p>사이즈 가이드</p>
  <h3>아우터 웨어 제품 측정 방법</h3>
  <h5>
    A 가슴너비 : 바디의 가슴부에서 가장 넓은 부분을 측정합니다. <br>
    B 어깨너비 : 바디의 전면부 어깨 끝에서부터 반대편 어깨의 가장 넓은 부분을 측정합니다. <br>
    C 소매기장 : 바디의 어깨 끝에서부터 소매 밑단까지 측정합니다. <br>
    D 총기장 : 바디의 네크 후면 중심부(칼라 제외)부터 밑단까지 측정합니다.
  </h5>
  <h3>래글런 소매 제품 측정 방법</h3>
  <h5>
    A 가슴너비 : 바디의 가슴부에서 가장 넓은 부분을 측정합니다. <br>
    B 화장(래글런 소매) : 네크 후면 중심부에서 래글런 소매의 어깨 지점을 거쳐, 일자로 <br>
    소매밑단까지 측정합니다. <br>
    C 소매기장 : 바디의 네크 후면 중심부(칼라 제외) 밑단까지 측정합니다. <br>
  </h5>
  <h3>이너 제품 측정 방법</h3>
  <h5>
    A 가슴너비 : 바디의 가슴부에서 가장 넓은 부분을 측정합니다. <br>
    B 어깨너비 : 바디의 전면부 어깨 끝에서부터 반대편 어깨의 가장 넓은 부분을 측정합니다. <br>
    C 소매기장 : 바디의 어깨 끝에서부터 소매 밑단까지 측정합니다. <br>
    D 총기장 : 바디의 네크 후면 중심부(칼라 제외)부터 밑단까지 측정합니다.
  </h5>
  <h3>하의 제품 측정 방법</h3>
  <h5>
    A 허리너비 : 바지 허리의 가장 최상단 지점에서의 단면 길이를 측정합니다. <br>
    B 밑위기장 : 허리(벨트포함)에서 바지 솔깃 부분까지의 길이를 측정합니다. <br>
    C 허벅지너비 : 제품의 밑위 끝 지점에서 허벅지 너비를 측정합니다. <br>
    D 총기장 : 허리(벨트 포함)에서부터 밑단까지의 세로길이를 측정합니다. <br>
    E 밑단너비 : 바지 밑단의 가장 넓은 부분을 측정합니다.
  </h5>
  <h3>슈즈 제품 측정 방법</h3>
  <h5>
    A 발길이 : 발 뒤꿈치부터 가장 긴 발가락 사이의 길이를 측정합니다. <br>
    B 겉굽높이 : 아웃솔 후면부의 높이를 측정합니다. <br>
  </h5>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
