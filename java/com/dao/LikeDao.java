/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import java.sql.*;

public class LikeDao {

    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }

    public boolean insertLike(int pid, int uid) {
        boolean f = false;

        try {
            String q = "insert into liked (pid, uid) values (?,?)";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    // Count like on Post
    public int countLikeOnPost(int pid) {
        int count = 0;

        try {
            String q = "select count(*) from liked where pid=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, pid);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                count = set.getInt("count(*)");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    // check post on like or not
    public boolean isLikedByUser(int pid, int uid) {
        boolean f = false;

        try {
            String q = "select * from liked where pid=? and uid=?";
            PreparedStatement ps = this.con.prepareCall(q);
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    // unlike Operation
    public boolean deleteLike(int pid, int uid) {
        boolean f = false;

        try {
            PreparedStatement ps = this.con.prepareStatement("delete from liked where pid=? and uid=?");
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
