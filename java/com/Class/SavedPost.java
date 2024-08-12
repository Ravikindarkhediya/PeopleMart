package com.Class;

import java.sql.Timestamp;

public class SavedPost {

    private int sid;
    private int uid;
    private int pid;
    private Timestamp savedDate;

    public SavedPost(int sid, int uid, int pid, Timestamp savedDate) {
        this.sid = sid;
        this.uid = uid;
        this.pid = pid;
        this.savedDate = savedDate;
    }

    public SavedPost(int uid, int pid, Timestamp savedDate) {
        this.uid = uid;
        this.pid = pid;
        this.savedDate = savedDate;
    }

    public SavedPost(int sid) {
        this.sid = sid;
    }

    public SavedPost() {
    }
    

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public Timestamp getSavedDate() {
        return savedDate;
    }

    public void setSavedDate(Timestamp savedDate) {
        this.savedDate = savedDate;
    }
}
