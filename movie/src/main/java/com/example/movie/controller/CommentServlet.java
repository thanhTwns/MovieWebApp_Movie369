package com.example.movie.controller;

import javax.servlet.http.HttpServlet;
import com.example.movie.dao.CommentDAO;
import com.example.movie.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/post-comment")
public class CommentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("account");

        if(user == null) {
            resp.sendRedirect("login.jsp?message=login-required");
        }

        String idMovieRaw = req.getParameter("movieId");
        String origin = req.getParameter("origin");
        String epRaw = req.getParameter("ep");
        String comment = req.getParameter("commentContent");

        if (idMovieRaw != null) {
            int movieId = Integer.parseInt(idMovieRaw);
            String content = req.getParameter("commentContent");

            if (content != null && !content.trim().isEmpty()) {
                new CommentDAO().addComment(user.getId(), movieId, comment);
            }

            if ("watch".equals(origin)) {
                String redirectUrl = "watch?id=" + movieId;
                if (epRaw != null && !epRaw.isEmpty()) {
                    redirectUrl += "&ep=" + epRaw;
                }
                redirectUrl += "#comments";
                resp.sendRedirect(redirectUrl);
            } else {

                resp.sendRedirect("detail?id=" + movieId + "#comments");
            }
        }
    }
    }

