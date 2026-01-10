package com.example.movie.dao;
import com.example.movie.context.DBContext;
import com.example.movie.model.Movie;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
public class FavoriteDAO {

    public boolean checkFavorite(int idUser, int idMovie) {
        String query = "SELECT * FROM Favorites WHERE idUser = ? AND idMovie = ?";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, idUser);
            ps.setInt(2, idMovie);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public void toggleFavorite(int idUser, int idMovie) {
        if(checkFavorite(idUser, idMovie)) {
            String query = "DELETE FROM Favorites WHERE idUser = ? AND idMovie = ?";
            try {
                Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setInt(1, idUser);
                ps.setInt(2, idMovie);
                ps.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            String query = "INSERT INTO Favorites(idUser, idMovie) VALUES (?, ?)";
            try {
                Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setInt(1, idUser);
                ps.setInt(2, idMovie);
                ps.executeUpdate();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
    }
    public List<Movie> getFavoriteMovieByUserId(int idUser) {
        List<Movie> list = new ArrayList<>();
        String query = "SELECT m.* FROM Movies m JOIN Favorites f ON m.id = f.idMovie WHERE f.idUser = ?";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, idUser);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Movie m = new Movie();
                m.setId(rs.getInt("id"));
                m.setTitle(rs.getString("movieName"));
                m.setPosterUrl(rs.getString("poster_url"));
                m.setPremium(rs.getBoolean("isPremium"));
                list.add(m);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
