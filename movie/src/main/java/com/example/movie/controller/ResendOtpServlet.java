package com.example.movie.controller;
import com.example.movie.model.User;
import com.example.movie.utils.EmailUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/resend")
public class ResendOtpServlet extends HttpServlet {

    // Dùng doGet vì bấm vào link <a> là gửi request GET
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        User pendingUser = (User) session.getAttribute("pendingUser");

        if (pendingUser == null) {
            request.setAttribute("mess", "Phiên làm việc hết hạn. Vui lòng đăng ký lại!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        String newCode = EmailUtils.getRandomCode();
        EmailUtils.sendEmail(pendingUser.getEmail(), newCode);

        session.setAttribute("authCode", newCode);

        request.setAttribute("mess", "Mã xác thực mới đã được gửi!");
        request.setAttribute("messageType", "success");
        request.getRequestDispatcher("verify.jsp").forward(request, response);
    }
}
