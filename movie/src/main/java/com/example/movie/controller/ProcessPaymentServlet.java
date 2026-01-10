package com.example.movie.controller;

import com.example.movie.dao.UserDAO;
import com.example.movie.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

@WebServlet("/ProcessPaymentServlet")
public class ProcessPaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("account");

        if(user == null) {
            resp.sendRedirect("login.jsp");
        }
        String idPlan_string = req.getParameter("planId");
        int idPlan = Integer.parseInt(idPlan_string);

        UserDAO dao = new UserDAO();
        boolean succes = dao.upgradePremium(user.getId(), idPlan);

        if(succes) {
            user.setPremium(true);
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(new Date());
            switch (idPlan) {
                case 1:
                    calendar.add(Calendar.MONTH, 1);
                    break;
                case 2:
                    calendar.add(Calendar.MONTH, 6);
                    break;
                case 3:
                    calendar.add(Calendar.MONTH, 12);
                    break;
            }
            user.setEndPremium_date(new java.sql.Date(calendar.getTimeInMillis()));
            session.setAttribute("account", user);
            resp.sendRedirect("personal_profile.jsp?msg=success");
        } else {
            resp.sendRedirect("payment.jsp?error=1");
        }
    }
}
