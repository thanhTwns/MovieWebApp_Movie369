package com.example.movie.model;
import java.sql.Timestamp;
public class Comment {

    private int id;
    private int idUser;
    private int idMovie;
    private String content;
    private Timestamp createdAt;
    private String username;
    private String avatarUrl;

    public Comment() {}
    public Comment(int id, int idUser, int idMovie, String content, Timestamp createdAt, String username, String avatarUrl) {
        this.id = id;
        this.idUser = idUser;
        this.idMovie = idMovie;
        this.content = content;
        this.createdAt = createdAt;
        this.username = username;
        this.avatarUrl = avatarUrl;
    }
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getIdUser() { return idUser; }
    public void setIdUser(int idUser) { this.idUser = idUser; }
    public int getIdMovie() { return idMovie; }
    public void setIdMovie(int idMovie) { this.idMovie = idMovie; }
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getAvatarUrl() { return avatarUrl; }
    public void setAvatarUrl(String avatarUrl) { this.avatarUrl = avatarUrl; }
}
