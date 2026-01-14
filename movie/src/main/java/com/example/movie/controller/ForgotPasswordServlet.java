package com.example.movie.controller;

import com.example.movie.dao.UserDAO;
import com.example.movie.utils.EmailUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/forgotPassword")
public class ForgotPasswordServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        UserDAO dao = new UserDAO();

        if (!dao.checkEmailExist(email)) {
            request.setAttribute("mess", "Email này chưa đăng ký tài khoản nào!");
            request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
            return;
        }

        String otp = EmailUtils.getRandomCode();
        EmailUtils.sendEmail(email, otp);

        HttpSession session = request.getSession();
        session.setAttribute("forgotOtp", otp);
        session.setAttribute("forgotEmail", email);

        request.setAttribute("actionUrl", "verifyForgot");
        request.setAttribute("mess", "Mã xác thực đã gửi vào email!");
        request.setAttribute("messageType", "success");

        request.getRequestDispatcher("verify.jsp").forward(request, response);
    }
}
