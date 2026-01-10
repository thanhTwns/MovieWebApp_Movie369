package com.example.movie.model;

import java.io.Serializable;

public class Movie implements Serializable {
    private int id;
    private String title;           // title
    private String description;     // description
    private String posterUrl;       // poster_url
    private String movieUrl;        // movie_url
    private String trailerUrl;      // trailer_url
    private int releaseYear;        // release_year
    private int durationMinutes;    // duration_minutes
    private boolean isPremium;      // isPremium
    private int viewCount;
    private int rateCount;          // rate count
    private double rating;          // rating
    private boolean isSeries;       // 'Movie' (Phim lẻ) hoặc 'Series' (Phim bộ)
    private String status;          //UPLOAD, COMMING SOON, HIDE
    private int lastestEp;
    private String bannerUrl;

    private int genreId;
    private String genreName;
    public Movie() {}
    public Movie(int id, String title, String description, int releaseYear, int durationMinutes, String posterUrl,
                 String trailerUrl, String movieUrl, int viewCount, double rating, int rateCount, boolean isPremium,
                 boolean isSeries, String status) {

        this.id = id;
        this.title = title;
        this.description = description;
        this.posterUrl = posterUrl;
        this.movieUrl = movieUrl;
        this.trailerUrl = trailerUrl;
        this.releaseYear = releaseYear;
        this.durationMinutes = durationMinutes;
        this.isPremium = isPremium;
        this.viewCount = viewCount;
        this.rating = rating;
        this.isSeries = isSeries;
    }

    // --- GETTERS & SETTERS ---
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPosterUrl() {
        return posterUrl;
    }

    public void setPosterUrl(String posterUrl) {
        this.posterUrl = posterUrl;
    }

    public String getMovieUrl() {
        return movieUrl;
    }

    public void setMovieUrl(String movieUrl) {
        this.movieUrl = movieUrl;
    }

    public String getTrailerUrl() {
        return trailerUrl;
    }

    public void setTrailerUrl(String trailerUrl) {
        this.trailerUrl = trailerUrl;
    }

    public int getReleaseYear() {
        return releaseYear;
    }

    public void setReleaseYear(int releaseYear) {
        this.releaseYear = releaseYear;
    }

    public int getDurationMinutes() {
        return durationMinutes;
    }

    public void setDurationMinutes(int durationMinutes) {
        this.durationMinutes = durationMinutes;
    }

    public boolean isPremium() {
        return isPremium;
    }

    public void setPremium(boolean premium) {
        isPremium = premium;
    }

    public int getViewCount() {
        return viewCount;
    }

    public void setViewCount(int viewCount) {
        this.viewCount = viewCount;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public boolean isSeries() {
        return isSeries;
    }

    public void setSeries(boolean series) {
        isSeries = series;
    }

    public int getRateCount() {
        return rateCount;
    }

    public void setRateCount(int rateCount) {
        this.rateCount = rateCount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getLastestEp() {return lastestEp;}

    public String getBannerUrl() {return bannerUrl;}

    public void setBannerUrl(String bannerUrl) {this.bannerUrl = bannerUrl;}

    public void setLastestEp(int lastestEp) {this.lastestEp = lastestEp;}

    public int getGenreId() {
        return genreId;
    }

    public void setGenreId(int genreId) {
        this.genreId = genreId;
    }

    public String getGenreName() {
        return genreName;
    }

    public void setGenreName(String genreName) {
        this.genreName = genreName;
    }
}
