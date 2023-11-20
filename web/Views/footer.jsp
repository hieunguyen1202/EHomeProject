<%-- 
    Document   : footer
    Created on : Oct 19, 2023, 11:24:25 PM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../Resource/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/c203902cd2.js" crossorigin="anonymous"></script>

        <title>JSP Page</title>
        <style>
            footer .footer-Content{
                background-color:#153039;
                padding:60px 0;
                color:#bfbfbf
            }
            footer .menu{
                padding-left:0
            }
            footer .menu li{
                list-style:none;
                /*                float:left;*/
                padding-bottom:15px;
                width:50%
            }
            footer .menu li a{
                color:#bfbfbf;
                font-size:15px
            }
            footer .menu li a:hover{
                color:#e91e63
            }
            .footer-logo{
                margin-bottom:20px
            }
            li > a{
                text-decoration: none;
            }
            .block-title{
                color: #fff;
            }
            ul{
                list-style: none;
            }
        </style>
    </head>
    <body>
        <footer>
            <section class="footer-Content" style="background-color:#153039">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-xs-6 col-mb-12">
                            <div class="widget">
                                <div class="footer-logo"><img src="images/logomain-removebg-preview.png" alt="" style="width: 100px;height: 100px"></div>
                                <div class="textwidget">
                                    <p> Renting has never been easier! Whether you're searching for a cozy room, a spacious apartment, a convenient motel, or a charming house, our website has got you covered. We understand the importance of finding the perfect place to call home. With our extensive listings and user-friendly interface, you can effortlessly explore a variety of options that suit your preferences and budget.</p>
                                </div>  
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-xs-6 col-mb-12">
                            <div class="widget">
                                <h3 class="block-title">Quick Link</h3>
                                <ul class="menu" style="display: block">
                                    <li><a href="#">- About Us</a></li>
                                    <li><a href="search">- Discover</a></li>
                                    <li><a href="#">- Contact</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-xs-6 col-mb-12">
                            <div class="widget">
                                <h3 class="block-title">Contact Info</h3>
                                <ul class="contact-footer">
                                    <li>
                                        <strong><i class="fa-solid fa-phone"></i></strong><span> 024.868.6868</span>
                                    </li>
                                    <li>
                                        <strong><i class="fa-regular fa-envelope"></i></strong><span> noreply.ehome@gmail.com</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </footer>
    </body>
</html>
