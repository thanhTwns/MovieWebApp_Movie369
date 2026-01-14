package com.example.movie.controller;

import com.example.movie.dao.UserDAO;
import com.example.movie.model.User;
import com.example.movie.utils.HashUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/changePassword")
public class ChangePasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("account") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        request.getRequestDispatcher("change-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String oldPass = request.getParameter("oldPass");
        String newPass = request.getParameter("newPass");
        String confirmPass = request.getParameter("confirmPass");

        String hashedOldPass = HashUtils.hashPassword(oldPass);

        if (!hashedOldPass.equals(user.getPassword())) {
            request.setAttribute("mess", "Mật khẩu hiện tại không đúng!");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("change-password.jsp").forward(request, response);
            return;
        }

        if (!newPass.equals(confirmPass)) {
            request.setAttribute("mess", "Mật khẩu xác nhận không khớp!");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("change-password.jsp").forward(request, response);
            return;
        }

        if (oldPass.equals(newPass)) {
            request.setAttribute("mess", "Mật khẩu mới không được trùng với mật khẩu cũ!");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("change-password.jsp").forward(request, response);
            return;
        }

        UserDAO dao = new UserDAO();
        String hashedNewPass = HashUtils.hashPassword(newPass);
        dao.updatePassword(user.getEmail(), hashedNewPass);

        user.setPassword(hashedNewPass);
        session.setAttribute("account", user);

        session.invalidate();
        response.sendRedirect("login.jsp?message=change_success");
    }
}
