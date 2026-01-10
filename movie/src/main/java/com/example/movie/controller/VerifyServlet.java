package com.example.movie.controller;
import com.example.movie.dao.UserDAO;
import com.example.movie.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/verify")
public class VerifyServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String userCode = request.getParameter("otp");
        String realCode = (String) session.getAttribute("authCode");
        User pendingUser = (User) session.getAttribute("pendingUser");

        if(realCode != null && realCode.equals(userCode) && pendingUser != null) {

            UserDAO dao = new UserDAO();
            dao.register(pendingUser.getUsername(), pendingUser.getEmail(), pendingUser.getPassword());

            session.removeAttribute("authCode");
            session.removeAttribute("pendingUser");

            request.setAttribute("mess", "Đăng ký thành công! Mời đăng nhập.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            request.setAttribute("mess", "Mã xác thực không đúng!");
            request.getRequestDispatcher("verify.jsp").forward(request, response);
        }
    }

}
