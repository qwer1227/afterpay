function sendit(){

    const userid = document.getElementById('user_id');
    const userpw = document.getElementById('user_pw');
    const userpw_vali = document.getElementById('user_pw_vali');
    const prevpw = document.getElementById('prev_pw');
    const name = document.getElementById('user_name');
    const email = document.getElementById('user_email');

    // 정규 표현식
    const expIdText = /^[A-Za-z]{4,20}$/;
    const expPwText = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$_%^&*])[A-Za-z\d!@#$%_^&*]{8,16}$/;
    const expNameText= /^[가-힣]+$/; // + 반복
    const expEmailText = /^[A-Za-z-0-9\-\.]+@[A-Ja-z-0-9\-\.]+\.[A-Ja-z-0-9]+$/;

    if(name.value === ''){
        alert('이름을 입력하세요');
        name.focus();
        return false;
    }

    if(!expNameText.test(name.value)){
        alert('이름은 한글로 입력하세요');
        name.focus();
        return false
    }

    if(userid.value === ''){//value가 입력한 값을 의미한다
        alert('아이디를 입력하세요');
        userid.focus();
        return false
    }

    if(!expIdText.test(userid.value)){
        alert('아이디는 4자 이상 20자 이하의 대소문자로 시작하는 조합입니다');
        userid.focus();
        return false
    }

    if(userpw.value === ''){
        alert('비밀번호를 입력하세요');
        userpw.focus();
        return false
    }

    if(!expPwText.test(userpw.value)){
        alert('비밀번호 형식확인  \n 소문자,대문자,특수문자,숫자 1개씩 입력');
        userpw.focus();
        return false
    }
    if(userpw.value !== userpw_vali.value){
        alert('비밀번호가 동일한지 확인하세요')
        userpw_vali.focus();
        return false
    }

    if(email.value === ''){
        alert('이메일을 입력하세요');
        email.focus();
        return false;
    }

    if(!expEmailText.test(email.value)){
        alert('이메일  형식을 확인하세요 \n하이픈(-)을 포함해야 합니다.');
        email.focus();
        return false
    }

    return true;
}