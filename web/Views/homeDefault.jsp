<%-- 
    Document   : homeDefault
    Created on : Oct 19, 2023, 1:02:20 PM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">


    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Ehome</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
        <script src="jquery.min.js"></script>
        <script src="owlcarousel/owl.carousel.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Owl Carousel JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
        <script src="https://kit.fontawesome.com/c203902cd2.js" crossorigin="anonymous"></script>
        <!--<link rel="stylesheet" type="text/css" href="../Resource/css/main.css">-->
        <style>
            .featured-list {
                display: flex;
                overflow-x: auto;
                white-space: nowrap;
                scroll-behavior: smooth; /* Optional: Adds smooth scrolling effect */
            }

            .featured-list .item {
                flex-shrink: 0;
                margin-right: 20px;
            }

            .featured-list .item:last-child {
                margin-right: 0;
            }
        </style>


    </head>
    <body>
       <div id="myCarousel" class="owl-carousel owl-theme my-3">
        <div class="card shadow my-3">
          <img
            src="https://images.pexels.com/photos/68525/soap-colorful-color-fruit-68525.jpeg"
            class="card-img-top"
            height="300"
            alt="Image 1"
          />
          <div class="card-body">
            <h5 class="card-title">Card 1</h5>
            <p class="card-text">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit.
            </p>
          </div>
        </div>
        <div class="card shadow my-3">
          <img
            src="https://images.pexels.com/photos/8754695/pexels-photo-8754695.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"
            class="card-img-top"
            alt="Image 2"
            height="300"
          />
          <div class="card-body">
            <h5 class="card-title">Card 2</h5>
            <p class="card-text">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit.
            </p>
          </div>
        </div>
        <!-- Add more cards as needed -->
      </div>
         <script>
  $(document).ready(function(){
    $("#myCarousel").owlCarousel({
      items: 3, // Number of cards shown in each slide
      loop: true, // Continuously loop the carousel
      margin: 20, // Space between cards
      nav: true, // Show navigation buttons
      navText: ["<i class='fas fa-chevron-left'></i>", "<i class='fas fa-chevron-right'></i>"], // Custom navigation icons
      responsive: {
        0: {
          items: 1 // Number of cards shown in the carousel for smaller screens
        },
        768: {
          items: 2 // Number of cards shown in the carousel for medium screens
        },
        992: {
          items: 3 // Number of cards shown in the carousel for large screens
        }
      }
    });
  });
</script>
    </body>


</html>
