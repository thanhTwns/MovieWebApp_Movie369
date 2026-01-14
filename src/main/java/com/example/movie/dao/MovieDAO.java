package com.example.movie.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.movie.context.DBContext;
import com.example.movie.model.Movie;

public class MovieDAO {

    static Connection conn = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null;

    public int countTotalMovies() {
        String sql = "SELECT COUNT(*) FROM Movies";
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

    public int sumTotalViews() {
        String sql = "SELECT SUM(view_count) FROM Movies";
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

    public void updateMovie(Movie m) {
        String sql = "UPDATE Movies SET movieName=?, description=?, yearRelease=?, duration=?, poster_url=?, trailer_url=?, video_url=?, isPremium=?, isSeries=?, status=? WHERE id=?";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, m.getTitle());
            ps.setString(2, m.getDescription());
            ps.setInt(3, m.getReleaseYear());
            ps.setInt(4, m.getDurationMinutes());
            ps.setString(5, m.getPosterUrl());
            ps.setString(6, m.getTrailerUrl());
            ps.setString(7, m.getMovieUrl());
            ps.setBoolean(8, m.isPremium());
            ps.setBoolean(9, m.isSeries());
            ps.setString(10, m.getStatus());
            ps.setInt(11, m.getId());
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void insertMovie(Movie m) {
        String sql = "INSERT INTO Movies (movieName, description, yearRelease, duration, poster_url, trailer_url, video_url, isPremium, isSeries, status, view_count, rate_avg, rate_count) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, 0, 0, 0)";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, m.getTitle());
            ps.setString(2, m.getDescription());
            ps.setInt(3, m.getReleaseYear());
            ps.setInt(4, m.getDurationMinutes());
            ps.setString(5, m.getPosterUrl());
            ps.setString(6,m.getBannerUrl());
            ps.setString(7, m.getTrailerUrl());
            ps.setString(8, m.getMovieUrl()); // Lưu ý: Trong Model là movieUrl, DB là video_url
            ps.setBoolean(9, m.isPremium());
            ps.setBoolean(10, m.isSeries());
            ps.setString(11, m.getStatus());
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public List<Movie> getAllMovies() {
        List<Movie> list = new ArrayList<>();
        String sql = "SELECT * FROM Movies ORDER BY id DESC";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Movie m = new Movie(
                        rs.getInt("id"),
                        rs.getString("movieName"),
                        rs.getString("description"),
                        rs.getInt("yearRelease"),
                        rs.getInt("duration"),
                        rs.getString("poster_url"),
                        rs.getString("trailer_url"),
                        rs.getString("video_url"),
                        rs.getInt("view_count"),
                        rs.getDouble("rate_avg"),
                        rs.getInt("rate_count"),
                        rs.getBoolean("isPremium"),
                        rs.getBoolean("isSeries"),
                        rs.getString("status")
                );
                list.add(m);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void deleteMovie(int id) {
        String sql = "DELETE FROM Movies WHERE id = ?";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Movie> getMoviesByGenreAndSort(int genreId, String sortType) {
        List<Movie> list = new ArrayList<>();

        // Câu lệnh SQL: JOIN bảng Genre và sắp xếp
        String sql = "SELECT m.*, " +
                "(SELECT MAX(num_episode) FROM Episodes e WHERE e.idMovie = m.id) AS latest_ep " +
                "FROM Movies m " +
                "JOIN Movies_genres mg ON m.id = mg.idMovie " +
                "WHERE mg.idGenre = ? ";

        // Xử lý sắp xếp
        if (sortType != null) {
            switch (sortType) {
                case "views":
                    sql += "ORDER BY m.view_count DESC";
                    break;
                case "rating":
                    sql += "ORDER BY m.rate_avg DESC";
                    break;
                case "newest":
                default:
                    sql += "ORDER BY m.id DESC";
                    break;
            }
        } else {
            sql += "ORDER BY m.id DESC";
        }

        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, genreId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                // Copy đoạn mapping dữ liệu y hệt các hàm trước
                Movie m = new Movie(
                        rs.getInt("id"),
                        rs.getString("movieName"),
                        rs.getString("description"),
                        rs.getInt("yearRelease"),
                        rs.getInt("duration"),
                        rs.getString("poster_url"),
                        rs.getString("trailer_url"),
                        rs.getString("video_url"),
                        rs.getInt("view_count"),
                        rs.getDouble("rate_avg"),
                        rs.getInt("rate_count"),
                        rs.getBoolean("isPremium"),
                        rs.getBoolean("isSeries"),
                        rs.getString("status")
                );
                try { m.setBannerUrl(rs.getString("banner_url")); } catch (Exception e) {}
                m.setLastestEp(rs.getInt("latest_ep"));

                list.add(m);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Movie> getMoviesByTypeAndSort(boolean isSeries, String sortType) {
        List<Movie> list = new ArrayList<>();
        String sql = "SELECT m.*, " +
                "(SELECT MAX(num_episode) FROM Episodes e WHERE e.idMovie = m.id) AS latest_ep " +
                "FROM Movies m " +
                "WHERE m.isSeries = ? ";

        switch (sortType) {
            case "views":
                sql += "ORDER BY view_count DESC";
                break;
            case "rating":
                sql += "ORDER BY rate_avg DESC";
                break;
            case "newest":
            default:
                sql += "ORDER BY yearRelease DESC, id DESC";
                break;
        }

        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setBoolean(1, isSeries);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Movie m = new Movie(
                        rs.getInt("id"),
                        rs.getString("movieName"),
                        rs.getString("description"),
                        rs.getInt("yearRelease"),
                        rs.getInt("duration"),
                        rs.getString("poster_url"),
                        rs.getString("trailer_url"),
                        rs.getString("video_url"),
                        rs.getInt("view_count"),
                        rs.getDouble("rate_avg"),
                        rs.getInt("rate_count"),
                        rs.getBoolean("isPremium"),
                        rs.getBoolean("isSeries"),
                        rs.getString("status")
                );
                m.setBannerUrl(rs.getString("banner_url"));
                m.setLastestEp(rs.getInt("latest_ep"));
                list.add(m);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Movie> getRelatedMovies(int genreId, int excludeId) {
        List<Movie> list = new ArrayList<>();
        String sql = "SELECT TOP 5 m.* " +
                "FROM Movies m " +
                "JOIN Movies_genres mg ON m.id = mg.idMovie " +
                "WHERE mg.idGenre = ? AND m.id != ? " +
                "ORDER BY NEWID()";

        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, genreId);
            ps.setInt(2, excludeId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Movie m = new Movie();
                m.setId(rs.getInt("id"));
                m.setTitle(rs.getString("movieName"));
                m.setPosterUrl(rs.getString("poster_url"));
                m.setReleaseYear(rs.getInt("yearRelease"));
                m.setPremium(rs.getBoolean("isPremium"));
                m.setRating(rs.getDouble("rate_avg"));
                list.add(m);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Movie> searchMovie(String keyword) {
        List<Movie> list = new ArrayList<>();
        String query = "SELECT m.*, " +
                "(SELECT MAX(num_episode) FROM Episodes e WHERE e.idMovie = m.id) AS latest_ep " +
                "FROM Movies m " +
                "WHERE m.movieName COLLATE SQL_Latin1_General_CP1_CI_AI LIKE ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            String search = "%" + keyword + "%";
            ps.setNString(1, search);
            rs = ps.executeQuery();
            while (rs.next()) {
                Movie m = new Movie(
                        rs.getInt("id"),
                        rs.getString("movieName"),
                        rs.getString("description"),
                        rs.getInt("yearRelease"),
                        rs.getInt("duration"),
                        rs.getString("poster_url"),
                        rs.getString("trailer_url"),
                        rs.getString("video_url"),
                        rs.getInt("view_count"),
                        rs.getDouble("rate_avg"),
                        rs.getInt("rate_count"),
                        rs.getBoolean("isPremium"),
                        rs.getBoolean("isSeries"),
                        rs.getString("status")
                );
                m.setLastestEp(rs.getInt("latest_ep"));
                list.add(m);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Movie getTopMovieByGenre(int genreId) {
        String query = "SELECT TOP 1 m.* FROM Movies m " +
                "JOIN Movies_genres mg ON m.id = mg.idMovie " +
                "WHERE mg.idGenre = ? " +
                "ORDER BY m.rate_avg DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, genreId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Movie(
                        rs.getInt("id"),
                        rs.getString("movieName"),
                        rs.getString("description"),
                        rs.getInt("yearRelease"),
                        rs.getInt("duration"),
                        rs.getString("poster_url"),
                        rs.getString("trailer_url"),
                        rs.getString("video_url"),
                        rs.getInt("view_count"),
                        rs.getDouble("rate_avg"),
                        rs.getInt("rate_count"),
                        rs.getBoolean("isPremium"),
                        rs.getBoolean("isSeries"),
                        rs.getString("status")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static List<Movie> getTrendingMovie() {
        List<Movie> list = new ArrayList<>();
        String query = "SELECT TOP 5 m.*, " +
                "(SELECT MAX(num_episode) FROM Episodes e WHERE e.idMovie = m.id) AS new_ep " +
                "FROM Movies m ORDER BY view_count DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()) {
                Movie m = new Movie(
                        rs.getInt("id"),
                        rs.getString("movieName"),
                        rs.getString("description"),
                        rs.getInt("yearRelease"),
                        rs.getInt("duration"),
                        rs.getString("poster_url"),
                        rs.getString("trailer_url"),
                        rs.getString("video_url"),
                        rs.getInt("view_count"),
                        rs.getDouble("rate_avg"),
                        rs.getInt("rate_count"),
                        rs.getBoolean("isPremium"),
                        rs.getBoolean("isSeries"),
                        rs.getString("status")
                );
                m.setBannerUrl(rs.getString("banner_url"));
                m.setLastestEp(rs.getInt("new_ep"));
                list.add(m);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<Movie> getMovieByStatus(String status) {
        List<Movie> list = new ArrayList<>();
        String query = "SELECT TOP 8 * FROM Movies WHERE status = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, status);
            rs = ps.executeQuery();
            while(rs.next()) {
                Movie m = new Movie(
                        rs.getInt("id"),
                        rs.getString("movieName"),
                        rs.getString("description"),
                        rs.getInt("yearRelease"),
                        rs.getInt("duration"),
                        rs.getString("poster_url"),
                        rs.getString("trailer_url"),
                        rs.getString("video_url"),
                        rs.getInt("view_count"),
                        rs.getDouble("rate_avg"),
                        rs.getInt("rate_count"),
                        rs.getBoolean("isPremium"),
                        rs.getBoolean("isSeries"),
                        rs.getString("status")
                );
                list.add(m);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<Movie> getMovieByType(boolean seriesCheck) {
        List<Movie> list = new ArrayList<>();
        String query = "SELECT TOP 10 m.*, " +
                "(SELECT MAX(num_episode) FROM Episodes e WHERE e.idMovie = m.id) AS new_ep " +
                "FROM Movies m " +
                "WHERE m.isSeries = ? " +
                "ORDER BY m.yearRelease DESC";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setBoolean(1, seriesCheck);
            rs = ps.executeQuery();
            while(rs.next()) {
                Movie m = new Movie(
                        rs.getInt("id"),
                        rs.getString("movieName"),
                        rs.getString("description"),
                        rs.getInt("yearRelease"),
                        rs.getInt("duration"),
                        rs.getString("poster_url"),
                        rs.getString("trailer_url"),
                        rs.getString("video_url"),
                        rs.getInt("view_count"),
                        rs.getDouble("rate_avg"),
                        rs.getInt("rate_count"),
                        rs.getBoolean("isPremium"),
                        rs.getBoolean("isSeries"),
                        rs.getString("status")
                );
                m.setLastestEp(rs.getInt("new_ep"));
                list.add(m);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Movie getMovieByID(int id) {
        String query = "SELECT TOP 1 m.*, mg.idGenre " +
                "FROM Movies m " +
                "LEFT JOIN Movies_genres mg ON m.id = mg.idMovie " +
                "WHERE m.id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if(rs.next()) {
                Movie m = new Movie(
                        rs.getInt("id"),
                        rs.getString("movieName"),
                        rs.getString("description"),
                        rs.getInt("yearRelease"),
                        rs.getInt("duration"),
                        rs.getString("poster_url"),
                        rs.getString("trailer_url"),
                        rs.getString("video_url"),
                        rs.getInt("view_count"),
                        rs.getDouble("rate_avg"),
                        rs.getInt("rate_count"),
                        rs.getBoolean("isPremium"),
                        rs.getBoolean("isSeries"),
                        rs.getString("status")
                );
                m.setRating(rs.getDouble("rate_avg"));
                m.setRateCount(rs.getInt("rate_count"));
                m.setPremium(rs.getBoolean("isPremium"));
                m.setGenreId(rs.getInt("idGenre"));
                return m;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Movie> getMovieByGenre(int genreId) {
        List<Movie> list = new ArrayList<>();

        String query = "SELECT m.*, " +
                "(SELECT COUNT(*) FROM Episodes e WHERE e.idMovie = m.id) AS ep_count " +
                "FROM Movies m " +
                "JOIN Movies_genres mg ON m.id = mg.idMovie " +
                "WHERE mg.idGenre = ? " +
                "ORDER BY m.rate_avg DESC";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, genreId);
            rs = ps.executeQuery();

            while(rs.next()) {
                Movie m = new Movie(
                        rs.getInt("id"),
                        rs.getString("movieName"),
                        rs.getString("description"),
                        rs.getInt("yearRelease"),
                        rs.getInt("duration"),
                        rs.getString("poster_url"),
                        rs.getString("trailer_url"),
                        rs.getString("video_url"),
                        rs.getInt("view_count"),
                        rs.getDouble("rate_avg"),
                        rs.getInt("rate_count"),
                        rs.getBoolean("isPremium"),
                        rs.getBoolean("isSeries"),
                        rs.getString("status")
                );

                m.setBannerUrl(rs.getString("banner_url"));

                m.setLastestEp(rs.getInt("ep_count"));

                list.add(m);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //TEST KET NOI VOI DATABASE
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        MovieDAO dao = new MovieDAO();
        List<Movie> list = getMovieByType(false);
        System.out.println("----- DS PHIM --------");
        for(Movie m : list) {
            System.out.println(m.getId() +  ". " + m.getTitle() + "\n" + m.getDurationMinutes() + " PHÚT" + "\n" + m.getDescription());
        }
    }

}