function sendit() {
    const userName = document.getElementById('user_name');
    const userEmail = document.getElementById('user_email');

    // 정규 표현식
    const expNameText= /^[가-힣]+$/; // + 반복
    const expEmailText = /^[A-Za-z-0-9\-\.]+@[A-Ja-z-0-9\-\.]+\.[A-Ja-z-0-9]+$/;

    if (userName.value === '') {
        alert('이름을 입력하세요');
        userName.focus();
        return false;
    }

    if (!expNameText.test(userName.value)){
        alert('한글로 입력하세요');
        userName.focus();
        return false;
    }

    if (userEmail.value === '') {
        alert('이메일을 입력하세요');
        userEmail.focus();
        return false;
    }

    if (!expEmailText.test(userEmail.value)){
        alert('형식에 맞는 이메일을 입력하세요');
        userName.focus();
        return false;
    }


    return true;
}