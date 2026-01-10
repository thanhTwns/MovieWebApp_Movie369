package com.example.movie.controller;
import com.example.movie.dao.MovieDAO;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "DeleteMovieServlet", urlPatterns = {"/deleteMovie"})
public class DeleteMovieServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idRaw = req.getParameter("id");
        if(idRaw != null) {
            int id = Integer.parseInt(idRaw);
            MovieDAO dao = new MovieDAO();
            dao.deleteMovie(id);
        }
        resp.sendRedirect("admin");
    }
}
