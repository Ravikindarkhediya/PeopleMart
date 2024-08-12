package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class AdminDao {

    Connection con;

    public AdminDao(Connection con) {
        this.con = con;
    }

    public boolean addCategory(String categoryName) {
        boolean f = false;

        try {
            String q = "insert into categories (name) values (?)";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, categoryName);
            ps.executeQuery();
            f = true;
            System.out.println("Data Added Successfully");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean removeCategory(int id) {
        boolean f = false;

        try {
            String q = "delete from categories where cid = ?";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, id);
            ps.executeQuery();
            f = true;
            System.out.println("Data Delete Successfully");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
