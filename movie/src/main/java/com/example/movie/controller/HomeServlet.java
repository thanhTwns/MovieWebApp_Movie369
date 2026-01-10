package com.example.movie.controller;

import com.example.movie.dao.CollectionsDAO;
import com.example.movie.dao.GenresDAO;
import com.example.movie.dao.MovieDAO;
import com.example.movie.model.Collections;
import com.example.movie.model.Genres;
import com.example.movie.model.Movie;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/home", ""})
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");

        MovieDAO dao = new MovieDAO();
        GenresDAO genresDAO = new GenresDAO();
        CollectionsDAO collectionsDAO = new CollectionsDAO();

        //MOVIE
        List<Movie> listPhimLe = dao.getMovieByType(false);
        List<Movie> listPhimBo = dao.getMovieByType(true);
        List<Movie> listPhimSapChieu = dao.getMovieByStatus("COMMING SOON");
        List<Movie> listTrending = dao.getTrendingMovie();

        //GENRES
        List<Genres> listGenres = genresDAO.getAllGenres();
        List<Collections> listCollections = collectionsDAO.getAllCollections();

        req.setAttribute("phimle", listPhimLe);
        req.setAttribute("phimbo", listPhimBo);
        req.setAttribute("phimsapchieu", listPhimSapChieu);
        req.setAttribute("phimtrending", listTrending);

        getServletContext().setAttribute("GLOBAL_GENRES", listGenres);

        Movie topAction = dao.getTopMovieByGenre(1);
        req.setAttribute("spotlightAction", topAction);

        Movie topDrama = dao.getTopMovieByGenre(8);
        req.setAttribute("spotlightDrama", topDrama);

        req.setAttribute("collections", listCollections);

        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}
