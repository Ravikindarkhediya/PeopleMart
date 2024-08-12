<%-- 
    Document   : register
    Created on : 01-Jul-2024, 2:46:23 pm
    Author     : DELL
--%>
<%@page  import="com.Class.*"%>
<%@page  import="com.dao.*"%>
<%@page  import="com.servlet.*"%>
<%@page  errorPage="error_page.jsp"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up</title>

        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!--Font awesome-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Jquery CDN -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


        <style>
            label {
                font-weight: 600;
                color: #666;
            }

            body {
                background: #f1f1f1;
            }

            .box8 {
                box-shadow: 0px 0px 5px 1px #999;
            }

            .mx-t3 {
                margin-top: -3rem;
            }

            .line-with-text {
                display: flex;
                align-items: center;
                text-align: center;
            }

            .line-with-text::before,
            .line-with-text::after {
                content: '';
                flex: 1;
                border-bottom: 1px solid #000;
            }

            .line-with-text:not(:empty)::before {
                margin-right: .25em;
            }

            .line-with-text:not(:empty)::after {
                margin-left: .25em;
            }
        </style>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>

    <body>

        <div class="container mt-5">
            <form id="register-form" class="mt-5" action="Register" method="POST">
                <div class="row jumbotron box8">
                    <div class=" mt-3  mx-t3 mb-0">
                        <h2 class="text-center text-primary">Signup</h2>
                    </div>

                    <div class="col-sm-6 mt-3 form-group">
                        <label for="name-f">User Name</label>
                        <input type="text" class="form-control" name="r_name" id="r_name"
                               placeholder="Enter your first name." required>
                    </div>
                    <div class="col-sm-6 mt-3 form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" name="r_email" id="r_email" placeholder="Enter your email."
                               required>
                    </div>

                    <div class="col-sm-6 mt-3 form-group">
                        <label for="pass">Password</label>
                        <input type="Password" name="r_password" class="form-control" id="r_password"
                               placeholder="Enter your password." required>
                    </div>

                    <div class="col-sm-6 mt-3 form-group">
                        <label for="pass2">Confirm Password</label>
                        <input type="Password" name="r_cnf-password" class="form-control" id="password2"
                               placeholder="Re-enter your password." required>
                    </div>


                    <div class="col-sm-6 mt-3 form-group">
                        <label for="village-1">Village </label>
                        <input type="text" class="form-control" name="r_village" id="r_village"
                               placeholder="Address / Village" required>
                    </div>
                    <div class="col-sm-6 mt-3 form-group">
                        <label for="district">District</label>
                        <input type="text" class="form-control" name="r_district" id="r_district"
                               placeholder="Enter your district name." required>
                    </div>

                    <div class="col-sm-6 mt-3 form-group">
                        <label for="r_gender">Gender</label>
                        <select id="r_gender" name="r_gender" class="form-control browser-default custom-select">
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="unspesified">Unspecified</option>
                        </select>
                    </div>

                    <div class="col-sm-6 mt-3 form-group">
                        <label for="r_phone">Phone</label>
                        <input type="tel" name="r_phone" class="form-control" id="r_phone"
                               placeholder="Enter Your Contact Number." required>
                    </div>

                    <div class="form-group mt-3 col-sm-6">
                        <label for="file">Profile Photo</label>
                        <input type="file" name="r_profile_img" class="form-control">
                    </div>

                    <div class="col-sm-6 mt-3 form-group">
                        <label for="r_about">About</label>
                        <input type="text" name="r_about" class="form-control" id="r_about"
                               placeholder="Enter about your self.">
                    </div>

                    <div class=" mt-3 form-group">
                        <input type="checkbox" name="r_chk" id="r_chk" required>
                        <label for="r_chk">I accept all terms and conditions.</label>
                    </div>

                    <div class="container text-center" id="loader" style="display: none">
                        <span class="fa fa-refresh fa-spin fa-3x "></span>
                        <h3>Please wait...</h3>
                    </div>

                    <div class=" mt-3 mb-3 form-group mb-0 d-flex justify-content-center">
                        <button class="btn btn-primary px-5 ml-5" type="submit" id="submit-btn">Sign up</button>
                    </div>

                    <div class=" form-goup">
                        <p class="text-center">Already have an account? <a href="login.jsp"
                                                                           class="text-decoration-none">Login now</a>
                        </p>
                    </div>

                    <div class=" form-goup">
                        <div class="line-with-text">or</div>
                    </div>

                    <div class=" form-goup text-center mt-3">
                        <button class="btn btn-outline-primary px-5 mb-3" type="submit"><i class="fa-brands fa-google"></i>
                            &nbsp;
                            Sign in with
                            Google</button>
                    </div>

                </div>
            </form>
        </div>
        <br><br><br>

        <!-- AJAX -->

        <script>
            $(document).ready(function () {
                console.log("Loaded...");
                $('#register-form').on('submit', function (event) {
                    event.preventDefault(); // servlet ma n java dey...

                    let form = new FormData(this);

                    $("#submit-btn").hide();
                    $("#loader").show();
                    $.ajax({
                        url: "Register",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log("Server response:", data); // Add this line
                            $("#submit-btn").show();
                            $("#loader").hide();

                            if (data.trim() === 'Restered Successfully.') {
                                swal("Registered successfully...We are going to redirect on login page ")
                                        .then((value) => {
                                            window.location = "login.jsp";
                                        });
                            } else {
                                swal(data);
                            }
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>    
    </body>

</html>