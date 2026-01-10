package com.example.movie.listener;

import com.example.movie.dao.GenresDAO;
import com.example.movie.model.Genres;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.List;

@WebListener
    public class AppListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Hàm này TỰ ĐỘNG CHẠY khi web vừa khởi động
        try {
            GenresDAO dao = new GenresDAO();
            List<Genres> list = dao.getAllGenres();

            // Cất vào kho chung (Application Scope) với tên "GLOBAL_GENRES"
            ServletContext app = sce.getServletContext();
            app.setAttribute("GLOBAL_GENRES", list);

            System.out.println(">>> DA LOAD XONG DANH SACH THE LOAI (GLOBAL_GENRES) <<<");
        } catch (Exception e) {
            System.err.println(">>> LOI KHI LOAD THE LOAI: " + e.getMessage());
            e.printStackTrace();
        }
    }

        @Override
        public void contextDestroyed(ServletContextEvent sce) {

        }
    }

