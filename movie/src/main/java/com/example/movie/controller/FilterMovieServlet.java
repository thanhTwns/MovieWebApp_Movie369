package com.example.movie.controller;

import com.example.movie.dao.GenresDAO;
import com.example.movie.dao.MovieDAO;
import com.example.movie.model.Movie;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FilterServlet", urlPatterns = {"/filter"})
public class FilterMovieServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idRaw = request.getParameter("genreId");
        int genreId = Integer.parseInt(idRaw);

        String sort = request.getParameter("sort");
        if(sort == null) sort = "newest";

        // Gọi DAO
        MovieDAO movieDAO = new MovieDAO();
        GenresDAO genresDAO = new GenresDAO();

        List<Movie> sortList = movieDAO.getMoviesByGenreAndSort(genreId, sort);
//      List<Movie> list = movieDAO.getMovieByGenre(genreId);
        String genreName = genresDAO.getGenreNameById(genreId);

        // Đẩy dữ liệu sang JSP
        request.setAttribute("listMovies", sortList);
        // Tạo tiêu đề động
        request.setAttribute("titlePage", "Thể loại: " + genreName);

        // Đánh dấu activeType để header biết
        request.setAttribute("activeType", "genre");
        request.setAttribute("activeSort", sort);
        request.setAttribute("genreId", genreId);

        request.getRequestDispatcher("movieList.jsp").forward(request, response);
    }
}
