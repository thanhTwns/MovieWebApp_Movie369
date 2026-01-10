package com.example.movie.controller;

import com.example.movie.dao.FavoriteDAO;
import com.example.movie.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/favorite")
public class FavoriteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("account");
        String idString = req.getParameter("movieId");
        int idMovie = Integer.parseInt(idString);

        if(user == null) {
            resp.sendRedirect("login.jsp?redirect=detail?id=" + idString);
            return;
        }
        if(idString != null) {
            FavoriteDAO dao = new FavoriteDAO();
            dao.toggleFavorite(user.getId(),idMovie);
        }
        resp.sendRedirect("detail?id=" + idString);
    }
}
