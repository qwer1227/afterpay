<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.AddressException" %>
<%@ page import="javax.mail.*" %>
<%@ page import="com.jhta.afterpay.user.UserDao" %>
<%@ page import="com.jhta.afterpay.user.User" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String id = request.getParameter("id");
    String tempPw = Utils.TempPassword();

    UserDao userDao = new UserDao();
    User user = userDao.getUserByEmailAndNameAndId(email, name, id);


    if (user == null) {
        response.sendRedirect("findpw-form.jsp?error");
        return;
    }

    final String userEmail = "afterpay923@gmail.com";
    final String password = "wsstpadiqpvinjdg"; //afterpay 앱 비밀번호

    Properties prop = new Properties();
    prop.put("mail.smtp.host", "smtp.gmail.com");
    prop.put("mail.smtp.port", 465);
    prop.put("mail.smtp.auth", "true");
    prop.put("mail.smtp.ssl.enable", "true");
    prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
    prop.put("mail.smtp.ssl.protocols", "TLSv1.2");

    Session mailSession = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(userEmail, password);
        }
    });

    try {

        MimeMessage message = new MimeMessage(mailSession);
        message.setFrom(new InternetAddress(userEmail));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); //사용자의 이메일

        // Subject
        message.setSubject("임시 비밀번호"); //메일 제목을 입력

        // Text
        message.setText(tempPw);    //메일 내용을 입력

        userDao.UpdatePw(tempPw, id, email, name);

        // send the message
        Transport.send(message); ////전송
        System.out.println("message sent successfully...");
    } catch (AddressException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    } catch (MessagingException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }

    session.setAttribute("userEmail",email);
    response.sendRedirect("successfindpw.jsp");
%>
