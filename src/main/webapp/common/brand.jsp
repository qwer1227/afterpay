
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
        .container div {
            margin: 70px 0px;
            font-size: 30px;
            font-weight: bolder;
            padding: 0 0 10px;
            text-align: center;
        }
    </style>
</head>
<body>
<%
    String menu = "홈";
%>
<%@ include file="../common/nav.jsp" %>
<div class="container">
    <p>브랜드</p>
    <div>
        Established in 2018, AFTER PAY is a global contemporary brand that presents ready-to-wear collections inspired by youth culture, modern literature and art.
        Offering captivating styles using luxurious materials infused with rich colors and traditional motifs that captures the vibrant energy of today's youth.
        The emphasis on the practical designs and sturdy finishing result in a sophisticated collection that seamlessly integrates into everyday lifestyle.
        Our vision leads for 'The Elegance of Youth' continuously inspires the new generation.
    </div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
