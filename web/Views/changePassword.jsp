<%-- 
Document   : login
Created on : Sep 28, 2023, 11:39:22 PM
Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Change Password</title>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
        <link
            href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
            rel='stylesheet'>
        <link
            href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'
            rel='stylesheet'>
        <script type='text/javascript'
        src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <style>
            .placeicon {
                font-family: fontawesome
            }

            .custom-control-label::before {
                background-color: #dee2e6;
                border: #dee2e6
            }
            .btn-common{
                width: 100%;
                background-color: #e91e63;
                color:#fff;
                border-radius:4px;
                border:none;
                cursor:pointer;
                line-height:40px;
                text-align:center;
            }.btn-common:hover{
                 color:#000;
            }
            .border-info {
                 border-color: #e91e63!important;
            }
        </style>
    </head>
    <body oncontextmenu='return false' class='snippet-body bg-light'>
        <!-- Container containing all contents -->
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-9 bg-white col-lg-7 col-xl-6 mt-5">
                    <!-- White Container -->
                    <div class="container bg-white rounded mt-2 mb-2 px-0">
                        <!-- Main Heading -->
                        <div class="row justify-content-center align-items-center pt-3">
                            <h1>
                                <strong>Change Password</strong>
                            </h1>
                        </div>
                        <div class="pt-3 pb-3">
                            <form class="form-horizontal" action="changePassword" method="POST">

                                <div class="form-group row justify-content-center px-3">
                                    <div class="col-9 px-0">
                                        <input type="password" name="oldPassword" placeholder="&#xf084; &nbsp; Old Password"
                                               class="form-control border-info placeicon">
                                    </div>
                                </div>
                                <div class="form-group row justify-content-center px-3">
                                    <div class="col-9 px-0">
                                        <input type="password" name="password" placeholder="&#xf084; &nbsp; New Password"
                                               class="form-control border-info placeicon">
                                    </div>
                                </div>
                                <!-- Password Input -->
                                <div class="form-group row justify-content-center px-3">
                                    <div class="col-9 px-0">
                                        <input type="password" name="confPassword"
                                               placeholder="&#xf084; &nbsp; Confirm New Password"
                                               class="form-control border-info placeicon">
                                    </div>
                                </div>

                                <!-- Log in Button -->
                                <div class="form-group row justify-content-center">
                                    <div class="col-3 px-3 mt-3">
                                        <input type="submit" value="Reset"
                                               class="btn-common">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- Alternative Login -->
                        <div class="mx-0 px-0 bg-white">

                            <!-- Horizontal Line -->
                            <div class="px-4 pt-5">
                                <hr>
                            </div>
                            <!-- Register Now -->
                            <div class="pt-2">
                                <div class="row justify-content-center align-items-center pt-4 pb-5">
                                    <button class="btn-danger" style="background-color: none"><a href="list" style="text-decoration: none" class="text-light">Back to home</a></button>
                                    <div class="col-12">
                                        <c:if test="${status!=null}" var="c">
                                            <h4 style="color:green">${status}</h4>
                                        </c:if>
                                        <h4 style="color:red">${failed}</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type='text/javascript'
        src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>

    </body>
</html>