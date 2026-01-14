package com.example.movie.controller;

// --- PHẦN IMPORT BẠN ĐANG THIẾU ---
import com.example.movie.dao.UserDAO;
import com.example.movie.utils.EmailUtils;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
// ------------------------------------

@WebServlet("/forgotPassword")
public class ForgotPasswordServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Chuyển hướng về trang nhập mail nếu người dùng vào bằng link trực tiếp
        request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        UserDAO dao = new UserDAO();

        // 1. Kiểm tra email có tồn tại không
        if (!dao.checkEmailExist(email)) {
            request.setAttribute("mess", "Email này chưa đăng ký tài khoản!");
            request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
            return;
        }

        // 2. Tạo mã OTP
        String otp = EmailUtils.getRandomCode();

        // 3. Gửi mail
        String subject = "Yêu cầu đặt lại mật khẩu - Movie369";
        String body = "Mã xác thực (OTP) để đặt lại mật khẩu của bạn là: " + otp +
                "\n\nVui lòng không chia sẻ mã này. Mã sẽ hết hạn sau 5 phút.";

        EmailUtils.sendEmail(email, subject, body);

        // 4. Lưu vào Session
        HttpSession session = request.getSession();
        session.setAttribute("authCode", otp);
        session.setAttribute("resetEmail", email);

        // 5. Chuyển sang trang nhập mã
        // Đảm bảo bạn có file verify.jsp hoặc verify-reset.jsp
        response.sendRedirect("verify.jsp");
    }
}