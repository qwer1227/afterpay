
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
    <p>제품 관리</p>
    <h3>의류 제품 케어 가이드</h3>
    <h5>
        애프터프레이의 의류 제품은 고품질 소재, 정교한 디테일, 그리고 정밀한 봉제 기술을 통해 제작되었습니다.
        제품의 원래 상태를 오랫동안 유지하기 위해, 의류를 면 소재의 전용 커버에 넣어 건조하고 서늘한 장소에 보관하는 것이 좋습니다.
        대부분의 애프터프레이 의류는 드라이클리닝이 필요합니다. 모피와 가죽 의류는 전문가에게 맡기는 것이 좋습니다.
        또한, 비나 눈에 노출될 경우 의류를 옷걸이에 걸어 자연건조하고, 부드러운 면 소재의 타월을 사용하여 얼룩을 조심스럽게 닦아내세요.
        울 소재의 의류를 세탁할 때는 울 전용 세제를 사용하는 것이 좋습니다. 벨크로나 거친 장식이 있는 의류는 분리하여 세탁하시기 바랍니다.
        사이클링 소재로 만들어진 의류는 건조기를 사용하지 않는 것이 좋습니다. 건조기 사용은 의류의 수축이나 품질 저하로 이어질 수 있습니다.
        데님 의류는 워시드 가공과 염색을 통해 의도적으로 빈티지 스타일을 표현하고 있습니다. 이로 인해 색상이 자연스럽게 변하거나 사용감이 증가할 수 있습니다.
        세탁 시에는 제품 안쪽의 케어 라벨에 기재된 세탁 지침을 자세히 확인해 주세요.
    </h5>
    <h3>니트웨어 케어 가이드</h3>
    <h5>
        애프터프레이의 니트 제품은 우수한 품질의 원사로 제작되었습니다. 니트의 품질과 원래의 상태를 유지하기 위해서는 옷걸이에 걸지 말고, 접어서 평평한 곳에 보관하는 것이 좋습니다.
        보풀은 소재 본연의 특성으로 인해 발생할 수 있으며, 이를 최소화하기 위해서는 일상생활에서 불필요한 마찰을 피하시기 바랍니다.
        물, 기름, 화장품 등이 니트에 닿지 않도록 주의해 주세요. 더 자세한 세탁 지침은 니트 제품 안쪽에 있는 케어 라벨을 확인해 주세요.
        이를 참고하여 제품을 올바르게 관리하시면 니트의 내구성과 아름다움을 오래 동안 유지할 수 있습니다.
    </h5>
    <h3>가방&스몰 레더 제품 케어 가이드</h3>
    <h5>
        애프터프레이의 가방 및 스몰 레더 제품은 탁월한 품질의 천연 가죽 소재를 사용하여 독특하고 세련된 디테일을 가진 제품으로 제작되었습니다.
        톤이 일부 다르게 나타나거나 자국 및 자연스러운 그레인이 있는 경우는 천연 가죽 본연의 특징이며, 제품의 불량으로 간주되지 않습니다.
        가죽 제품의 컨디션을 오래 유지하려면 자외선과 열원에 장기간 노출을 피하는 것이 좋습니다.
        제품과 함께 제공되는 코튼 소재의 의상 커버에 의상을 넣어 건조하고 서늘한 장소에 보관하는 것이 좋습니다.
        눈이나 비를 맞을 시 문지르지 않고 물기를 제거한 다음, 부드러운 면 소재 타월로 가볍게 누르듯 닦아 실온에서 자연건조시켜야 합니다.
        물, 기름, 화장품 등이 가죽에 닿지 않도록 주의해 주세요. 가방의 세탁 및 관리에 대한 상세한 지침은 제품 안쪽에 있는 케어 라벨을 확인하시기 바랍니다.
        이를 참고하여 제품을 올바르게 관리하면 오랫동안 뛰어난 상태를 유지할 수 있습니다.
    </h5>
    <h3>슈즈 제품 케어 가이드</h3>
    <h5>
        애프터프레이의 슈즈 제품은 양질의 천연 가죽과 다양한 소재를 활용하여 위트 있는 매력을 지닌 제품으로 제작됩니다.
        이틀간 연속 착용한 후에는 다른 신발로 교체하여 착용하시길 권장합니다. 착용하지 않는 동안 가죽 섬유의 경우 필수적인 환기와 본연의 형태를 완만하게 복구하는 시간을 갖게 됩니다.
        착용하지 않을 때는 신발을 구매할 때 받은 펠트 파우치에 넣어 열원에서 멀리 떨어진 건조한 장소에 보관하세요.
        이염을 방지하려면, 다른 가죽 소재나 색상이 짙은 제품과 접촉하지 않도록 유의해 주세요.
        천과 가죽 소재 신발 또는 천 소재만으로 제작한 신발을 물에 완전히 적시거나 세탁기로 세척해서는 안 됩니다.
        천 소재 표면 얼룩을 세척하려면, 묽은 비눗물에 적신 천으로 닦은 후, 충분히 말린 다음 펠트 파우치에 넣어주세요.
        스웨이드 및 누벅 가죽은 부드러운 신발용 솔을 활용해, 본연의 질감을 보존할 수 있습니다.
    </h5>
    <h3>제품 수선 서비스 정책</h3>
    <h5>
        불량 혹은 불가피한 사유로 인해 손상된 제품에 대해 유효한 구매 증빙이 있는 경우 무료 수선 서비스를 제공하고 있습니다.
        이 서비스는 30일 반품 정책이 더 이상 적용되지 않는 의류에도 해당되며, 다만 특정 유형의 손상이 된 제품은 수선이 불가능할 수 있습니다.
        애프터프레이의 수선팀이 제품을 수령한 후, 수선 완료까지 약 3-4주 정도의 시간이 소요될 수 있습니다.
        수선 서비스에 관한 자세한 정책은 아래의 수선 서비스 메뉴를 확인해 주세요.
        고객님의 제품을 최상의 상태로 복원하기 위해 최선을 다하겠습니다.
    </h5>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>