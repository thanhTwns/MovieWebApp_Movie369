package com.example.movie.dao;

import com.example.movie.context.DBContext;
import com.example.movie.model.Collections;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CollectionsDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // Hàm lấy tất cả bộ sưu tập
    public List<Collections> getAllCollections() {
        List<Collections> list = new ArrayList<>();
        String query = "SELECT * FROM Collections";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Collections(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getString("banner_url")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}

