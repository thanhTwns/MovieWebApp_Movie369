package com.example.movie.controller;
import com.example.movie.dao.MovieDAO;
import com.example.movie.dao.UserDAO;
import com.example.movie.model.Movie;
import com.example.movie.model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminServlet", urlPatterns = {"/admin"})
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //CHECK LOGIN
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("account");
        if(user == null || !"admin".equalsIgnoreCase(user.getRole())) {
            resp.sendRedirect("home");
            return;
        }

        //getMovieList
        MovieDAO movieDAO = new MovieDAO();
        UserDAO userDAO = new UserDAO();

        int movies = movieDAO.countTotalMovies();
        int users = userDAO.countTotalUsers();
        int views = movieDAO.sumTotalViews();
        double revenue = 500000;

        req.setAttribute("totalMovies", movies);
        req.setAttribute("totalUsers", users);
        req.setAttribute("totalViews", views);
        req.setAttribute("totalRevenue", revenue);

        List<Movie> list = movieDAO.getAllMovies();
        req.setAttribute("listMovies", list);

        req.getRequestDispatcher("admin.jsp").forward(req, resp);
    }
}
