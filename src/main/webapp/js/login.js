function sendit() {
    const userid = document.getElementById('user_id');
    const userpw = document.getElementById('user_pw');

    // 정규 표현식
    const expIdText = /^[A-Za-z]{4,20}$/;
    const expPwText = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$_%^&*])[A-Za-z\d!@#$%_^&*]{8,16}$/;

    if (userid.value === '') {
        alert('아이디를 입력하세요');
        userid.focus();
        return false;
    }

    if (userpw.value === '') {
        alert('비밀번호를 입력하세요');
        userpw.focus();
        return false;
    }


    return true;
}