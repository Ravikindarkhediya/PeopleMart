package com.dao;

import com.Class.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    // get All Category
    public ArrayList<Category> getAllCategory() {
        ArrayList<Category> list = new ArrayList<>();

        try {

            String q = "Select * from categories";
            PreparedStatement st = this.con.prepareStatement(q);
            ResultSet set = st.executeQuery();

            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                Category c = new Category(cid, name, description);
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

//    get Specific post by category
    public Category getSpecificCategory(int pid) {
        Category category = null;

        try {
            String q = "SELECT c.* FROM categories c INNER JOIN posts p ON c.cid = p.catId WHERE p.pid = ?";

            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, pid);
            ResultSet set = ps.executeQuery();

            if (set.next()) {
                int cid = set.getInt("cid");
                String categoryName = set.getString("name");
                String description = set.getString("description");
                category = new Category(cid, categoryName, description);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return category;
    }

//    getAllPost
    public List<Post> getAllPost() {
        List<Post> list = new ArrayList<>();
        // Fetch All the Posts
        try {

            PreparedStatement ps = con.prepareStatement("select * from posts order by pid desc");
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pImg = set.getString("pImg");
                String pContent = set.getString("pContent");
                String pPrice = set.getString("pPrice");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getByte("userId");
                Post post = new Post(pid, pImg, pTitle, pPrice, pContent, date, catId, userId);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

//    getPost By Category...
    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();
        // Fetch All the Posts by id 
        try {

            PreparedStatement ps = con.prepareStatement("select * from posts where catId=?");
            ps.setInt(1, catId);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pImg = set.getString("pImg");
                String pContent = set.getString("pContent");
                String pPrice = set.getString("pPrice");
                Timestamp date = set.getTimestamp("pDate");
                int userId = set.getInt("userId");
                Post post = new Post(pid, pImg, pTitle, pPrice, pContent, date, catId, userId);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // get SavedPost using PostId and UserId ****
    public List<SavedPost> getSavedPostByUidAndPid(int uid, int pid) {
        List<SavedPost> list = new ArrayList<>();

        try {
            String q;
            PreparedStatement ps;

            if (pid == 0) {
                // Fetch all posts saved by user
                q = "SELECT * FROM saved_post WHERE uid=?";
                ps = con.prepareStatement(q);
                ps.setInt(1, uid);
            } else {
                // Fetch specific post saved by the user
                q = "SELECT * FROM saved_post WHERE uid=? AND pid=?";
                ps = con.prepareStatement(q);
                ps.setInt(1, uid);
                ps.setInt(2, pid);
            }
             ResultSet set = ps.executeQuery();
             while (set.next()) {                
                int sid = set.getInt("sid");
                int userId = set.getInt("uid");
                int postId = set.getInt("pid");
                Timestamp date = set.getTimestamp("created_at");
                SavedPost savedPost = new SavedPost(sid, userId, postId, date);
                list.add(savedPost);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // get All SavedPostId ***
    public List<SavedPost> getSavedPostId() {
        List<SavedPost> list = new ArrayList<>();
        try {
            String q = "select * from saved_post";
            PreparedStatement ps = con.prepareStatement(q);

            ResultSet set = ps.executeQuery();
            while (set.next()) {
                int sid = set.getInt("sid");
                int uid = set.getInt("uid");
                int pid = set.getInt("pid");
                Timestamp savedDate = set.getTimestamp("created_at");
                SavedPost sp = new SavedPost(sid, uid, pid, savedDate);
                list.add(sp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

// Save Post     
    public boolean savePost(Post post) {
        boolean f = false;

        try {

            String q = "insert into posts (pImg, pTitle, pPrice, pContent, catId, userId) values (?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, post.getpImag());
            ps.setString(2, post.getpTitle());
            ps.setString(3, post.getpPrice());
            ps.setString(4, post.getpContent());
            ps.setInt(5, post.getCatId());
            ps.setInt(6, post.getUserId());

            ps.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    // insert Saved Post by User ****
    public boolean savedPostByUser(int uid, int pid) {
        boolean f = true;

        try {
            String q = "insert into saved_post (uid, pid) values (?,?)";

            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, uid);
            ps.setInt(2, pid);
            ps.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

//    get post by postId when click to show more...
    public Post getPostByPostId(int postId) {

        Post post = null;
        try {

            String q = "select * from posts where pid=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, postId);

            ResultSet set = ps.executeQuery();
            if (set.next()) {

                int pid = set.getInt("pid"); // database mathi data fetch karva mate
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pImg = set.getString("pImg");
                String pPrice = set.getString("pPrice");
                Timestamp pDate = set.getTimestamp("pDate");
                int userId = set.getInt("userId");
                int cid = set.getInt("catId");
                post = new Post(pid, pImg, pTitle, pPrice, pContent, pDate, cid, userId);

            }
        } catch (Exception e) {
            e.printStackTrace();
            Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, "Database access error:", e);
        }

        return post;
    }
}
