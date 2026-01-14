package com.example.movie.controller;

import com.example.movie.dao.MovieDAO;
import com.example.movie.model.Movie;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String searchTxt = req.getParameter("query");

        MovieDAO dao = new MovieDAO();
        List<Movie> list = dao.searchMovie(searchTxt);

        req.setAttribute("listMovies", list);
        req.setAttribute("searchKeyword", searchTxt);
        req.setAttribute("titlePage", "Kết quả tìm kiếm: " + searchTxt);

        req.getRequestDispatcher("movieList.jsp").forward(req, resp);

    }
}
