package com.example.movie.controller;
import com.example.movie.dao.UserDAO;
import com.example.movie.model.PaymentHistory;
import com.example.movie.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/user-profile")
public class UserProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("account");

        if (user != null) {
            try {
                UserDAO dao = new UserDAO();
                List<PaymentHistory> list = dao.getPaymentHistory(user.getId());
                req.setAttribute("historyList", list);

                User currentUser = dao.getUserById(user.getId());
                session.setAttribute("account", currentUser);

                req.getRequestDispatcher("personal_profile.jsp").forward(req, resp);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            resp.sendRedirect("login.jsp");
        }
    }
}