package com.example.movie.controller;
import com.example.movie.dao.RatingDAO;
import com.example.movie.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
@WebServlet("/rating")
public class RatingServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("account");

        String movieIdRaw = req.getParameter("movieId");
        String starRaw = req.getParameter("star");

        // 1. Chưa đăng nhập -> Login
        if (user == null) {
            resp.sendRedirect("login.jsp?redirect=detail?id=" + movieIdRaw);
            return;
        }

        if (movieIdRaw != null && starRaw != null) {
            RatingDAO dao = new RatingDAO();
            dao.submitRating(user.getId(),
                    Integer.parseInt(movieIdRaw),
                    Integer.parseInt(starRaw));
        }

        resp.sendRedirect("detail?id=" + movieIdRaw);
    }
}
