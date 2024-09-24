function sendit() {
    const prev_pw = document.getElementById('prev_pw');
    const user_pw = document.getElementById('user_pw');
    const user_pw_vali = document.getElementById('user_pw_vali')

    // 정규 표현식
    const expPwText = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$_%^&*])[A-Za-z\d!@#$%_^&*]{8,16}$/;

    if (prev_pw.value === '') {
        alert('이전비밀번호를 입력하세요');
        prev_pw.focus();
        return false;
    }
    if (user_pw.value === '') {
        alert('새비밀번호를 입력하세요');
        user_pw.focus();
        return false;
    }
    if (user_pw_vali.value === '') {
        alert('비밀번호를 한 번 더 입력하세요');
        user_pw_vali.focus();
        return false;
    }

    if (!expPwText.test(user_pw.value)) {
        alert('비밀번호 형식확인  \n 소문자,대문자,특수문자,숫자 1개씩 입력');
        user_pw.focus();
        return false;
    }

    if (prev_pw.value === user_pw.value) {
        alert("변경할 비밀번호가 이전 비밀번호와 같습니다");
        prev_pw.focus();
        return false;
    }

    if (user_pw.value !== user_pw_vali.value) {
        alert("비밀번호가 동일한지 확인하세요")
        user_pw.focus();
        return false;
    }

    return true;
}