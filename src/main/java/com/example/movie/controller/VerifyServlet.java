package com.example.movie.controller;

import com.example.movie.dao.UserDAO;
import com.example.movie.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/verify")
public class VerifyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 1. Lấy mã người dùng nhập và CẮT KHOẢNG TRẮNG (Quan trọng)
        String inputCode = request.getParameter("authCode");
        if (inputCode != null) {
            inputCode = inputCode.trim(); // Xóa dấu cách thừa đầu/cuối
        }

        // 2. Lấy mã trong hệ thống (Session)
        HttpSession session = request.getSession();
        String serverCode = (String) session.getAttribute("authCode");

        // --- DEBUG: In ra màn hình console để soi lỗi ---
        System.out.println("User nhập: [" + inputCode + "]");
        System.out.println("Server có: [" + serverCode + "]");
        // ------------------------------------------------

        // 3. So sánh mã
        if (inputCode != null && inputCode.equals(serverCode)) {

            // --- MÃ ĐÚNG -> PHÂN LUỒNG XỬ LÝ ---
            User pendingUser = (User) session.getAttribute("pendingUser");

            if (pendingUser != null) {
                // A. TRƯỜNG HỢP ĐĂNG KÝ (Có người dùng chờ)
                UserDAO dao = new UserDAO();

                // Lưu vào DB (Đảm bảo gọi đúng tên hàm getter trong User của bạn)
                dao.register(pendingUser.getUsername(), pendingUser.getEmail(), pendingUser.getPassword());

                // Dọn dẹp Session
                session.removeAttribute("pendingUser");
                session.removeAttribute("authCode");

                request.setAttribute("mess", "Đăng ký thành công! Hãy đăng nhập.");
                request.getRequestDispatcher("login.jsp").forward(request, response);

            } else {
                // B. TRƯỜNG HỢP QUÊN MẬT KHẨU (Không có user chờ -> Là đang reset pass)
                // Lưu ý: Lúc này Session vẫn đang giữ cái "resetEmail" để bước sau dùng

                // Xóa mã OTP đi để tránh dùng lại (nhưng giữ lại email trong session nhé)
                session.removeAttribute("authCode");

                // Chuyển hướng sang trang đặt lại mật khẩu mới
                response.sendRedirect("new-password.jsp");
            }

        } else {
            // 4. Mã sai
            request.setAttribute("mess", "Mã xác thực không đúng!");
            request.getRequestDispatcher("verify.jsp").forward(request, response);
        }
    }
}