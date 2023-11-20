<%-- 
    Document   : home
    Created on : Sep 25, 2023, 12:27:04 AM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/c203902cd2.js" crossorigin="anonymous"></script>
        <!--<link rel="stylesheet" type="text/css" href="Resource/css/main.css">-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
        <script src="jquery.min.js"></script>
        <script src="owlcarousel/owl.carousel.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <!-- Owl Carousel JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
        <title>EHome</title>
        <style>
            .product-item {
                background: #fff;
                /*padding: 2px 0;*/
                border-radius: 5px;
            }

            .product-item .carousel-thumb {
                display: block;
                position: relative;
                z-index: 99;
                overflow: hidden;
                transition: all .4s ease;
            }

            .product-item .carousel-thumb .overlay {
                position: absolute;
                background-color: rgba(0, 0, 0, .63);
                text-align: center;
                top: 0;
                left: 0;
                z-index: 999;
                opacity: 0;
                width: 100%;
                height: 236px;
                display: table;
                transition: all .4s ease;
            }

            .product-item .carousel-thumb .overlay div {
                vertical-align: middle;
                display: table-cell;
            }

            .product-item .carousel-thumb .btn-product a {
                font-size: 16px;
                padding: 2px 26px;
                border-radius: 4px;
                right: 20px;
                position: absolute;
                top: 15px;
            }

            .product-item .carousel-thumb .price {
                font-size: 18px;
                position: absolute;
                bottom: 20px;
                left: 20px;
                z-index: 9999;
                background:rgba(60, 60, 60, 0.5);
                padding: 3px 6px;
                border-radius: 4px;
            }

            .product-item .carousel-thumb:hover {
                border-color: #e91e63;
                border-radius: 5px;
            }

            .product-item .carousel-thumb:hover .overlay {
                opacity: 1;
                border-radius: 5px;
                visibility: visible;
            }
            .product-item .product-content {
                padding: 10px 20px;
                position: relative;
            }

            .product-item .product-content a {
                color: #999;
                font-size: 14px;
                font-weight: 400;
                margin-right: 5px;
            }

            .product-item .product-content a{
                text-decoration: none;
                margin-right: 5px;
            }

            .product-item .product-title {
                margin: 0;
                overflow: hidden;
                font-size: 18px;
                padding: 10px 0;
                position: relative;
                white-space: nowrap;
            }

            .product-item .product-title a {
                color: #484848;
                font-weight: 500;
                font-size: 18px;
            }

            .product-item .product-title a:hover {
                color: #e91e63;
            }

            .product-item span {
                font-size: 12px;
                color: #fff;
                margin-bottom: 10px;
            }
            .bg-new a {
                background: #e91e63;
                color: #fff !important;
                text-decoration: none
            }
            .card-body a {
                text-decoration: none;
            }

            .card-title {
                font-size: 1.25rem;
                margin-bottom: 1rem;
            }

            .price {
                color: red;
                font-size: 1.125rem;
                margin-bottom: 1rem;
            }

            .btn-common {
                background-color: red;
                color: #fff;
                border: none;
                padding: 0.5rem 1rem;
                cursor: pointer;
                transition: color 0.3s, box-shadow 0.3s;
            }

            .btn-common:hover {
                color: #088395;
                box-shadow: 0 6px 22px rgba(0, 0, 0, 0.1);
            }
            .image-card:hover {
                filter: blur(1px);
            }
            .btn-common-home{
                background-color: #e91e63;
                color:#fff;
                padding: 8px;
                border-radius: 8px;
                margin-left: 30%;
            }
            .btn-common-home:hover{
                color:#000;
            }
            .btn-top{
                background-color: #e91e63;
                color:#fff;
                padding: 8px;
                border-radius: 8px;
                text-decoration: none;
            }
            .btn-top:hover{
                color:#000;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../Views/menu.jsp" />
        <div class="container-fluid">
            <div class="container" style="margin-top: 5%;">
                <div class="row">
                    <h3 class="section-title text-center">Latest Rental</h3>
                    <div class="carousel-inner">
                        <div class="row">
                            <div id="myCarousel" class="owl-carousel owl-theme my-3">
                                <c:forEach  items="${rentTop5}" var="t">              
                                    <div class="card shadow my-4">
                                        <div class="product-item">
                                            <div class="carousel-thumb">
                                                <img class="img-fluid" src="${t.image}" alt="" style="width: 100%;height: 236px;border-radius: 5px; ">
                                                <div class="overlay">
                                                    <div><a class="btn-top" href="detailrent?rentEntityId=${t.rentEntityId}">View Details</a></div>
                                                </div>
                                                <div class="btn-product bg-new">
                                                    <a href="#">New</a>
                                                </div>
                                                <span class="price">Price: <span   style="color: red">${t.price} VND</span></span>
                                            </div>
                                            <div class="product-content">
                                                <h3 class="product-title"><a href="detailrent?rentEntityId=${t.rentEntityId}">${empty houseMap[t.houseId] ? 'None' : houseMap[t.houseId].name}</a></h3>
                                                <span style="color:#999">${t.name}</span>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container">
                <section>   
                    <div class="row">
                        <nav class="navbar navbar-expand-lg navbar-none bg-none">
                            <div class="container">
                                <ul class="navbar-nav">
                                    <c:forEach items="${rentType}" var="r">
                                        <c:choose>
                                            <c:when test="${r.rentTypeId == 1}">
                                                <c:set var="rentType" value="Room" />
                                            </c:when>
                                            <c:when test="${r.rentTypeId == 2}">
                                                <c:set var="rentType" value="House" />
                                            </c:when>
                                            <c:when test="${r.rentTypeId == 3}">
                                                <c:set var="rentType" value="Apartment" />
                                            </c:when>
                                        </c:choose>
                                        <li class="nav-item">
                                            <a class="nav-link" href="list?rentTypeId=${r.rentTypeId}">
                                                <i class="fa-solid fa-hotel"></i> ${rentType}
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </nav>

                        <c:forEach  items="${rent}" var="c">                    
                            <div class="col-lg-3 col-md-12 mb-4">
                                <div class="card" style="cursor: pointer">
                                    <div class="bg-image hover-zoom ripple ripple-surface ripple-surface-light"
                                         data-mdb-ripple-color="light">
                                        <img class="image-card" src="${c.image}"
                                             style="border-radius: 2%" width="100%" height="300px" />
                                        <div class="mask">
                                            <div class="d-flex justify-content-start align-items-end h-100">
                                                <h5><span class="badge bg-primary ms-2">New</span></h5>
                                            </div>
                                        </div>
                                        <a href="#!">
                                            <div class="hover-overlay">
                                                <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="card-body">
                                        <a href="" class="text-reset">      
                                            <h5 class="card-title mb-3">${empty houseMap[c.houseId] ? 'None' : houseMap[c.houseId].name}</h5>
                                        </a>
                                        <p>${c.name}</p>
                                        <h6 class="mb-3">Price: <span   style="color: red">${c.price} VND</span></h6>
                                        <a href="detailrent?rentEntityId=${c.rentEntityId}" class="btn-common-home">View Details</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="d-flex justify-content-center">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <c:if test="${page.index != 0}">
                                    <li class="page-item">
                                        <a class="page-link" href="list&index=${page.index - 1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:forEach var="i" begin="${page.pageStart}" end="${page.pageEnd}">
                                    <li class="page-item">
                                        <a class="page-link" href="list&index=${i}">${i + 1}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${page.index < page.totalPage - 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="list&index=${page.index + 1}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </section>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $("#myCarousel").owlCarousel({
                    items: 3,
                    loop: true,
                    margin: 20,
                    nav: true,
                    navText: ["<i class='fas fa-chevron-left'></i>", "<i class='fas fa-chevron-right'></i>"],
                    autoplay: true, // Enable auto sliding
                    autoplayTimeout: 2500, // Set auto slide duration to 3 seconds (3000 milliseconds)
                    responsive: {
                        0: {
                            items: 1
                        },
                        768: {
                            items: 2
                        },
                        992: {
                            items: 4
                        }
                    }
                });
            });
        </script>
        <jsp:include page="../Views/footer.jsp"></jsp:include>
    </body>
</html>
