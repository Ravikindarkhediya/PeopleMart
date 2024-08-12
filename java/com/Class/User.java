package com.Class;

import java.sql.*;

public class User {

    private int id;
    private String name;
    private String email;
    private String password;
    private String cnfPassword;
    private String village;
    private String district;
    private String gender;
    private String phone;
    private String profile;
    private String about;
    private Timestamp u_date;

    public User(int id, String name, String email, String password, String cnfPassword, String village, String district, String gender, String phone, String profile, String about) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.cnfPassword = cnfPassword;
        this.village = village;
        this.district = district;
        this.gender = gender;
        this.phone = phone;
        this.profile = profile;
        this.about = about;
    }

    public User(String name, String email, String password, String cnfPassword, String village, String district, String gender, String phone, String profile, String about) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.cnfPassword = cnfPassword;
        this.village = village;
        this.district = district;
        this.gender = gender;
        this.phone = phone;
        this.profile = profile;
        this.about = about;
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public User() {
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getVillage() {
        return village;
    }

    public void setVillage(String village) {
        this.village = village;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCnfPassword() {
        return cnfPassword;
    }

    public void setCnfPassword(String cnfPassword) {
        this.cnfPassword = cnfPassword;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public Timestamp getU_date() {
        return u_date;
    }

    public void setU_date(Timestamp u_date) {
        this.u_date = u_date;
    }

}
