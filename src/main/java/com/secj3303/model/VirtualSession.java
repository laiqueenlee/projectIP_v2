package com.secj3303.model;

public class VirtualSession {
    private String id;
    private User student;
    private User mhp;
    private String time;  
    private boolean confirmed;

    public VirtualSession() {}

    public VirtualSession(String id, User student, User mhp, String time, boolean confirmed) {
        this.id = id;
        this.student = student;
        this.mhp = mhp;
        this.time = time;
        this.confirmed = confirmed;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public User getStudent() { return student; }
    public void setStudent(User student) { this.student = student; }
    public User getMhp() { return mhp; }
    public void setMhp(User mhp) { this.mhp = mhp; }
    public String getTime() { return time; }
    public void setTime(String time) { this.time = time; }
    public boolean isConfirmed() { return confirmed; }
    public void setConfirmed(boolean confirmed) { this.confirmed = confirmed; }
}

//keqinhelooooo
//hellolq