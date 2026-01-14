package com.example.movie.dao;

import com.example.movie.context.DBContext;
import com.example.movie.model.Genres;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class GenresDAO {

    static Connection conn;
    static PreparedStatement ps;
    static ResultSet rs;

    public String getGenreNameById(int id) {
        String name = "";
        String query = "SELECT genresName FROM Genres WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                name = rs.getString("genresName");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return name;
    }

    public List<Genres> getAllGenres() {
        List<Genres> list = new ArrayList<>();
        String query = "SELECT * FROM Genres";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()) {
                list.add(new Genres(
                    rs.getInt("id"),
                    rs.getString("genresName"),
                    rs.getString("description")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
