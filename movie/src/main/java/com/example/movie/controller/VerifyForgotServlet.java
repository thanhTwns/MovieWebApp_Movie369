package com.example.movie.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/verifyForgot")
public class VerifyForgotServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("actionUrl", "verifyForgot");
        request.getRequestDispatcher("verify.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userOtp = request.getParameter("otp");
        String serverOtp = (String) session.getAttribute("forgotOtp");

        if (serverOtp != null && serverOtp.equals(userOtp)) {
            response.sendRedirect("new-password.jsp");
        } else {
            request.setAttribute("mess", "Mã OTP không chính xác, thử lại xem!");
            request.setAttribute("messageType", "error");
            request.setAttribute("actionUrl", "verifyForgot");
            request.getRequestDispatcher("verify.jsp").forward(request, response);
        }
    }
}
