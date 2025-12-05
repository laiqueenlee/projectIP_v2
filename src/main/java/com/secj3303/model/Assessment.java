package com.secj3303.model;

import java.time.LocalDateTime;

public class Assessment {
    private String assessmentId;
    private String username;
    private String assessmentType; // "mood", "stress", "anxiety", "wellbeing"
    private int score;
    private String category; // e.g., "Good", "Fair", "Poor"
    private String feedback;
    private LocalDateTime completedAt;
    private String[] recommendations;

    public Assessment() {}

    public Assessment(String assessmentType) {
        this.assessmentType = assessmentType;
    }

    public Assessment(String assessmentId, String username, String assessmentType, 
                      int score, String category, String feedback, LocalDateTime completedAt) {
        this.assessmentId = assessmentId;
        this.username = username;
        this.assessmentType = assessmentType;
        this.score = score;
        this.category = category;
        this.feedback = feedback;
        this.completedAt = completedAt;
    }

    // Getters & Setters
    public String getAssessmentId() {
        return assessmentId;
    }

    public void setAssessmentId(String assessmentId) {
        this.assessmentId = assessmentId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAssessmentType() {
        return assessmentType;
    }

    public void setAssessmentType(String assessmentType) {
        this.assessmentType = assessmentType;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public LocalDateTime getCompletedAt() {
        return completedAt;
    }

    public void setCompletedAt(LocalDateTime completedAt) {
        this.completedAt = completedAt;
    }

    public String[] getRecommendations() {
        return recommendations;
    }

    public void setRecommendations(String[] recommendations) {
        this.recommendations = recommendations;
    }
}
