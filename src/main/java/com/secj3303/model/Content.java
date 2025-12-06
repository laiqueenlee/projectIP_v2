package com.secj3303.model;

public class Content {
    private int id;
    private String title;
    private String category;
    private String date;
    private String status;      
    private String statusClass; 
    private String type;
    
    // Form fields
    private String description;
    private String contentBody;
    private String difficulty;
    private int duration;
    private int points;

    public Content() {}

    public Content(int id, String title, String category, String date, String status, String statusClass, String type) {
        this.id = id;
        this.title = title;
        this.category = category;
        this.date = date;
        this.status = status;
        this.statusClass = statusClass;
        this.type = type;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getStatusClass() { return statusClass; }
    public void setStatusClass(String statusClass) { this.statusClass = statusClass; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getContentBody() { return contentBody; }
    public void setContentBody(String contentBody) { this.contentBody = contentBody; }

    public String getDifficulty() { return difficulty; }
    public void setDifficulty(String difficulty) { this.difficulty = difficulty; }

    public int getDuration() { return duration; }
    public void setDuration(int duration) { this.duration = duration; }

    public int getPoints() { return points; }
    public void setPoints(int points) { this.points = points; }
}