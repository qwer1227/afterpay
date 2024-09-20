<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page import="com.jhta.afterpay.util.DaoHelper" %>
<%@ page import="com.jhta.afterpay.user.UserDao" %>
<%@ page import="org.apache.commons.codec.digest.DigestUtils" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%--
    요청 URL
        http://localhost/insert.jsp
    요청 URI
        insert.jsp
    쿼리스트링
        없음
    폼 데이터
        id = xxx
        name = xxx
        pwd = xxx
        pwdvail = xxx
        email = xxx@xxx.xxx
        phone = xxx-xxx-xxx
    요청 파라미터
        name            value
        ---------------------
        id              xxx
        name            xxx
        pwd             xxx
        pwdvali         xxx
        email           xxx
        phone           xxx

        1. 요청파라미터값 조회하기
        2. 아이디 중복여부 체크하기
        3. 이메일 중복여부 체크하기
        4. 비밀번호 암호화
        5. User객체에 요청된 파라미터값을 담는다
        6. UserDao로 insertUser(User user)메소드로 전달해서 데이터베이스에 저장
        7. 회원가입 완료페이지를 재요청
--%>

<%
    //요청파라미터값 저장
    String id = request.getParameter("user_id");
    String name = request.getParameter("user_name");
    String pwd = request.getParameter("user_pw");
    String email = request.getParameter("user_email");
    String phone = request.getParameter("phone");

    //이미 생성된 아이디로 생성을 막기위해
    UserDao userDao = new UserDao();
    User savedUser = userDao.getUserById(id);

    if (savedUser != null) {
        response.sendRedirect("form.jsp?error");
        return;
    }

    //비밀번호 암호화
    String sha256Pwd = DigestUtils.sha256Hex(pwd);

    User user = new User();
    user.setId(id);
    user.setName(name);
    user.setPwd(sha256Pwd);
    user.setEmail(email);
    user.setTel(phone);

    userDao.InsertUser(user);

    response.sendRedirect("index.jsp");
%>