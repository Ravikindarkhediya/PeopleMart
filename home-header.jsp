<%@page  import="com.Class.*"%>
<%@page  import="com.dao.*"%>
<%@page  import="com.servlet.*"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page  errorPage="error_page.jsp"%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  User user = (User)session.getAttribute("currentUser");  
    if(user == null){
        response.sendRedirect("login.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=de vice-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
        <meta charset="utf-8">

        <title>PeopleMart</title>

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
            rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

        <!-- Libraries Stylesheet -->
        <link href="css/lightbox.min.css" rel="stylesheet" type="text/css"/>
        <link href="owlcarousel/owl.carousel.min.css" rel="stylesheet" type="text/css"/>

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>

    </head>

    <body>

        <!-- Spinner Start -->
        <div id="spinner"
             class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar start -->
        <div class="container-fluid fixed-top">
            <div class="container topbar bg-primary d-none d-lg-block">
                <div class="d-flex justify-content-between">
                    <div class="top-info ps-2">
                        <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#"
                                                                                                         class="text-white"><%= user.getVillage() %>,<%= user.getDistrict() %> </a></small>
                        <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#"
                                                                                                  class="text-white"><%= user.getEmail() %></a></small>
                    </div>
                    <div class="top-link pe-2">
                        <a href="#"  data-bs-toggle="modal" data-bs-target="#term_condition" class="text-white"><small class="text-white mx-2">Terms & Condition</small></a>
                    </div>
                </div>
            </div>
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="index.jsp" class="navbar-brand">
                        <h1 class="text-primary display-6">PeopleMart</h1>
                    </a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                        <div class="navbar-nav mx-auto">
                            <a href="home.jsp" class="nav-item nav-link">Home</a>
                            <a href="home.jsp" class="nav-item nav-link">All Advertisement</a>

                            <a href="contact.jsp" class="nav-item nav-link">Contact</a>
                            <a href="#"  data-bs-toggle="modal" data-bs-target="#postModal" class="nav-item nav-link">Sell</a>

                        </div>
                        <div class="d-flex m-3 me-0">
                            <button
                                class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4"
                                data-bs-toggle="modal" data-bs-target="#searchModal"><i
                                    class="fas fa-search text-primary"></i></button>

                            <a href="#" class="position-relative me-4 my-auto">
                                <i class="fa fa-shopping-bag fa-2x"></i>
                                <span
                                    class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
                                    style="top: -5px; left: 15px; height: 20px; min-width: 20px;">3</span>
                            </a>

                            <div class="btn-group">
                                <i class="fas fa-user mt-1 fa-2x text-primary dropdown-toggle" data-bs-toggle="dropdown"
                                   aria-expanded="false"></i>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#!" data-bs-toggle="modal" data-bs-target="#profile-modal">Your Profile</a></li>
                                    <li><a class="dropdown-item" href="savedAd.jsp">Saved Advertise</a></li>
                                    <li><a class="dropdown-item" href="#">Notification</a></li>
                                    <li><a class="dropdown-item" href="signup.jsp">Sign up</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="LogoutServlet">Logout</a></li>
                                </ul>
                            </div>
                            <a href="LogoutServlet" class="my-auto btn btn-primary text-dark px-1 mx-4 px-3">
                                Logout
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->

        <%
            
//        Message for Profile Update 
        Message msg = (Message)session.getAttribute("msg");
        if(msg != null){
        %>
        <div class="alert <%= msg.getCssClass()%> " role="alert">
            <%= msg.getContent() %>
        </div>
        <%
    }
        session.removeAttribute("msg");
        %>
        <!-- Modal Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-center">
                        <div class="input-group w-75 mx-auto d-flex">
                            <input type="search" class="form-control p-3" placeholder="keywords"
                                   aria-describedby="search-icon-1">
                            <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Search End -->


        <!--Start add post modal-->

        <div class="modal fade" id="postModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Advertise</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form class="form" action="AddAdvertise" id="add_post_form" method="POST">
                            <div class="mb-3">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Category---</option>
                                    <% 
                                        PostDao postDao = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postDao.getAllCategory();
                                        for(Category c:list){
                                    %>
                                    <option value="<%= c.getCid() %>"><%= c.getName() %></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="mb-3">
                                <input name="pTitle" type="text" placeholder="Enter Title" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-lable">Choose Image : </label>
                                <input type="file" name="pPic" class="form-control">
                            </div>
                            <div class="mb-3">
                                <input type="text" name="pPrice" placeholder="Enter Price" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <input type="text" name="pContent" placeholder="Enter Content" class="form-control">
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--End add post modal-->

