package com.example.movie.controller;

import com.example.movie.dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebServlet("/newPassword")
public class NewPasswordServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("new-password.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newPass = request.getParameter("newPass");
        String confirmPass = request.getParameter("confirmPass");

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("forgotEmail");

        if (email == null) {
            request.setAttribute("mess", "Phiên làm việc hết hạn, vui lòng làm lại từ đầu!");
            request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
            return;
        }

        if (!newPass.equals(confirmPass)) {
            request.setAttribute("mess", "Mật khẩu xác nhận không khớp!");
            request.getRequestDispatcher("new-password.jsp").forward(request, response);
            return;
        }

        UserDAO dao = new UserDAO();
        dao.updatePassword(email, newPass);

        session.removeAttribute("forgotOtp");
        session.removeAttribute("forgotEmail");

        request.setAttribute("mess", "Đổi mật khẩu thành công! Vui lòng đăng nhập.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
