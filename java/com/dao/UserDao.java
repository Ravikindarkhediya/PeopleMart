package com.dao;

import com.Class.User;
import java.sql.*;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

//    insert data for user 
    public boolean saveUser(User user) {
        boolean b = false;
        try {
            String q = "insert into users (uname, uemail, upassword, ucnfpassword, uvillage, udistrict, ugender, uphone, uprofile, uabout) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = this.con.prepareStatement(q);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getCnfPassword());
            ps.setString(5, user.getVillage());
            ps.setString(6, user.getDistrict());
            ps.setString(7, user.getGender());
            ps.setString(8, user.getPhone());
            ps.setString(9, user.getProfile());
            ps.setString(10, user.getAbout());

            ps.executeUpdate();

            b = true;
        } catch (Exception e) {
            e.getMessage();
        }
        System.out.println("^^^^^^^^^^^^^^^^^^^^saveUser : " + b);
        return b;
    }

//    Email and password through get all data for db
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        try {

            String q = "Select * from users where uemail=? and upassword=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet set = ps.executeQuery();

            if (set.next()) {
                user = new User();

                user.setId(set.getInt("uid"));  // { 1 } 
                String name = set.getString("uname");  // "name" database na column nu name chhe..   
                user.setName(name);  // { 2 }
//                {1} and {2} are same technique to set data in user object

                user.setEmail(set.getString("uemail"));
                user.setPassword(set.getString("upassword"));
                user.setGender(set.getString("ugender"));
                user.setPhone(set.getString("uphone"));
                user.setVillage(set.getString("uvillage"));
                user.setDistrict(set.getString("udistrict"));
                user.setProfile(set.getString("uprofile"));
                user.setAbout(set.getString("uabout"));
                user.setU_date(set.getTimestamp("created_at"));
            }
        } catch (Exception e) {
            System.out.println("Error : getEmailAndPassword() ==>  " + e);
        }
        return user;
    }

//    Edit Profile function 
    public boolean updateProfile(User user) {
        boolean f = false;
        try {
            String q = "update users set uname=?, uemail=?, upassword=?, uvillage=?, udistrict=?, uphone=?, uabout=?, uprofile=? where uid=?";
            PreparedStatement ps = con.prepareStatement(q);
//            ahiya user ni new details store thase..
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getVillage());
            ps.setString(5, user.getDistrict());
            ps.setString(6, user.getPhone());
            ps.setString(7, user.getAbout());
            ps.setString(8, user.getProfile());
            ps.setInt(9, user.getId());

            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            System.out.println("updateProfile() : Error ==> " + e.getMessage());
        }
        return f;
    }

     // Check if a user already exists by email
    public User getUserByEmail(String email) {
        User user = null;
        try {
            String q = "Select * from users where uemail=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setString(1, email);
            ResultSet set = ps.executeQuery();

            if (set.next()) {
                user = new User();

                user.setId(set.getInt("uid"));
                user.setName(set.getString("uname"));
                user.setEmail(set.getString("uemail"));
                user.setPassword(set.getString("upassword"));
                user.setCnfPassword(set.getString("ucnfpassword"));
                user.setVillage(set.getString("uvillage"));
                user.setDistrict(set.getString("udistrict"));
                user.setGender(set.getString("ugender"));
                user.setPhone(set.getString("uphone"));
                user.setProfile(set.getString("uprofile"));
                user.setAbout(set.getString("uabout"));
                user.setU_date(set.getTimestamp("created_at"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    
//    PostId through get User Info
    public User getPostIdByUserInfo(int userId) {
        User user = null;

        try {

            String q = "Select * from users where uid=?";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet set = ps.executeQuery();

            if (set.next()) {
                int uid = set.getInt("uid");
                String uName = set.getString("uname");
                String uEmail = set.getString("uemail");
                String uPassword = set.getString("upassword");
                String uCnfPassword = set.getString("ucnfpassword");
                String uVillage = set.getString("uvillage");
                String uDistrict = set.getString("udistrict");
                String uGender = set.getString("ugender");
                String uPhone = set.getString("uphone");
                String uProfile = set.getString("uprofile");
                String uAbout = set.getString("uabout");
                Timestamp Created_at = set.getTimestamp("created_at");

                user = new User(uid, uName, uEmail, uPassword, uCnfPassword, uVillage, uDistrict, uGender, uPhone, uProfile, uAbout);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

}
