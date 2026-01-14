package com.example.movie.controller;
import com.example.movie.dao.FavoriteDAO;
import com.example.movie.model.Movie;
import com.example.movie.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/my-favorites")
public class MyFavoriteServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("account");
        if(user == null) {
            resp.sendRedirect("login.jsp");
        }
        FavoriteDAO dao = new FavoriteDAO();
        List<Movie> list = dao.getFavoriteMovieByUserId(user.getId());

        req.setAttribute("listMovies", list);
        req.setAttribute("pageTitle", "Phim Yêu Thích");

        req.getRequestDispatcher("favorites.jsp").forward(req, resp);
    }
}
