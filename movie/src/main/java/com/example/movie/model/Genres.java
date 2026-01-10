package com.example.movie.model;

public class Genres {

    private int id;
    private String genresName;
    private String description;

    public Genres(int id, String genresName, String description) {
        this.id = id;
        this.genresName = genresName;
        this.description = description;
    }

    public Genres() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGenresName() {
        return genresName;
    }

    public void setGenresName(String genresName) {
        this.genresName = genresName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
