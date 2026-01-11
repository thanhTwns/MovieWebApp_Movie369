package com.example.movie.controller;

import com.example.movie.dao.UserDAO;
import com.example.movie.utils.HashUtils; // Import đúng file HashUtils của bạn

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/newPassword")
public class NewPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String newPass = request.getParameter("newPass");
        String confirmPass = request.getParameter("confirmPass");

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("resetEmail");

        // 1. Kiểm tra session
        if (email == null || email.isEmpty()) {
            response.sendRedirect("forgot-password.jsp");
            return;
        }

        // 2. Kiểm tra mật khẩu nhập lại
        if (!newPass.equals(confirmPass)) {
            request.setAttribute("mess", "Mật khẩu xác nhận không khớp!");
            request.getRequestDispatcher("new-password.jsp").forward(request, response);
            return;
        }

        // 3. Xử lý lưu mật khẩu
        UserDAO dao = new UserDAO();

        // --- SỬA QUAN TRỌNG: Gọi đúng hàm hashPassword của bạn ---
        String encodedPass = HashUtils.hashPassword(newPass);

        // Lưu vào DB
        dao.changePassword(email, encodedPass);

        // 4. Dọn dẹp Session
        session.removeAttribute("resetEmail");
        session.removeAttribute("authCode");

        // 5. Chuyển hướng
        request.setAttribute("mess", "Đổi mật khẩu thành công! Hãy đăng nhập ngay.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}