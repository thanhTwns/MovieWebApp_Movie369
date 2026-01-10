package com.example.movie.controller;

import com.example.movie.dao.MovieDAO;
import com.example.movie.model.Movie;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "MovieFormServlet", urlPatterns = {"/movie-form"})
public class MovieFormServlet extends HttpServlet {

    // 1. Mở Form
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idRaw = request.getParameter("id");
        if (idRaw != null) {
            MovieDAO dao = new MovieDAO();
            Movie m = dao.getMovieByID(Integer.parseInt(idRaw));
            request.setAttribute("movie", m);
        }
        // Chuyển sang trang JSP (Form trắng hoặc Form có dữ liệu)
        request.getRequestDispatcher("movie-form.jsp").forward(request, response);
    }

    // 2. Xử lý Lưu dữ liệu
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        // Lấy dữ liệu từ Form
        String idRaw = request.getParameter("id");
        String title = request.getParameter("title");
        String desc = request.getParameter("description");
        int year = Integer.parseInt(request.getParameter("year"));
        int duration = Integer.parseInt(request.getParameter("duration"));
        String posterUrl = request.getParameter("posterUrl");
        String videoUrl = request.getParameter("videoUrl");
        String trailerUrl = request.getParameter("trailerUrl");
        boolean isSeries = Boolean.parseBoolean(request.getParameter("isSeries"));
        boolean isPremium = Boolean.parseBoolean(request.getParameter("isPremium"));
        String status = request.getParameter("status");

        Movie m = new Movie();
        m.setTitle(title);
        m.setDescription(desc);
        m.setReleaseYear(year);
        m.setDurationMinutes(duration);
        m.setPosterUrl(posterUrl);
        m.setMovieUrl(videoUrl);
        m.setTrailerUrl(trailerUrl);
        m.setSeries(isSeries);
        m.setPremium(isPremium);
        m.setStatus(status);

        MovieDAO dao = new MovieDAO();

        if (idRaw == null || idRaw.isEmpty()) {
            // THÊM MỚI
            dao.insertMovie(m);
        } else {
            // CẬP NHẬT
            m.setId(Integer.parseInt(idRaw));
            dao.updateMovie(m);
        }

        // Lưu xong quay về Admin
        response.sendRedirect("admin");
    }
}
