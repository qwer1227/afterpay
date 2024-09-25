<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
<link href="/common/css/style.css" rel="stylesheet">
<link href="/common/css/user.css" rel="stylesheet">
<script src="js/regist.js"></script>
<html>
<head>
    <title>회원가입</title>

</head>
<body>
<%@include file="common/nav.jsp" %>
<div class="alert-container">
    <%
        String message = null;
        if (request.getParameter("error") != null) {
            message = "중복된 아이디 혹은 이메일이 있습니다";
    %>
    <div class="alert alert-danger">
        <%= message %>
    </div>
    <%
        }
    %>
</div>

<form class="container" method="post" action="insert.jsp" onsubmit="return sendit(this.form)">
    <h2 class="text-center mb-4">회원가입</h2>
    <div class="mb-3">
        <label class="form-label">이름*</label>
        <input class="form-control" type="text" name="user_name" id="user_name" placeholder="이름을 작성해주세요 예)홍길동">
    </div>
    <div class="mb-3">
        <label class="form-label">아이디*</label>
        <input class="form-control" type="text" name="user_id" id="user_id" placeholder="아이디를 입력해주세요 예)abc1234">
    </div>
    <div class="mb-3">
        <label class="form-label">비밀번호*</label>
        <input class="form-control" type="password" name="user_pw" id="user_pw" placeholder="대,소문자 및 특수문자 8~16자 이내">
    </div>
    <div class="mb-3">
        <label class="form-label">비밀번호 확인*</label>
        <input class="form-control" type="password" name="user_pw_vali" id="user_pw_vali" placeholder="한 번 더 입력해주세요">
    </div>
    <div class="mb-3">
        <label class="form-label">이메일*</label>
        <input class="form-control" type="email" name="user_email" id="user_email" placeholder="이메일을 입력해주세요 예)abc@gmail.com">
    </div>
    <div class="mb-3">
        <label class="form-label">전화번호*</label>
        <input class="form-control" type="text" name="user_phone" id="user_phone" placeholder="전화번호를 입력해주세요 예)010-1234-5678">
    </div>
    <div class="mb-3">
        <label class="form-label">주소*</label>
        <td><input type="text" id="postcode" name="zipcode" size="5" readonly></td>
        <input class="form-control" type="button" value="우편번호검색" onclick="checkPost()">
        <input class="form-control" type="text" name="user_address" size="50" id="user_address" placeholder="주소" readonly>
        <input class="form-control" type="text" name="user_detail_address" size="50" id="user_detail_address" placeholder="상세주소">
    </div>
    <div class="text-end">
        <button type="submit" class="btn btn-primary" id="signup-button">가입하기</button>
    </div>
    <div>
        <label for="terms">
            <input type="checkbox" id="terms" name="terms"> 이용약관에 동의합니다.
        </label>
    </div>

    <div>
        <textarea id="termsContent" readonly style="width: 100%; height: 200px; resize: none;">
            이용약관
        </textarea>
    </div>
</form>
<%@include file="common/footer.jsp" %>
</body>
<script>
    function checkPost() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("user_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("user_detail_address").focus();
            }
        }).open();
    }
</script>
</html>
