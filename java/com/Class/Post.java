package com.Class;

import java.sql.Timestamp;

public class Post {
    private int pid;
    private String pImag;
    private String pTitle;
    private String pPrice;
    private String pContent;
    private Timestamp pDate;
    private int catId;
    private int userId;

    public Post(int pid, String pImag, String pTitle, String pPrice, String pContent, Timestamp pDate, int catId, int userId) {
        this.pid = pid;
        this.pImag = pImag;
        this.pTitle = pTitle;
        this.pPrice = pPrice;
        this.pContent = pContent;
        this.pDate = pDate;
        this.catId = catId;
        this.userId = userId;
    }

    public Post() {
    }

    public Post(String pImag, String pTitle, String pPrice, String pContent, Timestamp pDate, int catId, int userId) {
        this.pImag = pImag;
        this.pTitle = pTitle;
        this.pPrice = pPrice;
        this.pContent = pContent;
        this.pDate = pDate;
        this.catId = catId;
        this.userId = userId;

    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getpImag() {
        return pImag;
    }

    public void setpImag(String pImag) {
        this.pImag = pImag;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpPrice() {
        return pPrice;
    }

    public void setpPrice(String pPrice) {
        this.pPrice = pPrice;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    
}
