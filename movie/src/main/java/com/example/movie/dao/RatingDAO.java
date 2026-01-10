package com.example.movie.dao;
import com.example.movie.context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class RatingDAO {

    public void submitRating(int userId, int movieId, int newStar) {
        String checkSql = "SELECT rating FROM Ratings WHERE idUser = ? AND idMovie = ?";
        String updateRatingSql = "UPDATE Ratings SET rating = ? WHERE idUser = ? AND idMovie = ?";
        String insertRatingSql = "INSERT INTO Ratings (idUser, idMovie, rating) VALUES (?, ?, ?)";

        try {
            Connection conn = new DBContext().getConnection();

            // 1. Kiểm tra xem User đã đánh giá chưa
            PreparedStatement psCheck = conn.prepareStatement(checkSql);
            psCheck.setInt(1, userId);
            psCheck.setInt(2, movieId);
            ResultSet rs = psCheck.executeQuery();

            if (rs.next()) {
                int oldStar = rs.getInt("rating"); // Lấy điểm cũ

                if (oldStar != newStar) { // Chỉ xử lý nếu điểm mới khác điểm cũ
                    PreparedStatement psUpdate = conn.prepareStatement(updateRatingSql);
                    psUpdate.setInt(1, newStar);
                    psUpdate.setInt(2, userId);
                    psUpdate.setInt(3, movieId);
                    psUpdate.executeUpdate();

                    // Công thức: Tổng mới = (Trung bình cũ * Số lượng) - Điểm cũ + Điểm mới
                    // Trung bình mới = Tổng mới / Số lượng
                    String sqlFixAvg = "UPDATE Movies SET rate_avg = " +
                            "((rate_avg * rate_count) - ? + ?) / rate_count " +
                            "WHERE id = ?";

                    PreparedStatement psMovie = conn.prepareStatement(sqlFixAvg);
                    psMovie.setDouble(1, oldStar);
                    psMovie.setDouble(2, newStar);
                    psMovie.setInt(3, movieId);
                    psMovie.executeUpdate();
                }

            } else {

                PreparedStatement psInsert = conn.prepareStatement(insertRatingSql);
                psInsert.setInt(1, userId);
                psInsert.setInt(2, movieId);
                psInsert.setInt(3, newStar);
                psInsert.executeUpdate();

                // Công thức: ((Trung bình cũ * Số lượng cũ) + Điểm mới) / (Số lượng cũ + 1)
                String sqlInc = "UPDATE Movies SET " +
                        "rate_avg = ((rate_avg * rate_count) + ?) / (rate_count + 1), " +
                        "rate_count = rate_count + 1 " +
                        "WHERE id = ?";

                PreparedStatement psMovie = conn.prepareStatement(sqlInc);
                psMovie.setDouble(1, newStar);
                psMovie.setInt(2, movieId);
                psMovie.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private void updateMovieRating(int movieId) {
        String sqlCalc = "SELECT AVG(rating*1.0) as avg_rate, COUNT(*) as count_rate FROM Ratings WHERE idMovie = ?";
        String sqlUpdate = "UPDATE Movies SET rate_avg = ?, rate_count = ? WHERE id = ?";
        try {
            Connection conn = new DBContext().getConnection();

            // Tính toán
            PreparedStatement psCalc = conn.prepareStatement(sqlCalc);
            psCalc.setInt(1, movieId);
            ResultSet rs = psCalc.executeQuery();

            double avg = 0;
            int count = 0;
            if(rs.next()){
                avg = rs.getDouble("avg_rate");
                count = rs.getInt("count_rate");
            }
            // Update
            PreparedStatement psUp = conn.prepareStatement(sqlUpdate);
            psUp.setDouble(1, avg);
            psUp.setInt(2, count);
            psUp.setInt(3, movieId);
            psUp.executeUpdate();
        } catch (Exception e) {}
    }
    public int getUserRating(int userId, int movieId) {
        String sql = "SELECT rating FROM Ratings WHERE idUser = ? AND idMovie = ?";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, movieId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("rating");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
