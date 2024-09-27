<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<html>
<head>
  <title>배송지 추가</title>
</head>
<body>
<div class="card">
  <div class="card-body">
    <div class="col-12">
      <form method="post" action="addrinsert.jsp">
        <table class="table table-borderless">
          <colgroup>
            <col width="8%">
            <col width="15%">
            <col width="5%">
            <col width="*">
            <col width="35%">
          </colgroup>
          <thead>
          <tr>
            <th scope="col"></th>
            <th scope="col"></th>
            <th scope="col"></th>
            <th scope="col"></th>
            <th scope="col"></th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <th scope="row" class="text-center">수취인명</th>
            <td><input class="form-control" type="text" name="name" id="name" placeholder="이름을 입력해주세요"></td>
          </tr>
          <tr>
            <th scope="row" class="text-center">배송지명</th>
            <td><input class="form-control" type="text" name="addr_name" id="addr_name" placeholder="배송지명을 입력해주세요"></td>
          </tr>
          <tr>
            <th scope="row" class="text-center">연락처</th>
            <td><input class="form-control" type="tel" name="phone" id="phone" placeholder="연락처를 입력해주세요"></td>
          </tr>
          <tr>
            <th rowspan="3" class="text-center">주소</th>
            <td class="text-start"><input class="form-control" type="text" id="postcode" name="zipcode"
                                          placeholder="우편번호" readonly></td>
            <td><input class="form-control" type="button" value="검색" onclick="checkPost()"></td>
          </tr>
          <tr>
            <td colspan="3"><input class="form-control" type="text" name="user_address" size="50" id="user_address"
                                   placeholder="주소"
                                   readonly></td>
          </tr>
          <tr>
            <td colspan="3"><input class="form-control" type="text" name="user_detail_address" size="50"
                                   id="user_detail_address"
                                   placeholder="상세주소"></td>
          </tr>
          <tr>
            <td colspan="4" class="text-end">
              <button type="submit" class="btn btn-primary text-end">추가하기</button>
            </td>
          </tr>
          </tbody>
        </table>
      </form>
    </div>
  </div>
</div>
</body>
<script>
    function checkPost() {
        new daum.Postcode({
            oncomplete: function (data) {
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
                if (data.userSelectedType === 'R') {
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
