package com.example.movie.model;

public class Collections {

    private int id;
    private String name;
    private String description;
    private String bannerUrl;

    public Collections(int id, String name, String description, String bannerUrl) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.bannerUrl = bannerUrl;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBannerUrl() {
        return bannerUrl;
    }

    public void setBannerUrl(String bannerUrl) {
        this.bannerUrl = bannerUrl;
    }
    
}
