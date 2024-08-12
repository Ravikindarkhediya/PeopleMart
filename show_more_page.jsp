<%@page import="com.Class.*" %>
<%@page import="com.dao.*" %>
<%@page import="com.servlet.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page errorPage="error_page.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Post post = null;
    User user = null;
    UserDao userDao = null;
    try {
        int postId = Integer.parseInt(request.getParameter("post_id")); // ajax mathi post_id ne get karu..
        PostDao dao = new PostDao(ConnectionProvider.getConnection());
        post = dao.getPostByPostId(postId);
        userDao  = new UserDao(ConnectionProvider.getConnection());
        
        if (post != null) {
        user = userDao.getPostIdByUserInfo(post.getUserId());
        }else{
            System.out.println("^^^^^^^^^^^^ Post is NULL ^^^^^^^^^^^^^");
        }        
    
    } catch (Exception e) {
        e.printStackTrace();
    }
    if (post != null && user != null) {
%>

<div class="container mt-2">

    <div class="row">
        <div class="col-md-6 border border-1 p-3 border-dark rounded-5" >
            <div class="row d-flex justify-content-center align-items-center">
                <img src="Post_imgs/<%= post.getpImag() %>" class="img-fluid" style="max-width: 300px;" alt="">
            </div>

            <div class="row   border-5 p-3 border-secondary ">
                <!-- Advertise details -->

                <table class="table table-striped">
                    <tr>
                        <th colspan="2" class="text-center"><%= post.getpTitle() %></th>
                    </tr>
                    <tr>
                        <th>Price : </th>
                        <td><%= post.getpPrice() %></td>
                    </tr>
                    <tr>
                        <th>About Ad : </th>
                        <td><%= post.getpContent() %>.</td>
                    </tr>
                    <tr>
                        <th>Posted Date : </th>
                        <td><%= post.getpDate() %></td>
                    </tr>

                </table>
            </div>
        </div>

        <div class="col-md-6 border border-1 p-3 border-dark">
            <div class="row   border-5 border-secondary mb-2">
                <!-- Profile -->
                <div class="container mb-4">
                    <div class="row">
                        <div class="col-md-8 pt-4">
                            <h3>Contact</h3>
                        </div>
                        <div class="col-md-4">
                            <img src="web_img/<%= user.getProfile() %>" class="img-fluid bg-secondary rounded-pill" style="max-width: 100px" alt="">
                        </div>
                    </div>
                </div>
                <table class="table table-striped">
                    <tr>
                        <th>Name : </th>
                        <td><%= user.getName() %></td>
                    </tr>
                    <tr>
                        <th>Email : </th>
                        <td><%= user.getEmail() %></td>
                    </tr>
                    <tr>
                        <th>Mobile no : </th>
                        <td><%= user.getPhone() %></td>
                    </tr>
                    <tr>
                        <th>Address : </th>
                        <td><%= user.getVillage() %>, <%= user.getDistrict() %></td>
                    </tr>
                    <tr>
                        <th>About : </th>
                        <td><%= user.getAbout() %></td>
                    </tr>

                </table>
                <div class="container-fluid">

                    <div>
                        <form method="POST" class="form" action="SavedPostServlet">
                            <input type="hidden" value="<%= post.getPid() %>" name="postid" class="form-control">
                            <input type="hidden" value="<%= user.getId() %>" name="userid" class="form-control">
                            <button type="submit" class="btn border m-2 border-secondary rounded text-primary" id="hide_post">Save</a>
                        </form>
                    </div>
                    <a href="#"
                       class="btn border border-primary m-2 rounded text-primary ">
                        <i class="fa fa-thumbs-o-up"></i><span>10</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<% 
} else { 
%>
<h1>Post not found</h1>
<% 
    } 
%>
