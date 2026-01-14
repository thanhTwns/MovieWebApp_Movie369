package com.example.movie.controller;

import com.example.movie.dao.UserDAO;
import com.example.movie.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;


@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("account");

        if (user == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String newEmail = req.getParameter("email");

        if (newEmail == null || newEmail.trim().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/user-profile?msg=error");
            return;
        }

        UserDAO dao = new UserDAO();

        user.setEmail(newEmail);

        boolean success = dao.updateProfile(user);

        if (success) {
            session.setAttribute("account", user);

            resp.sendRedirect(req.getContextPath() + "/user-profile?msg=success");
        } else {
            resp.sendRedirect(req.getContextPath() + "/user-profile?msg=error");
        }
    }
}
