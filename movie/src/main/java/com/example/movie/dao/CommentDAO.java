package com.example.movie.dao;
import com.example.movie.context.DBContext;
import com.example.movie.model.Comment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO {

    public void addComment(int idUser, int idMovie, String comment) {
        String query = "INSERT INTO Comments(idUser, idMovie, comment)" +
                       "VALUES(?, ?, ?)";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, idUser);
            ps.setInt(2, idMovie);
            ps.setString(3, comment);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Comment> getCommentByMovieID(int idMovie) {
        List<Comment> list = new ArrayList<>();
        String query =  "SELECT c.*, u.username, u.avatar_url " +
                        "FROM Comments c " +
                        "JOIN Users u ON c.idUser = u.id " +
                        "WHERE c.idMovie = ? " +
                        "ORDER BY c.create_at DESC";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, idMovie);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Comment m = new Comment(
                        rs.getInt("id"),
                        rs.getInt("idUser"),
                        rs.getInt("idMovie"),
                        rs.getString("comment"),
                        rs.getTimestamp("create_at"),
                        rs.getString("username"),
                        rs.getString("avatar_url")
                );
                list.add(m);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
