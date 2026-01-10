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

@WebServlet(name = "ListMovieServlet", urlPatterns = {"/listMovie"})
public class ListMovieServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String type = req.getParameter("type");

        // 2. Lấy tham số sắp xếp (nếu không có thì mặc định là 'newest')
        String sort = req.getParameter("sort");
        if (sort == null) {
            sort = "newest";
        }

        MovieDAO dao = new MovieDAO();
        List<Movie> list = null;
        String titlePage = "";
        boolean isSeries = false;

        // Xác định loại phim
        if ("series".equals(type)) {
            isSeries = true;
            titlePage = "Phim Bộ Đặc Sắc";
        } else {
            isSeries = false;
            titlePage = "Phim Lẻ Tuyển Chọn";
            if(type == null) type = "single";
        }

        // 3. Gọi hàm DAO mới đã viết ở Bước 1
        list = dao.getMoviesByTypeAndSort(isSeries, sort);

        // 4. Đẩy dữ liệu sang JSP
        req.setAttribute("activeType", type); // Để giữ lại trạng thái tab
        req.setAttribute("activeSort", sort); // Để giữ lại trạng thái dropdown
        req.setAttribute("listMovies", list);
        req.setAttribute("titlePage", titlePage);

        req.getRequestDispatcher("movieList.jsp").forward(req, resp);
    }
}



