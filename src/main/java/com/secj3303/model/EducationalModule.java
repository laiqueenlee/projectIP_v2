package com.secj3303.model;

public class EducationalModule {
    private String id;
    private String title;
    private String description;
    private String duration;
    private String iconClass;
    private String link;
    private String type; // New field for Article, Video, Interactive

    public EducationalModule(String id, String title, String description, String duration, String iconClass, String link, String type) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.duration = duration;
        this.iconClass = iconClass;
        this.link = link;
        this.type = type;
    }

    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getDuration() { return duration; }
    public void setDuration(String duration) { this.duration = duration; }

    public String getIconClass() { return iconClass; }
    public void setIconClass(String iconClass) { this.iconClass = iconClass; }

    public String getLink() { return link; }
    public void setLink(String link) { this.link = link; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
}