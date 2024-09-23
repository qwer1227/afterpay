function sendit(){

    const userid = document.getElementById('user_id');
    const name = document.getElementById('user_name');
    const email = document.getElementById('user_email');

    const expIdText = /^[A-Za-z]{4,20}$/;
    const expNameText= /^[가-힣]+$/; // + 반복
    const expEmailText = /^[A-Za-z-0-9\-\.]+@[A-Ja-z-0-9\-\.]+\.[A-Ja-z-0-9]+$/;

    if (userid.value === ''){
        alert('아이디를 입력하세요');
        userid.focus();
        return false;
    }

    if (name.value === ''){
        alert('이름을 입력하세요');
        name.focus();
        return false;
    }

    if (email.value === ''){
        alert('이메일을 입력하세요');
        email.focus();
        return false;
    }

    return true;
}