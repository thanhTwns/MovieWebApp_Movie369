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

        //Check nhập lại pass
        if(!pass.equals(rePass)) {
            request.setAttribute("mess", "Mật khẩu nhập lại không khớp!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }

        //Check email đã tồn tại hay chưa
        UserDAO dao = new UserDAO();
        if(dao.checkEmailExist(email)) {
            request.setAttribute("mess", "Email này đã được sử dụng!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        String hashPass = HashUtils.hashPassword(pass);

        String otp = EmailUtils.getRandomCode();
        EmailUtils.sendEmail(email, otp);
        User temp = new User(0, user, email, hashPass, null, "User", false, null, null);

        HttpSession session = request.getSession();
        session.setAttribute("pendingUser", temp);
        session.setAttribute("authCode", otp);

        response.sendRedirect("verify.jsp");
    }
}
