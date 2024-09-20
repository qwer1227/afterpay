<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
  <link href="/common/css/style.css" rel="stylesheet" >
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <title>AFTER PAY_Shopping List</title>
</head>
<style>
  h2{
    text-align: center;
  }
  #cart-info{
    height: 120px;
  }
</style>
<body>
<%@include file="../common/nav.jsp"%>
<div class="container">
  <div class="row">
    <!-- 메뉴 nav 사용 -->
    <div class="col-2">
      <%@include file="../common/user-nav.jsp"%>
    </div>

    <!-- 컨텐츠 -->
    <div class="col-10">
      <h2 class="m-4"><strong>장바구니</strong></h2>
      <div class="tab-content" id="nav-tabContent">
        <div class="hstack gap-3">
          <div class="p-2">
            <input id="check-all" type="checkbox" name="all" onchange="checkAll()" style="zoom:1.8">
          </div>
          <div class="p-3 ms-auto">
            <button class="btn btn-lg">
              <i class="bi bi-trash"></i>
            </button>
          </div>
        </div>

        <div class="tab-pane fade show active" id="nav-cart" role="tabpanel" aria-labelledby="nav-home-tab">
          <div class="table-responsive">
            <table class="table align-middle">
              <colgroup>
                <col width="1%">
                <col width="15%">
                <col width="*">
                <col width="15%">
              </colgroup>
              <tr>
                <td>
                  <input type="checkbox" name="cartNo" onchange="checkSelect()" style="zoom:1.5" value="check-item">
                </td>
                <td>
                  <img src="../img/main2.png" class="rounded mx-auto d-block" width="170">
                </td>
                <td class="align-top">
                  <p></p>
                  <p style="font-size: 20px"><strong>상품명</strong></p>
                  <p>사이즈</p>
                  <p>수량</p>
                  <p>가격</p>
                </td>
                <td class="align-middle text-end">
                  <button class="btn btn-outline-primary">상세보기</button>
                </td>
              </tr>

              <tr>
                <td>
                  <input type="checkbox" name="cartNo" onchange="checkSelect()" style="zoom:1.5" value="check-item">
                </td>
                <td>
                  <img src="../img/main2.png" class="rounded mx-auto d-block" width="170">
                </td>
                <td class="align-top">
                  <p></p>
                  <p style="font-size: 20px"><strong>상품명</strong></p>
                  <p>사이즈</p>
                  <p>수량</p>
                  <p>가격</p>
                </td>
                <td class="align-middle text-end">
                  <button class="btn btn-outline-primary">상세보기</button>
                </td>
              </tr>
            </table>
          </div>
        </div>

        <!-- Item Total Info -->
        <div class="text-center mt-4 mb-5">
          <div class="row fs-5" id="cart-info">
            <!-- cart -->
            <table border="1">
              <tr class="fs-5">
                <td>총 선택 갯수</td>
                <td>배송비</td>
                <td>총 결제 금액</td>
                <td rowspan="2"><a href="" type="submit"><button class="btn btn-outline-success btn-lg">지금 주문하기</button></a></td>
              </tr>
              <tr>
                <td><strong>1 개</strong></td>
                <td><strong>3000 원</strong></td>
                <td><strong>20000 원</strong></td>
                <td></td>
              </tr>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
  function checkAll(){
    let isChecked = document.querySelector("[name=all]").checked;
    console.log('체크여부', isChecked);

    let checkBoxes = document.querySelectorAll("[name=cartNo]");
    checkBoxes.forEach(function (el) {
      el.checked = isChecked;
    })
  }

  function checkSelect() {
    let checkBoxes = document.querySelectorAll("[name=cartNo]");
    let checkBoxesLength = checkBoxes.length;
    let checkedLength = 0;

    for (let el of checkBoxes) {
      if (el.checked) {
        checkedLength++;
      }
    }

    if (checkBoxesLength == checkedLength){
      document.querySelector("[name=all]").checked = true;
    } else {
      document.querySelector("[name=all]").checked = false;
    }
  }
</script>
<%@include file="../common/footer.jsp"%>
</body>
</html>