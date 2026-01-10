package com.example.movie.utils;

import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.Authenticator;
import java.net.PasswordAuthentication;
import java.util.Properties;
import java.util.Random;

public class EmailUtils {

    public static String getRandomCode() {
        Random rd = new Random();
        int num = rd.nextInt(999999);
        return String.format("%06d", num);
    }

    public static void sendEmail(String toEmail, String code) {
        // Cấu hình Email của bạn (ADMIN)
        final String fromEmail = "23130367@st.hcmuaf.edu.vn";
        final String password = "ywxk npmb uizx jhkl"; // App Password

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP Host
        props.put("mail.smtp.port", "587"); // TLS Port
        props.put("mail.smtp.auth", "true"); // Enable Auth
        props.put("mail.smtp.starttls.enable", "true"); // Enable TLS

        // Tạo Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                return new javax.mail.PasswordAuthentication(fromEmail, password);
            }
        };

        Session session = Session.getInstance(props, auth);

        try {
            MimeMessage msg = new MimeMessage(session);
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.setFrom(new InternetAddress(fromEmail, "Movie369 Admin"));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
            msg.setSubject("Xác thực đăng ký tài khoản Movie369");
            msg.setText("Mã xác thực của bạn là: " + code + "\nMã này có hiệu lực trong vòng 5 phút.", "UTF-8");

            Transport.send(msg);
            System.out.println("Gửi mail thành công!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
