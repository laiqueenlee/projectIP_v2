package com.secj3303.model;

public class ModerationItem {
    private String id;
    private String type;
    private String severity;
    private String title;
    private String author;
    private String reason;
    private String contentBody; // <--- NEW FIELD

    // Updated Constructor
    public ModerationItem(String id, String type, String severity, String title, String author, String reason, String contentBody) {
        this.id = id;
        this.type = type;
        this.severity = severity;
        this.title = title;
        this.author = author;
        this.reason = reason;
        this.contentBody = contentBody;
    }

    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public String getSeverity() { return severity; }
    public void setSeverity(String severity) { this.severity = severity; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }

    public String getReason() { return reason; }
    public void setReason(String reason) { this.reason = reason; }

    // New Getter/Setter
    public String getContentBody() { return contentBody; }
    public void setContentBody(String contentBody) { this.contentBody = contentBody; }
}