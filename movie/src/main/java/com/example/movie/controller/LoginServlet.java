package com.example.movie.controller;

import com.example.movie.dao.UserDAO;
import com.example.movie.model.User;
import com.example.movie.utils.HashUtils;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    public LoginServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String email = request.getParameter("email");
        String pass = request.getParameter("password");

        String hassPass = HashUtils.hashPassword(pass);

        UserDAO dao = new UserDAO();
        User user = dao.checkLogin(email, hassPass);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("account", user);

            // 1. Kiểm tra xem có link cũ ko
            String redirect = request.getParameter("redirect");
            if (redirect == null || redirect.isEmpty()) {
                redirect = (String) session.getAttribute("redirectAfterLogin");
                session.removeAttribute("redirectAfterLogin");
            }

            // 2. LOGIC ĐIỀU HƯỚNG
            if (redirect != null && !redirect.isEmpty()) {
                // Ưu tiên 1: Quay lại trang cũ (ví dụ đang xem phim dở bắt đăng nhập)
                response.sendRedirect(redirect);
            }
            else if ("admin".equalsIgnoreCase(user.getRole())) {
                // Ưu tiên 2: Nếu là Admin -> Vào trang Admin
                response.sendRedirect("admin");
            }
            else {
                // Ưu tiên 3: Mặc định về trang chủ
                response.sendRedirect("home");
            }

        } else {
            // Đăng nhập thất bại
            request.setAttribute("mess", "Sai Email hoặc mật khẩu!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}