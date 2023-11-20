<%-- 
    Document   : search
    Created on : Oct 20, 2023, 9:26:35 AM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Resource/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="Resource/css/main.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://kit.fontawesome.com/c203902cd2.js" crossorigin="anonymous"></script>
        <style>
            .featured-box{
                width:100%;
                background:#fff;
                margin-bottom:15px;
                margin-top:15px
            }
            .featured-box figure{
                margin:0;
                width:100%;
                float:left;
                position:relative
            }
            .featured-box figure .price-save{
                z-index:9;
                position:absolute;
                bottom:20px;
                left:0;
                display:inline-block;
                border-bottom-right-radius:4px;
                border-top-right-radius:4px;
                background-color:#e91e63;
                color:#fff;
                padding:4px 15px
            }
            .featured-box figure .icon{
                position:absolute;
                bottom:20px;
                right:15px
            }
            .featured-box figure .icon span{
                margin-right:5px
            }
            .featured-box figure .icon span i{
                z-index:2;
                color:#fff;
                font-size:15px;
                font-weight:500;
                text-align:center;
                background:#e91e63;
                padding:10px;
                display:inline-block;
                border-radius:50%;
                cursor:pointer
            }
            .featured-box figure .icon .bg-green i{
                background:#347fff
            }
            .featured-box .feature-content{
                display:inline-block;
                box-shadow:0 0 10px rgba(175,175,175,.23);
                padding:15px
            }
            .price-inputs {
                display: flex;
                overflow-x: auto;
                white-space: nowrap;
            }

            .price-inputs .form-group {
                margin-right: 10px;
            }


            #hero-area {
                width: 100vw;
                height: 60vh;
                position: relative;
            }
            #hero-area .overlay {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: url(uploads/hero-area.jpg);
                background-size: cover;
                background-repeat: no-repeat;
                background-position: left center;
                filter: blur(2px);
            }

            .img-fluid:hover{
                filter: blur(1px);
            }
            #hero-area .contents{
                padding:150px 0 240px
            }
            #hero-area .contents .head-title{
                color:#fff;
                font-size:36px;
                font-weight:700;
                margin-bottom:15px
            }
            #hero-area .contents span.year{
                color:#e91e63
            }
            #hero-area .contents p{
                font-size:15px;
                color:#fff;
                font-weight:400;
                line-height:26px
            }
            .search-bar{
                margin-top:40px
            }
            .search-bar .search-form{
                width:100%;
                float:left
            }
            .search-bar .search-inner{
                background:#fff;
                overflow:hidden;
                border-radius:4px
            }
            .search-bar .search-inner{
                margin:0;
                border:0;
                width:100%;
                float:left;
                position:relative
            }
            .search-bar .form-group:first-child{
                border:0
            }
            .search-bar .form-group{
                margin:5px;
                float:left;
                width:25.33%;
                padding:0 0 0 10px;
                background:#fff;
                border-radius:0;
                border-left:1px solid #f1f1f1
            }
            .search-bar .form-group .form-control{
                position:relative;
                z-index:1;
                border:0;
                height:50px;
                border-radius:4px;
                font-size:15px;
                line-height:30px;
                padding:15px 0 15px 0
            }
            .search-bar .form-group .form-control,.search-bar .form-group .select select{
                border:0;
                height:50px;
                border-radius:0;
                font-size:14px;
                line-height:30px;
                background:#fff
            }
            .search-bar .form-group .form-control,.search-bar .form-group .select select:focus{
                outline:none;
                box-shadow:none
            }
            .search-bar .select{
                color:#999;
                float:left;
                width:100%;
                position:relative;
                text-transform:uppercase
            }
            .search-bar .select:after{
                top:7px;
                right:15px;
                z-index:2;
                color:#999;
                display:none;
                content:'\e93a';
                position:absolute;
                text-align:center;
                font-size:inherit;
                line-height:40px;
                font-family:lineicons
            }
            .search-bar .select select{
                z-index:1;
                cursor: pointer;
                width:100%;
                position:relative;
                appearance:none;
            }
            .search-bar .select select option{
                color:#999;
            }
            .search-bar .inputwithicon{
                position:relative
            }
            .search-bar .inputwithicon i{
                top:0;
                right:0;
                z-index:2;
                color:#e91e63;
                position:absolute;
                right:5px;
                font-size:20px;
                line-height:50px
            }
            .search-bar .btn-common{
                top:5px;
                right:5px;
                padding:0;
                z-index:2;
                width:157px;
                border-radius:4px;
                border:none;
                cursor:pointer;
                line-height:50px;
                text-align:center;
                position:absolute;
                letter-spacing:.5px;
            }
            .search-bar .btn-common i{
                font-size:20px;
                vertical-align:middle
            }
            .btn-common-search-advanced{
                width: 100%;
                background-color: #e91e63;
                color:#fff;
            }
            .btn-common-search-advanced:hover{
                color:#000;
            }
            .results-row {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
            }

            .col-xs-6, .col-sm-6, .col-md-4, .col-lg-4 {
                flex: 0 0 calc(33.333% - 20px);
                margin-bottom: 20px;
            }
            h4 {
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                max-width: 100%;
            }
            .img-fluid{
                filter: blur(0.5px);
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

        <title>Ehome - Search</title>
    </head>
    <body>
        <%--<jsp:include page="../Views/menu.jsp" />--%>
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
                                <a class="btn btn-common detail" type="button" href="register">Sign Up</a>
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
        <div id="hero-area">
            <div class="overlay"></div>
            <div class="row justify-content-center">
                <div class="col-md-12 col-lg-9 col-xs-12 text-center">
                    <div class="contents">
                        <h1 class="head-title">Welcome to <span class="year">EHome</span></h1>
                        <div class="search-bar">
                            <div class="search-inner">
                                <form class="search-form"  method="post" action="SearchAjax">
                                    <div class="form-group">
                                        <input oninput="searchByName(this)" type="text" name="name" class="form-control" placeholder="What are you looking for?">
                                    </div>
                                    <div class="form-group inputwithicon">
                                        <div class="select">
                                            <select id="citySelect" name="city">
                                                <option disabled selected value="">Select City</option>
                                                <!--<option value="none">Select City</option>-->
                                                <c:forEach items="${cityMap}" var="cityEntry">
                                                    <c:if test="${cityEntry.key != 0}">
                                                        <option value="${cityEntry.key}">${cityEntry.value.name}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <i class="fa-solid fa-location-crosshairs"></i>
                                    </div>

                                    <div class="form-group inputwithicon">
                                        <div class="select">
                                            <select id="districtSelect" name="district">
                                                <option disabled selected value="">Select District</option>
                                                <!--<option value="none">Select District</option>-->
                                                <c:forEach items="${districtMap}" var="districtEntry">
                                                    <c:if test="${districtEntry.key != 0}">
                                                        <option value="${districtEntry.key}">${districtEntry.value.name}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <i class="fa-solid fa-location-crosshairs"></i>
                                    </div>

                                    <div class="form-group inputwithicon">
                                        <div class="select">
                                            <select id="wardSelect" name="ward">
                                                <option disabled selected value="">Select Ward</option>
                                                <!--<option value="none">Select Ward</option>-->
                                                <c:forEach items="${wardMap}" var="wardEntry">
                                                    <c:if test="${wardEntry.key != 0}">
                                                        <option value="${wardEntry.key}">${wardEntry.value.name}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <i class="fa-solid fa-location-crosshairs"></i>
                                    </div>
                                    <div class="form-group inputwithicon">
                                        <div class="select">
                                            <select  id="rentTypeSelect" name="rentType">
                                                <option disabled selected value="">Select Type</option>
                                                <!--<option value="none">Select Type</option>-->
                                                <c:forEach items="${rentMap}" var="rentEntry">
                                                    <c:if test="${rentEntry.key != 0}">
                                                        <option name="op${rentEntry.key}" value="${rentEntry.key}">${rentEntry.value.name}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <i class="fa-solid fa-bars"></i>
                                    </div>
                                    <button class="btn btn-common" type="submit"><i class="fa-solid fa-magnifying-glass"></i> Search Now</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--<div class="container">-->
        <!--<div class="row">-->
        <!--                 Advanced Search Section 
                        <section class="advanced-search col-md-4">
                            <form class="advanced-search-form" action="search" method="post">
                                <h3>Advanced Search</h3>
                                <div class="form-group">
                                    <label class="range_header">Price Range</label>
                                    <div class="range-body">
                                        <div class="range-input" style="display: flex">
                                            <input type="text" aria-label="Minimum Price" maxlength="10" name="minPrice" class="range-filter_input" placeholder="₫ MIN" oninput="validateInput(this)" value="">
                                            <div class="range-line"><i class="fa-solid fa-right-long"></i></div>
                                            <input type="text" aria-label="Maximum Price" maxlength="10" name="maxPrice" class="range-filter_input" placeholder="₫ MAX" oninput="validateInput(this)" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="area">Area:</label>
                                    <input type="text" id="area" name="area" oninput="validateInput(this)" class="form-control">
                                </div>
                                <button type="submit" class="btn btn-common-search-advanced">Apply</button>
                            </form>
                        </section>-->



        <div class="container">
            <h1 class="section-title text-center">Search Products</h1>
            <section class="featured col-md-8 section-padding">
                <div id="content" class="container">
                    <div class="row">
                        <!--<div class="results-row">-->
                        <c:forEach items="${searchResults}" var="s">
                            <div class="col-md-4">
                                <div class="featured-box"  style="border-radius: 5px;box-shadow: 1px 1px 10px grey;padding: 2px">
                                    <figure>
                                        <a href="detailrent?rentEntityId=${s.rentEntityId}"><img class="img-fluid" src="${s.image}" style="border-radius: 5px; width:210px;height:150px" alt=""></a>
                                    </figure>
                                    <div class="feature-content">
                                        <h4 style="font-size: 15px">${s.name}</h4>
                                        <div class="meta-tag">
                                            <span>                             
                                                <p style="font-size: 10px">${empty houseMap[s.houseId] ? 'None' : houseMap[s.houseId].name}</p>
                                            </span>
                                        </div>
                                        <div class="listing-bottom">
                                            <h6 class="price float-left" style="font-size: 14px">Price: <span style="color:red;">${s.price} VND</span></h6>
                                            <a href="detailrent?rentEntityId=${s.rentEntityId}"  class="btn btn-common detail" style="margin-left: 14%">View Details</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </div>


        <!--</div>-->
        <script>
            function validateInput(input) {
                // Remove non-numeric characters from the input value
                input.value = input.value.replace(/[^0-9]/g, '');
            }
        </script>
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
        <script>
            $(document).ready(function () {
                $('#citySelect').change(function () {
                    var cityId = $(this).val();
                    if (cityId === "") {
                        // Clear district dropdown if no city is selected
                        $('#districtSelect').html('<option disabled selected value="">Select District</option>');
                        return;
                    }

                    $.ajax({
                        type: 'get',
                        url: 'http://localhost:9999/ehome/SearchAjax',
                        dataType: 'json',
                        success: function (data) {
                            var districtSelect = $('#districtSelect');
                            districtSelect.html('<option disabled selected value="">Select District</option>');

                            // Populate district dropdown with the response data
                            for (var i = 0; i < data.length; i++) {
                                var option = $('<option></option>');
                                option.val(data[i].id);
                                option.text(data[i].name);
                                districtSelect.append(option);
                            }
                        },
                        error: function (xhr, status, error) {
                            console.log(error);
                        }
                    });
                });
            });
        </script>
    </body>
</html>
