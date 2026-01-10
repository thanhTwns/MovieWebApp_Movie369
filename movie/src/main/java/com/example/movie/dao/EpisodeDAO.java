package com.example.movie.dao;

import com.example.movie.context.DBContext;
import com.example.movie.model.Episode;
import com.example.movie.model.Movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EpisodeDAO {

    static Connection conn = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null;

    public List<Episode> getListEpisodes(int movieId) {
        List<Episode> list = new ArrayList<>();
        String sql = "SELECT * FROM Episodes WHERE idMovie = ? ORDER BY num_episode ASC";

        try (Connection conn = new DBContext().getConnection(); // Kết nối DB
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, movieId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Episode(
                        rs.getInt("id"),
                        rs.getInt("idMovie"),
                        rs.getInt("num_episode"),
                        rs.getString("title_episode"),
                        rs.getInt("duration"),
                        rs.getString("video_url")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public Episode getEpisodeByNumber(int movieId, int epNum) {
        String sql = "SELECT * FROM Episodes WHERE idMovie = ? AND num_episode = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, movieId);
            ps.setInt(2, epNum);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Episode(
                        rs.getInt("id"),
                        rs.getInt("idMovie"),
                        rs.getInt("num_episode"),
                        rs.getString("title_episode"),
                        rs.getInt("duration"),
                        rs.getString("video_url")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
