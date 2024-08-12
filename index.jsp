
<%@include file="header.jsp" %>

<!-- Hero Start -->
<div class="container-fluid py-5 mb-5 hero-header">
    <div class="container py-5">
        <div class="row g-5 align-items-center">
            <div class="col-md-12 col-lg-7">
                <h4 class="mb-3 text-secondary">100% Believable</h4>
                <h1 class="mb-5 display-3 text-primary">Easy to Sell any Item</h1>
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
                            <a class="c-link d-flex m-2 py-2 bg-light rounded-pill active" data-bs-toggle="pill" onclick="getPost(0,this)" 
                               href="#tab-1">
                                <span class="text-dark" style="width: 130px;">All Products</span>
                            </a>
                        </li>
                        <!--Get All Category-->
                        <% 
                            
                            PostDao dao3 = new PostDao(ConnectionProvider.getConnection());
                            ArrayList<Category> list3 = dao3.getAllCategory();
                            
                            for(Category cc3:list3){
                        %>
                        <li class="nav-item">
                            <a class="c-link d-flex py-2 m-2 bg-light rounded-pill" onclick="getPost(<%= cc3.getCid() %>,this)" data-bs-toggle="pill" href="#tab-2">
                                <span class="text-dark" style="width: 130px;"><%= cc3.getName() %></span>
                            </a>
                        </li>
                        <%
                            }
                        %>

                    </ul>
                </div>
            </div>

            <!--start Post--> 
            <div class="row g-4" id="post_container">

                <h1>welcome to Post</h1>


            </div>
            <!--end Post-->
        </div>
    </div>
</div>
<!-- Fruits Shop End-->


<!-- Featurs Start -->
<!--<div class="container-fluid service py-5">
    <div class="container py-5">
        <div class="row g-4 justify-content-center">
            <div class="col-md-6 col-lg-4">
                <a href="#">
                    <div class="service-item bg-secondary rounded border border-secondary">
                        <img src="img2/pexels-olly-3769747.jpg" class="img-fluid rounded-top w-100 feature-img"
                             alt="">
                        <div class="px-4 rounded-bottom">
                            <div class="service-content bg-primary text-center p-4 rounded">
                                <h5 class="text-white pt-4">Best Items</h5>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-6 col-lg-4">
                <a href="#">
                    <div class="service-item bg-dark rounded border border-dark">
                        <img src="img/featur-2.jpg" class="img-fluid rounded-top w-100 feature-img" alt="">
                        <div class="px-4 rounded-bottom">
                            <div class="service-content bg-light text-center p-4 rounded">
                                <h5 class="text-primary pt-4">Tasty Fruits</h5>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-6 col-lg-4">
                <a href="#">
                    <div class="service-item bg-primary rounded border border-primary">
                        <img src="img2/farm-crop/fam-crop.jpeg" class="img-fluid rounded-top w-100 feature-img"
                             alt="">
                        <div class="px-4 rounded-bottom">
                            <div class="service-content bg-secondary text-center p-4 rounded">
                                <h5 class="text-white pt-4">Exotic Vegitable</h5>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>-->
<!-- Featurs End -->


<!-- Vesitable Shop Start-->
<div class="container-fluid vesitable py-5">
    <div class="container py-5">
        <h1 class="mb-0">Most Viewed Product</h1>
        <div class="owl-carousel vegetable-carousel justify-content-center">
            <div class="border border-primary rounded position-relative vesitable-item">
                <div class="vesitable-img">
                    <img src="img2/vehicles/car-1.png" class="img-fluid w-100 rounded-top post-img" alt="">
                </div>
                <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                     style="top: 10px; right: 10px;">Vehicles</div>
                <div class="p-4 rounded-bottom">
                    <h4>Mercede Car</h4>
                    <div class="d-flex justify-content-between flex-lg-wrap">
                        <p class="text-dark fs-5 fw-bold mb-0"><i class="fa fa-rupee"></i>5000000</p>
                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary mt-3">
                            Read more...</a>
                    </div>
                </div>
            </div>

            <div class="border border-primary rounded position-relative vesitable-item">
                <div class="vesitable-img">
                    <img src="img2/vehicles/car-1.png" class="img-fluid w-100 rounded-top post-img" alt="">
                </div>
                <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                     style="top: 10px; right: 10px;">Vehicles</div>
                <div class="p-4 rounded-bottom">
                    <h4>Mercede Car</h4>
                    <div class="d-flex justify-content-between flex-lg-wrap">
                        <p class="text-dark fs-5 fw-bold mb-0"><i class="fa fa-rupee"></i>5000000</p>
                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary mt-3">
                            Read more...</a>
                    </div>
                </div>
            </div>

            <div class="border border-primary rounded position-relative vesitable-item">
                <div class="vesitable-img">
                    <img src="img2/vehicles/car-1.png" class="img-fluid w-100 rounded-top post-img" alt="">
                </div>
                <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                     style="top: 10px; right: 10px;">Vehicles</div>
                <div class="p-4 rounded-bottom">
                    <h4>Mercede Car</h4>
                    <div class="d-flex justify-content-between flex-lg-wrap">
                        <p class="text-dark fs-5 fw-bold mb-0"><i class="fa fa-rupee"></i>5000000</p>
                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary mt-3">
                            Read more...</a>
                    </div>
                </div>
            </div>

            <div class="border border-primary rounded position-relative vesitable-item">
                <div class="vesitable-img">
                    <img src="img2/vehicles/car-1.png" class="img-fluid w-100 rounded-top post-img" alt="">
                </div>
                <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                     style="top: 10px; right: 10px;">Vehicles</div>
                <div class="p-4 rounded-bottom">
                    <h4>Mercede Car</h4>
                    <div class="d-flex justify-content-between flex-lg-wrap">
                        <p class="text-dark fs-5 fw-bold mb-0"><i class="fa fa-rupee"></i>5000000</p>
                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary mt-3">
                            Read more...</a>
                    </div>
                </div>
            </div>

            <div class="border border-primary rounded position-relative vesitable-item">
                <div class="vesitable-img">
                    <img src="img2/vehicles/car-1.png" class="img-fluid w-100 rounded-top post-img" alt="">
                </div>
                <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                     style="top: 10px; right: 10px;">Vehicles</div>
                <div class="p-4 rounded-bottom">
                    <h4>Mercede Car</h4>
                    <div class="d-flex justify-content-between flex-lg-wrap">
                        <p class="text-dark fs-5 fw-bold mb-0"><i class="fa fa-rupee"></i>5000000</p>
                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary mt-3">
                            Read more...</a>
                    </div>
                </div>
            </div>

            <div class="border border-primary rounded position-relative vesitable-item">
                <div class="vesitable-img">
                    <img src="img2/vehicles/car-1.png" class="img-fluid w-100 rounded-top post-img" alt="">
                </div>
                <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                     style="top: 10px; right: 10px;">Vehicles</div>
                <div class="p-4 rounded-bottom">
                    <h4>Mercede Car</h4>
                    <div class="d-flex justify-content-between flex-lg-wrap">
                        <p class="text-dark fs-5 fw-bold mb-0"><i class="fa fa-rupee"></i>5000000</p>
                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary mt-3">
                            Read more...</a>
                    </div>
                </div>
            </div>

            <div class="border border-primary rounded position-relative vesitable-item">
                <div class="vesitable-img">
                    <img src="img2/vehicles/car-1.png" class="img-fluid w-100 rounded-top post-img" alt="">
                </div>
                <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                     style="top: 10px; right: 10px;">Vehicles</div>
                <div class="p-4 rounded-bottom">
                    <h4>Mercede Car</h4>
                    <div class="d-flex justify-content-between flex-lg-wrap">
                        <p class="text-dark fs-5 fw-bold mb-0"><i class="fa fa-rupee"></i>5000000</p>
                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary mt-3">
                            Read more...</a>
                    </div>
                </div>
            </div>

            <div class="border border-primary rounded position-relative vesitable-item">
                <div class="vesitable-img">
                    <img src="img2/vehicles/car-1.png" class="img-fluid w-100 rounded-top post-img" alt="">
                </div>
                <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                     style="top: 10px; right: 10px;">Vehicles</div>
                <div class="p-4 rounded-bottom">
                    <h4>Mercede Car</h4>
                    <div class="d-flex justify-content-between flex-lg-wrap">
                        <p class="text-dark fs-5 fw-bold mb-0"><i class="fa fa-rupee"></i>5000000</p>
                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary mt-3">
                            Read more...</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Vesitable Shop End -->


<!-- Banner Section Start-->
<div class="container-fluid banner bg-secondary my-5">
    <div class="container py-5">
        <div class="row g-4 align-items-center">
            <div class="col-lg-6">
                <div class="py-4">
                    <h1 class="display-3 text-white">Fresh Fruits</h1>
                    <p class="fw-normal display-3 text-dark mb-4">in Our Store</p>
                    <p class="mb-4 text-dark"> cash on delivery is the most preferred payment method, accumulating
                        75% of the e-retail activities.</p>
                    <a href="#"
                       class="banner-btn btn border-2 border-white rounded-pill text-dark py-3 px-5">BUY</a>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="position-relative">
                    <img src="img/baner-1.png" class="img-fluid w-100 rounded" alt="">
                    <div class="d-flex align-items-center justify-content-center bg-white rounded-circle position-absolute"
                         style="width: 140px; height: 140px; top: 0; left: 0;">
                        <h1 style="font-size: 100px;">1</h1>
                        <div class="d-flex flex-column">
                            <span class="h2 mb-0">50<i class="fa fa-rupee"></i></span>
                            <span class="h4 text-muted mb-0">kg</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Banner Section End -->

<!-- Fact Start -->
<div class="container-fluid py-5">
    <div class="container">
        <div class="bg-light p-5 rounded">
            <div class="row g-4 justify-content-center">
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="counter bg-white rounded p-5">
                        <i class="fa fa-users text-secondary"></i>
                        <h4>satisfied customers</h4>
                        <h1>1963</h1>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="counter bg-white rounded p-5">
                        <i class="fa fa-users text-secondary"></i>
                        <h4>quality of service</h4>
                        <h1>99%</h1>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="counter bg-white rounded p-5">
                        <i class="fa fa-users text-secondary"></i>
                        <h4>quality certificates</h4>
                        <h1>33</h1>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="counter bg-white rounded p-5">
                        <i class="fa fa-users text-secondary"></i>
                        <h4>Available Products</h4>
                        <h1>789</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Fact Start -->


<!-- Tastimonial Start -->
<div class="container-fluid testimonial py-5">
    <div class="container py-5">
        <div class="testimonial-header text-center">
            <h4 class="text-primary">Our Testimonial</h4>
            <h1 class="display-5 mb-5 text-dark">Our Client Saying!</h1>
        </div>
        <div class="owl-carousel testimonial-carousel">
            <div class="testimonial-item img-border-radius bg-light rounded p-4">
                <div class="position-relative">
                    <i class="fa fa-quote-right fa-2x text-secondary position-absolute"
                       style="bottom: 30px; right: 0;"></i>
                    <div class="mb-4 pb-4 border-bottom border-secondary">
                        <p class="mb-0">Lorem Ipsum is simply dummy text of the printing Ipsum has been the
                            industry's standard dummy text ever since the 1500s,
                        </p>
                    </div>
                    <div class="d-flex align-items-center flex-nowrap">
                        <div class="bg-secondary rounded">
                            <img src="img/testimonial-1.jpg" class="img-fluid rounded"
                                 style="width: 100px; height: 100px;" alt="">
                        </div>
                        <div class="ms-4 d-block">
                            <h4 class="text-dark">Client Name</h4>
                            <p class="m-0 pb-3">Profession</p>
                            <div class="d-flex pe-5">
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star"></i>
                            </div>
                        </div>
                    </div>
                </div> 

            </div>
            <div class="testimonial-item img-border-radius bg-light rounded p-4">
                <div class="position-relative">
                    <i class="fa fa-quote-right fa-2x text-secondary position-absolute"
                       style="bottom: 30px; right: 0;"></i>
                    <div class="mb-4 pb-4 border-bottom border-secondary">
                        <p class="mb-0">Lorem Ipsum is simply dummy text of the printing Ipsum has been the
                            industry's standard dummy text ever since the 1500s,
                        </p>
                    </div>
                    <div class="d-flex align-items-center flex-nowrap">
                        <div class="bg-secondary rounded">
                            <img src="img/testimonial-1.jpg" class="img-fluid rounded"
                                 style="width: 100px; height: 100px;" alt="">
                        </div>
                        <div class="ms-4 d-block">
                            <h4 class="text-dark">Client Name</h4>
                            <p class="m-0 pb-3">Profession</p>
                            <div class="d-flex pe-5">
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="testimonial-item img-border-radius bg-light rounded p-4">
                <div class="position-relative">
                    <i class="fa fa-quote-right fa-2x text-secondary position-absolute"
                       style="bottom: 30px; right: 0;"></i>
                    <div class="mb-4 pb-4 border-bottom border-secondary">
                        <p class="mb-0">Lorem Ipsum is simply dummy text of the printing Ipsum has been the
                            industry's standard dummy text ever since the 1500s,
                        </p>
                    </div>
                    <div class="d-flex align-items-center flex-nowrap">
                        <div class="bg-secondary rounded">
                            <img src="img/testimonial-1.jpg" class="img-fluid rounded"
                                 style="width: 100px; height: 100px;" alt="">
                        </div>
                        <div class="ms-4 d-block">
                            <h4 class="text-dark">Client Name</h4>
                            <p class="m-0 pb-3">Profession</p>
                            <div class="d-flex pe-5">
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Tastimonial End -->



<%@include file="footer.jsp" %>

