package com.example.movie.controller;

import com.example.movie.dao.UserDAO;
import com.example.movie.model.User;
import com.example.movie.utils.EmailUtils;
import com.example.movie.utils.HashUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String user = request.getParameter("username");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        String rePass = request.getParameter("re-password");

        // 1. Check nhập lại pass
        if (!pass.equals(rePass)) {
            request.setAttribute("mess", "Mật khẩu nhập lại không khớp!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return; // <--- QUAN TRỌNG: Phải có return để dừng code tại đây
        }

        // 2. Check email đã tồn tại hay chưa
        UserDAO dao = new UserDAO();
        if (dao.checkEmailExist(email)) {
            request.setAttribute("mess", "Email này đã được sử dụng!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return; // <--- QUAN TRỌNG: Phải có return
        }

        // 3. Mã hóa mật khẩu
        String hashPass = HashUtils.hashPassword(pass);

        // 4. Tạo mã OTP (Đây là đoạn bạn bị thiếu)
        String code = EmailUtils.getRandomCode(); // Tạo mã ngẫu nhiên

        // 5. Soạn nội dung và gửi mail
        String subject = "Xác thực đăng ký tài khoản Movie369";
        String body = "Mã xác thực của bạn là: " + code + "\nMã này có hiệu lực trong vòng 5 phút.";

        EmailUtils.sendEmail(email, subject, body);

        // 6. Tạo đối tượng User tạm thời (chưa lưu vào DB ngay)
        // Lưu ý: Đảm bảo Constructor của User khớp với các tham số này
        User temp = new User(0, user, email, hashPass, null, "User", false, null, null);

        // 7. Lưu vào Session để sang trang verify.jsp kiểm tra
        HttpSession session = request.getSession();
        session.setAttribute("pendingUser", temp);
        session.setAttribute("authCode", code); // Sửa 'otp' thành 'code' cho đồng bộ

        // 8. Chuyển hướng sang trang nhập mã
        response.sendRedirect("verify.jsp");
    }
}