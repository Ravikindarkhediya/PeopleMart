
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.Class.*" %>
<%@page import="com.dao.*" %>
<%@page import="com.servlet.*" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

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

            .form-area {
                max-width: 400px;
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

    </head>

    <body class="">

        <div class="container mt-5 d-flex align-center justify-content-center">
            <div class="form-area">
                <form class="mt-5" action="Login" method="POST" autocomplete="on">
                    <div class="row jumbotron box8">

                        <div class=" mt-3  mx-t3 mb-0">
                            <h2 class="text-center text-info">Login</h2>
                        </div>

                        <!--When user wrong password or email to show error Message-->
                        <% 
                            Message msg = (Message)session.getAttribute("msg");
                            if(msg != null){
                        %>
                        <div class="alert   <%= msg.getCssClass() %> role="alert">
                            <%= msg.getContent() %>
                        </div>
                        <%
                            session.removeAttribute("msg");
                        }
                        %>

                        <div class=" mt-3 form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" name="email" id="email" placeholder="Enter your email."
                                   required>
                        </div>

                        <div class=" mt-3 form-group">
                            <label for="pass">Password</label>
                            <input type="Password" name="password" class="form-control" id="pass"
                                   placeholder="Enter your password." required>
                        </div>

                        <a href="#" class="text-decoration-none mt-3">Forgot Password?</a>

                        <div class=" mt-3 mb-3 form-group mb-0 d-flex justify-content-center">
                            <button class="btn btn-primary px-5 ml-5">Login</button>
                        </div>

                        <div class=" form-goup">
                            <p class="text-center">Don't have an account? <a href="signup.jsp"
                                                                             class="text-decoration-none">Sign up</a>
                            </p>
                        </div>

                        <div class=" form-goup">
                            <div class="line-with-text">or</div>
                        </div>

                        <div class=" form-goup text-center mt-3">
                            <button class="btn btn-outline-primary px-5 mb-3"><i class="fa-brands fa-google"></i> &nbsp;
                                Sign in with
                                Google</button>
                        </div>

                    </div>
                </form>
            </div>
        </div>
        <br><br><br>

        <!-- JavaScript -->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    </body>

</html>