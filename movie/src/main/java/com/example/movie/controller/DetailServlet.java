package com.example.movie.controller;

import com.example.movie.dao.*;
import com.example.movie.model.Comment;
import com.example.movie.model.Episode;
import com.example.movie.model.Movie;
import com.example.movie.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/detail")
public class DetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");

        try {
            String idS = req.getParameter("id");
            if (idS == null || idS.isEmpty()) {
                resp.sendRedirect("index.jsp");
                return;
            }

            int id = Integer.parseInt(idS);
            Movie movie = MovieDAO.getMovieByID(id);

            if (movie != null) {

                MovieDAO movieDAO = new MovieDAO();
                List<Movie> relatedList = movieDAO.getRelatedMovies(movie.getGenreId(), movie.getId());
                req.setAttribute("relatedMovies", relatedList);

                if(movie.isPremium()) {
                    HttpSession session = req.getSession();
                    User user = (User) session.getAttribute("account");
                    if (user == null) {
                        session.setAttribute("redirectAfterLogin", "detail?id=" + id);
                        resp.sendRedirect("login.jsp?message=login-required");
                    }
                    if (!user.isPremium()) {
                        resp.sendRedirect("user-profile?tab=membership&msg=vip_required");
                        return;
                    }
                }

                CommentDAO dao = new CommentDAO();
                List<Comment> list = dao.getCommentByMovieID(movie.getId());
                req.setAttribute("listComments", list);

                int myRating = 0; // Mặc định 0 sao
                HttpSession session = req.getSession();
                User user = (User) session.getAttribute("account");

                //---------------------------
                if (user != null) {
                    RatingDAO ratingDAO = new RatingDAO();
                    myRating = ratingDAO.getUserRating(user.getId(), id);
                }
                req.setAttribute("myRating", myRating);
                req.setAttribute("detail", movie);
                //----------------------------
                boolean isFavorite = false;
                if (user != null) {
                    FavoriteDAO favDao = new FavoriteDAO();
                    isFavorite = favDao.checkFavorite(user.getId(), id);
                }
                req.setAttribute("isFavorite", isFavorite);
                //----------------------------
                if (movie.isSeries()) {
                    EpisodeDAO epDAO = new EpisodeDAO();
                    List<Episode> listEp = epDAO.getListEpisodes(id);
                    req.setAttribute("listEp", listEp); // Gửi list sang JSP
                }

                req.getRequestDispatcher("movie_info.jsp").forward(req, resp);
                return;
            }

            resp.sendRedirect("index.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            if (!resp.isCommitted()) {
                resp.sendRedirect("index.jsp");
            }
        }
    }
}