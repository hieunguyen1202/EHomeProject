<%-- 
    Document   : home
    Created on : Sep 22, 2023, 11:34:57 AM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/c203902cd2.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>        
        <link rel="stylesheet" type="text/css" href="../Resource/css/main.css">

        <script type="text/javascript">
            document.addEventListener('DOMContentLoaded', function () {
                const toggleButton = document.querySelector('.navbar-toggler');
                const loginLink = document.querySelector('.login');
                const signUpButton = document.querySelector('.btn-success');

                toggleButton.addEventListener('click', () => {
                    loginLink.classList.toggle('d-none');
                    signUpButton.classList.toggle('d-none');
                });
            });

        </script>
        <style>
            .btn{
                background-color: #e91e63;
                color:#fff;
                padding: 8px;
                border-radius: 8px;
            }
            .btn-common-home:hover{
                color:#000;
            }
            .subnav {
                list-style: none;
                text-decoration: none;
            }
            .subnav li a {
                text-decoration: none;
                color: black;
                text-align: left;
            }
            #user-logo {
                width: 60px;
                height: 60px;
                padding: 8% 0;
                border-radius: 50%;
                overflow: hidden;
            }

            #user-logo img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                border-radius: 50%;
            }

            .subnav{
                display: none;
                top: 100%;
                min-width: 160px;
                position: absolute;
                background-color: #fff;
                list-style-type: none;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
                padding: 0;
            }

            .logo-user{
                position: relative;
            }
            .subnav li a {
                color: #000;
                padding: 0 12px;
                line-height: 38px;
                display: block;
            }

            .subnav li:hover {
                background-color: #ccc;
                color: #000;
                position: relative;
                cursor: pointer;
            }
            #user-button {
                background: none;
                border: none;
                cursor: pointer;
            }
            .navbar-expand-lg .navbar-nav li a:hover,.navbar-expand-lg .navbar-nav li .active>a,.navbar-expand-lg .navbar-nav li a:focus{
                color:#e91e63;
                outline:none
            }
            .navbar{
                padding:0
            }
            #user-logo:hover ,.nav-item:hover{
                filter: blur(0.5px);
                cursor: pointer
            }
        </style>

    </head>
    <body>
        <!-- Navigation  bg-light -->
        <nav class="navbar navbar-expand-lg navbar-light  shadow fixed-top" style="background-color: #fff">
            <div class="container">
                <a class="navbar-brand" href="list"><img src="images/logomain.png" alt="alt" width="50px" height="50px" /></a>



                <div class="collapse navbar-collapse justify-content-md-center" id="navbarResponsive">
                    <ul class="navbar-nav ">
                        <li class="nav-item active">
                            <a class="nav-link" href="list">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">About Us</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="search">Discover</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Contact</a>
                        </li>
                    </ul>
                </div>

                <div class="d-md-auto" id="nav-login"> <!-- Only displayed in the toggle menu for screens less than md -->
                    <c:if test="${user==null}">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link login text-decoration-none text-secondary" href="login">Log In</a>

                            </li>
                            <li class="nav-item">
                                <a class="btn action-button me-2" type="button" href="register">Sign Up</a>
                            </li>
                        </ul>
                    </c:if>
                    <c:if test="${user != null && user.role != 0}">
                        <ul class="navbar-nav">
                            <li id="logo-user">
                                <button id="user-button" onclick="toggleSubnav()"> 
                                    <img id="user-logo" src="${user.image}" alt="User Logo"/>
                                    <svg fill="currentColor" viewBox="0 0 16 16" width="1em" height="1em" class="x1lliihq x1k90msu x2h7rmj x1qfuztq x198g3q0 x1kpxq89 xsmyaan"><g fill-rule="evenodd" transform="translate(-448 -544)"><path fill-rule="nonzero" d="M452.707 549.293a1 1 0 0 0-1.414 1.414l4 4a1 1 0 0 0 1.414 0l4-4a1 1 0 0 0-1.414-1.414L456 552.586l-3.293-3.293z"></path></g></svg>
                                </button>
                                <ul class="subnav">
                                    <li><a href="updateprofile">Profile</a></li>
                                    <li><a href="changePassword">Change Password</a></li>
                                        <c:if test="${user.role==2}">
                                        <li><a href="manageowner">Manage</a></li>
                                        </c:if>
                                        <c:if test="${user.role==1}">
                                        <li><a href="yourRequest">Your Request</a></li>
                                        </c:if>
                                    <li><a href="logout">Logout</a></li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <p class="text-secondary mt-3" style="margin-left: 12%"  id="user-name">${user.fullname}</p>
                            </li>
                        </ul>
                    </c:if>
                    <c:if test="${user.role==0}">
                        <ul class="navbar-nav">
                            <li id="logo-user">
                                <button id="user-button" onclick="toggleSubnav()"> 
                                    <img id="user-logo" src="${user.image}" alt="User Logo"/>
                                    <svg fill="currentColor" viewBox="0 0 16 16" width="1em" height="1em" class="x1lliihq x1k90msu x2h7rmj x1qfuztq x198g3q0 x1kpxq89 xsmyaan"><g fill-rule="evenodd" transform="translate(-448 -544)"><path fill-rule="nonzero" d="M452.707 549.293a1 1 0 0 0-1.414 1.414l4 4a1 1 0 0 0 1.414 0l4-4a1 1 0 0 0-1.414-1.414L456 552.586l-3.293-3.293z"></path></g></svg>
                                </button>
                                <ul class="subnav">
                                    <li><a href="updateprofile">Profile</a></li>
                                    <li><a href="changePassword">Change Password</a></li>
                                    <li><a href="manageadmin">Manage</a></li>
                                    <li><a href="logout">Logout</a></li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <p class="text-secondary mt-3" style="margin-left: 12%"  id="user-name">${user.fullname}</p>
                            </li>
                        </ul>
                    </c:if>

                </div>
                <!-- Move the toggle button to the right on < md screens -->
                <div class="ms-auto">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </div>
            </div>
        </nav>
        <script>
            // Get the full name
            var fullName = document.getElementById("user-name").textContent;

            // Split the full name by space
            var names = fullName.split(" ");

            // Display the first two names
            if (names.length >= 2) {
                document.getElementById("user-name").textContent = names[2];
            }
            ;
            var subnav = document.querySelector(".subnav");

            function toggleSubnav() {
                if (subnav.style.display === "block") {
                    subnav.style.display = "none";
                } else {
                    subnav.style.display = "block";
                }
            }
        </script>
    </body>
</html>
