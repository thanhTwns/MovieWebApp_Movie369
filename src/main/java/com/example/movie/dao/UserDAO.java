package com.example.movie.dao;

import com.example.movie.context.DBContext;
import com.example.movie.model.PaymentHistory;
import com.example.movie.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO extends DBContext {

    public int countTotalUsers() {
        String sql = "SELECT COUNT(*) FROM Users";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    public User getUserById(int id) {
        String sql = "SELECT * FROM Users WHERE id = ?";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getString("password_hash"),
                        rs.getString("avatar_url"),
                        rs.getString("roles"),
                        rs.getBoolean("isPremium"),
                        rs.getDate("startPremium_date"),
                        rs.getDate("endPremium_date")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateProfile(User user) {
        String sql = "UPDATE Users SET email = ? WHERE id = ?";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, user.getEmail());
            ps.setInt(2, user.getId());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<PaymentHistory> getPaymentHistory(int userId) throws SQLException {
        List<PaymentHistory> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // Câu lệnh JOIN để lấy tên gói
        String sql = "SELECT p.premiumOption_title, h.price, h.created_date, h.status " +
                "FROM Subscribe_history h " +
                "JOIN Subscribe_plan p ON h.idPlan = p.id " +
                "WHERE h.idUser = ? " +
                "ORDER BY h.created_date DESC"; // Sắp xếp ngày mới nhất lên đầu

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            while (rs.next()) {
                PaymentHistory h = new PaymentHistory();
                h.setPlanName(rs.getString("premiumOption_title"));
                h.setPrice(rs.getDouble("price"));
                h.setCreatedDate(rs.getTimestamp("created_date"));
                h.setStatus(rs.getString("status"));
                list.add(h);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            conn.close();
            ps.close();
            rs.close();
        }
        return list;
    }

    public boolean upgradePremium(int id, int idPlan) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean result = false;

        String queryPlan = "SELECT premiumOption_title, premiumOption_month, price FROM Subscribe_plan WHERE id = ?";

        String updatePremium_query = "UPDATE Users " +
                "SET isPremium = 1, " +
                "    startPremium_date = GETDATE(), " +
                "    endPremium_date = DATEADD(MONTH, ?, GETDATE()) " +
                "WHERE id = ?";

        String subPlanHistory_query = "INSERT INTO Subscribe_history " +
                "(idUser, idPlan, start_date, end_date, price, status) " +
                "VALUES (?, ?, GETDATE(), DATEADD(MONTH, ?, GETDATE()), ?, 'Paid')";

        try {
            conn = new DBContext().getConnection();

            conn.setAutoCommit(false);

            ps = conn.prepareStatement(queryPlan);
            ps.setInt(1, idPlan);
            rs = ps.executeQuery();

            int month = 0;
            double price = 0;

            if (rs.next()) {
                month = rs.getInt("premiumOption_month");
                price = rs.getDouble("price");
            } else {
                return false;
            }

            rs.close();
            ps.close();

            ps = conn.prepareStatement(updatePremium_query);
            ps.setInt(1, month);
            ps.setInt(2, id);
            int rowUser = ps.executeUpdate();
            ps.close();

            if (rowUser > 0) {
                ps = conn.prepareStatement(subPlanHistory_query);
                ps.setInt(1, id);
                ps.setInt(2, idPlan);
                ps.setInt(3, month);
                ps.setDouble(4, price);
                ps.executeUpdate();

                conn.commit();
                result = true;
            } else {
                conn.rollback();
            }

        } catch (Exception e) {
            e.printStackTrace();
            try {
                if (conn != null) conn.rollback();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public User checkLogin(String email, String password) {
        String sql = "SELECT * FROM Users WHERE email = ? AND password_hash = ?";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getString("password_hash"),
                        rs.getString("avatar_url"),
                        rs.getString("roles"),
                        rs.getBoolean("isPremium"),
                        rs.getDate("startPremium_date"),
                        rs.getDate("endPremium_date")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public boolean checkEmailExist(String email) {
        String sql = "SELECT * FROM Users WHERE email = ?";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            return rs.next(); // Nếu có kết quả -> Email đã tồn tại
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public void register(String username, String email, String password) {
        String sql = "INSERT INTO Users (username, email, password_hash, avatar_url, roles, isPremium) VALUES (?, ?, ?, ?, ?, 0)";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, "assets/img/default-avatar.jpg");
            ps.setString(5, "User");

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    // Hàm đổi mật khẩu mới
    public boolean changePassword(String email, String newPass) {
       
    	// Sửa 'password' thành 'password_hash'
    	String sql = "UPDATE Users SET password_hash = ? WHERE email = ?";

        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            // Truyền mật khẩu đã mã hóa và email vào
            ps.setString(1, newPass);
            ps.setString(2, email);

            int rows = ps.executeUpdate(); // Thực thi lệnh

            // Kiểm tra kết quả
            if (rows > 0) {
                System.out.println("DEBUG DAO: Đã đổi mật khẩu thành công cho email: " + email);
                return true; // Báo cho Servlet biết là OK
            } else {
                System.out.println("DEBUG DAO: Không tìm thấy email [" + email + "] để đổi pass.");
                return false; // Báo thất bại
            }

        } catch (Exception e) {
            System.out.println("DEBUG DAO LỖI SQL: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    
}
