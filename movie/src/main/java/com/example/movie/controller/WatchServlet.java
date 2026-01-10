package com.example.movie.controller;

import javax.servlet.ServletException;

import com.example.movie.dao.CommentDAO;
import com.example.movie.dao.EpisodeDAO;
import com.example.movie.dao.MovieDAO;
import com.example.movie.model.Comment;
import com.example.movie.model.Episode;
import com.example.movie.model.Movie;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/watch")
public class WatchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");

        try {
            String idS = req.getParameter("id");
            String epS = req.getParameter("ep"); // Lấy tham số tập phim (nếu có)

            if(idS == null) { resp.sendRedirect("index.jsp"); return; }
            int id = Integer.parseInt(idS);

            Movie movie = MovieDAO.getMovieByID(id);
            if (movie == null) { resp.sendRedirect("index.jsp"); return; }
            req.setAttribute("movie", movie);

            MovieDAO movieDAO = new MovieDAO();
            List<Movie> relatedMovies = movieDAO.getRelatedMovies(movie.getGenreId(), movie.getId());
            req.setAttribute("relatedMovies", relatedMovies);

            CommentDAO commentDAO = new CommentDAO();
            List<Comment> list = commentDAO.getCommentByMovieID(movie.getId());
            req.setAttribute("listComments", list);

            String videoUrl = "";

            if (movie.isSeries()) {
                EpisodeDAO epDAO = new EpisodeDAO();
                List<Episode> listEp = epDAO.getListEpisodes(id);
                req.setAttribute("listEp", listEp);

                int currentEpNum = (epS == null) ? 1 : Integer.parseInt(epS);
                Episode currentEp = epDAO.getEpisodeByNumber(id, currentEpNum);

                if (currentEp != null) {
                    videoUrl = currentEp.getVideoUrl();
                    req.setAttribute("currentEpNum", currentEpNum);
                    req.setAttribute("epTitle", currentEp.getTitleEpisode());
                }
            } else {
                // Phim lẻ
                videoUrl = movie.getMovieUrl();
            }

            req.setAttribute("videoUrl", videoUrl);
            req.getRequestDispatcher("watch.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("home");
        }
    }
}