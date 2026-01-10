package com.example.movie.controller;

import com.example.movie.dao.MovieDAO;
import com.example.movie.model.Movie;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/ajax-search")
public class AjaxSearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");

        String searchTxt = req.getParameter("query");

        if (searchTxt == null || searchTxt.trim().isEmpty()) {
            return;
        }
        MovieDAO dao = new MovieDAO();
        List<Movie> list = dao.searchMovie(searchTxt);

        PrintWriter out = resp.getWriter();

        int count = 0;
        for (Movie m : list) {
            if (count >= 6) break;

            String imgUrl = m.getPosterUrl();

                if (!imgUrl.startsWith("http")) {
                if (imgUrl.startsWith("/")) {
                    imgUrl = req.getContextPath() + imgUrl;
                } else {
                    imgUrl = req.getContextPath() + "/" + imgUrl;
                }
            }

            out.println("<a href='detail?id=" + m.getId() + "' class='search-result-item'>");


            out.println("  <div class='result-img'>");
            out.println("    <img src='" + imgUrl + "' alt='" + m.getTitle() + "'>");
            out.println("  </div>");


            out.println("  <div class='result-info'>");
            out.println("    <div class='result-title'>" + m.getTitle() + "</div>");

            out.println("    <div class='result-meta'>");
            out.print("       <span>" + m.getReleaseYear() + "</span> • ");

            if(m.isSeries()) {

                out.print("<span>Tập " + m.getLastestEp() + "</span>");
            } else {
                out.print("<span>" + m.getDurationMinutes() + " phút</span>");
            }

            out.println("    </div>");
            out.println("  </div>");

            out.println("</a>");

            count++;
        }
    }
}