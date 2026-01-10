package com.example.movie.model;

public class Episode {
    private int id;
    private int idMovie;
    private int numEpisode;
    private String titleEpisode;
    private int duration;
    private String videoUrl;

    public Episode() {
    }

    public Episode(int id, int idMovie, int numEpisode, String titleEpisode, int duration, String videoUrl) {
        this.id = id;
        this.idMovie = idMovie;
        this.numEpisode = numEpisode;
        this.titleEpisode = titleEpisode;
        this.duration = duration;
        this.videoUrl = videoUrl;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getIdMovie() { return idMovie; }
    public void setIdMovie(int idMovie) { this.idMovie = idMovie; }

    public int getNumEpisode() { return numEpisode; }
    public void setNumEpisode(int numEpisode) { this.numEpisode = numEpisode; }

    public String getTitleEpisode() { return titleEpisode; }
    public void setTitleEpisode(String titleEpisode) { this.titleEpisode = titleEpisode; }

    public int getDuration() { return duration; }
    public void setDuration(int duration) { this.duration = duration; }

    public String getVideoUrl() { return videoUrl; }
    public void setVideoUrl(String movieUrl) { this.videoUrl = videoUrl; }
}
