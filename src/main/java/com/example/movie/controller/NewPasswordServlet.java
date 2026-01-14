package com.example.movie.controller;

import com.example.movie.dao.UserDAO;
import com.example.movie.utils.HashUtils;

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

        // 1. Kiểm tra session (nếu mất session thì bắt làm lại)
        if (email == null || email.isEmpty()) {
            request.setAttribute("mess", "Phiên làm việc hết hạn, vui lòng nhập lại email!");
            request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
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
        String encodedPass = HashUtils.hashPassword(newPass);

        // --- SỬA ĐỔI QUAN TRỌNG TẠI ĐÂY ---
        // Gọi hàm changePassword và nhận về kết quả True/False
        boolean isSuccess = dao.changePassword(email, encodedPass);

        if (isSuccess) {
            // 4. Nếu Thành Công: Dọn dẹp session và chuyển hướng Login
            session.removeAttribute("resetEmail");
            session.removeAttribute("authCode");

            request.setAttribute("mess", "Đổi mật khẩu thành công! Hãy đăng nhập ngay.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            // 5. Nếu Thất Bại: Báo lỗi và giữ người dùng ở lại trang nhập pass
            // (Lỗi này thường do sai tên cột DB hoặc Email không khớp)
            request.setAttribute("mess", "Lỗi hệ thống: Không thể cập nhật mật khẩu. Vui lòng thử lại!");
            request.getRequestDispatcher("new-password.jsp").forward(request, response);
        }
    }
}