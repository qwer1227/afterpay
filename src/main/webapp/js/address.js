// 1. 삭제 버튼을 제외한 나머지 버튼은 다중 선택 불가
// 다중 선택 후, 버튼 클릭 시 "한 건만 선택해주세요" 문구 알림
// 2. 기본 배송지는 바로 삭제 불가
// 삭제 버튼 클릭 시, "기본 배송지는 삭제가 불가능합니다. 기본 배송지를 변경 후 삭제해주세요." 문구 알림

function changeDefaultAddr() {
    // 한 개 선택여부 체크
    if(getCheckedCount() == 0){
        alert("변경할 기본 배송지를 선택해주세요.")
        return;
    }

    if(getCheckedCount() != 1){
        alert("한 건의 배송지만 기본 배송지로 선택 가능합니다.")
        return;
    }

    // 기본 배송지 설정 여부 체크
    let checkBox = getCheckedCheckBox();
    if (checkBox.getAttribute(("data-default-addr") === "Y")) {
        alert("이미 설정된 기본 배송지입니다.");
        return;
    }

    // 참이면 동작할 페이지로 이동
    let changeDefaultAddrForm = document.getElementById("change-default-addr");
    changeDefaultAddrForm.setAttribute("action", "");
    changeDefaultAddrForm.submit();
}

function updateAddr() {
    // 한 개 선택여부 체크
    if(getCheckedCount() == 0){
        alert("수정할 배송지를 선택해주세요.")
        return;
    }

    if(getCheckedCount() !== 1){
        alert("한 건의 배송지만 수정 가능합니다. 한 건만 선택해주세요.")
        return;
    }

    // 참이면 동작할 페이지로 이동
    let addAddrForm = document.getElementById("update-addr");
    addAddrForm.setAttribute("action", "");
    addAddrForm.submit();
}

function deleteAddr() {
    // 한 개 이상 선택여부 체크
    if(getCheckedCount() !== 0){
        alert("한 건 이상의 배송지를 선택해주세요.")
        return;
    }

    // 참이면 동작할 페이지로 이동
    let deleteForm = document.getElementById("delete-addr");
    deleteForm.setAttribute("action", "delete-address.jsp");
    deleteForm.submit();
}

function getCheckedCount() {
    let cnt = 0;
    let checkboxes = document.querySelectorAll("[name=btn-addr]");

    for (let check of checkboxes){
        if (check.checked){
            cnt++;
        }
    }

    return cnt;
}

function getCheckedCheckBox() {
    let checkboxes = document.querySelectorAll("[name=btn-addr]");

    for (let check of checkboxes) {
        if (check.checked) {
            return check;
        }
    }
}