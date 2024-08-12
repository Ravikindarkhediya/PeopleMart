
<%@include file="home-header.jsp" %>


<!-- start profile Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <h5 class="modal-title" id="exampleModalLabel">PeopleMart</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container text-center">
                    <img src="web_img/<%= user.getProfile() %>" style="border-radius: 50%; max-width: 100px" class="img-fluid" alt="alt"/> 
                    <br>
                    <h3 class="modal-title mt-2" id="exampleModalLabel"><%= user.getName() %></h3>
                    <div id="profile-detail">
                        <table class="table table-striped">
                            <tbody>
                                <tr>
                                    <th scope="row">Email : </th>
                                    <td><%= user.getEmail() %></td>
                                </tr>
                                <tr>
                                    <th scope="row">Village : </th>
                                    <td><%= user.getVillage() %></td>
                                </tr>
                                <tr>
                                    <th scope="row">District : </th>
                                    <td><%= user.getDistrict() %></td>
                                </tr>
                                <tr>
                                    <th scope="row">Gender : </th>
                                    <td><%= user.getGender() %></td>
                                </tr>
                                <tr>
                                    <th scope="row">Phone : </th>
                                    <td><%= user.getPhone() %></td>
                                </tr>
                                <tr>
                                    <th scope="row">About : </th>
                                    <td><%= user.getAbout() %></td>
                                </tr>
                                <tr>
                                    <th scope="row">Sign in Date : </th>
                                    <td><%= user.getU_date().toString() %></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- end profile Modal -->

                    <!-- Start Profile-edit -->
                    <div id="profile_edit" style="display: none;">

                        <h3 class="mt-3">Please Edit Carefully.</h3>
                        <form action="EditServlet2" class="form" method="POST" enctype="multipart/form-data">
                            <table class="table table-striped">
                                <tr>
                                    <th>Name : </th>
                                    <td><input type="text" class="form-control" name="user_name" value="<%= user.getName() %>"></td>
                                </tr>
                                <tr>
                                    <th>Email : </th>
                                    <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail() %>"></td>
                                </tr>
                                <tr>
                                    <th>Password : </th>
                                    <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword() %>"></td>
                                </tr>
                                <tr>
                                    <th>Village : </th>
                                    <td><input type="text" class="form-control" name="user_village" value="<%= user.getVillage() %>"></td>
                                </tr>
                                <tr>
                                    <th>District : </th>
                                    <td><input type="text" class="form-control" name="user_district" value="<%= user.getDistrict() %>"></td>
                                </tr>
                                <tr>
                                    <th>Phone no : </th>
                                    <td><input type="text" class="form-control" name="user_phone" value="<%= user.getDistrict() %>"></td>
                                </tr>
                                <tr>
                                    <th>Status : </th>
                                    <td><input type="text" class="form-control" name="user_about" value="<%= user.getAbout() %>"></td>
                                </tr>
                                <tr>
                                    <th>Profile Picture: </th>
                                    <td><input type="file" class="form-control" name="user_img" ></td>
                                </tr>
                                <tr>
                                    <th>Gender : </th>
                                    <td><%= user.getGender() %></td>
                                </tr>
                                <tr>
                                    <th> Sign in Date : </th>
                                    <td><%= user.getU_date() %></td>
                                </tr>
                            </table>
                            <div class="container">
                                <button type="submit" class="btn btn-outline-primary">Save</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
            <div class="modal-footer text-center">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" id="Edit_btn" class="btn btn-primary">Edit</button>
            </div>
        </div>
    </div>
</div>
<!-- end Profile-edit modal -->


<!-- Hero Start -->
<div class="container-fluid py-5 mb-5 hero-header">
    <div class="container py-5">
        <div class="row g-5 align-items-center">
            <div class="col-md-12 col-lg-7">
                <h3 class="mb-3 display-3 text-secondary stylish-regular" > Welcome to <%= user.getName() %> </h3>
                <h4 class="mb-3 text-primary">100% Believable</h4>
                <strong class="mb-5 display-3 text-primary">Easy to Sell any Item</strong>
            </div>
            <div class="col-md-12 col-lg-5">
                <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                    <div class="carousel-inner" role="listbox">
                        <div class="carousel-item active rounded">
                            <img src="img2/pexels-olly-3756345.jpg"
                                 class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">
                            <!-- <a href="#" class="btn px-4 py-2 text-white rounded">Fruites</a> -->
                        </div>
                        <div class="carousel-item rounded">
                            <img src="img2/pexels-olly-3769747.jpg" class="img-fluid w-100 h-100 rounded"
                                 alt="Second slide">
                            <!-- <a href="#" class="btn px-4 py-2 text-white rounded">Vesitables</a> -->
                        </div>
                        <div class="carousel-item rounded">
                            <img src="img2/pexels-wdnet-230544.jpg" class="img-fluid w-100 h-100 rounded"
                                 alt="Second slide">
                            <!-- <a href="#" class="btn px-4 py-2 text-white rounded">Vesitables</a> -->
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselId"
                            data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselId"
                            data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Hero End -->


<!-- Fruits Shop Start-->
<div class="container-fluid demo py-5">
    <div class="container py-5">
        <div class="tab-class text-center">
            <div class="row g-4">
                <div class="col-lg-4 text-start">
                    <h1>Best Products</h1>
                </div>
                <div class="col-lg-8 text-end">
                    <ul class="nav nav-pills d-inline-flex text-center mb-5">
                        <li class="nav-item">
                            <a class="c-link d-flex m-2 py-2 bg-light rounded-pill active" data-bs-toggle="pill" onclick="getPost(0, this)" 
                               href="#tab-1">
                                <span class="text-dark" style="width: 130px;">All Products</span>
                            </a>
                        </li>
                        <!-- Get All Category -->
                        <% 
                            
                            PostDao dao2 = new PostDao(ConnectionProvider.getConnection());
                            ArrayList<Category> list2 = dao2.getAllCategory();
                            
                            for(Category cc:list2){
                        %>
                        <li class="nav-item">
                            <a class="c-link d-flex py-2 m-2 bg-light rounded-pill" onclick="getPost(<%= cc.getCid() %>, this)" data-bs-toggle="pill" href="#tab-2">
                                <span class="text-dark" style="width: 130px;"><%= cc.getName() %></span>
                            </a>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </div>
            </div>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane fade show p-0 active">
                    <div class="row g-4">
                        <div class="col-lg-12">
                            <div class="row g-4" id="post_container">

                                <!-- Post -->
                                <!-- ------------------------------------------------------------------- -->

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- Fruits Shop End-->


<%@include file="footer.jsp" %>

