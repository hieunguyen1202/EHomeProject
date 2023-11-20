<%-- 
    Document   : detailRent
    Created on : Oct 20, 2023, 12:23:59 AM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/c203902cd2.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="Resource/css/main.css">
        <!--        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">-->
        <title>Ehome - Detail</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </head>
    <body>
        <jsp:include page="../Views/menu.jsp"/>
        <c:set  value="${rent}" var="c"></c:set>
        <c:set  value="${house}" var="h"></c:set>
            <div class="section-padding" style="margin-top: 5%">

                <div class="container">
                    <div class="product-info row">
                        <div class="col-lg-8 col-md-12 col-xs-12">
                            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <input type="hidden" name="rentEntityId" value="${c.rentEntityId}">
                                <div class="carousel-item active">
                                    <img class="d-block w-100" src="${c.image}" alt="First slide" style="width:100%;height: 500px">
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block w-100" src="${houseMap[c.houseId].image}" alt="Second slide" style="width:100%;height: 500px">
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                        <div class="details-box">
                            <div class="ads-details-info">
                                <h2>${c.name} - ${h.name}</h2>
                                <div class="details-meta">
                                    <span><i class="fa-solid fa-clock"></i> ${c.createTime}</span>
                                </div>
                                <p class="mb-4">${c.description}</p>
                                <h6>Price: <span   style="color: red">${c.price} VND</span></h6>
                                <p class="mb-4"><i class="fa-solid fa-chart-area"></i>${c.area} m&sup2;</p>
                                <h4 class="title-small mb-3">Facility:</h4>
                                <ul class="list-specification">
                                    <li><i class="fa-solid fa-toilet"></i> 1 nhà vệ sinh</li>
                                    <li><i class="fa-solid fa-bed"></i> 1 phòng ngủ</li>
                                    <li><i class="fa-solid fa-shield-halved"></i> An ninh 24/7</li>
                                    <li><i class="fa-solid fa-square-parking"></i>  Parking</li>
                                </ul>
                                <h5>View on Google Map</h5>

                                <iframe
                                    width="100%"
                                    height="200"
                                    frameborder="0"
                                    style="border:0"
                                    src="${h.map}"
                                    allowfullscreen
                                    ></iframe>
                            </div>

                        </div> 
                    </div>
                    <div class="col-lg-4 col-md-6 col-xs-12">

                        <aside class="details-sidebar">
                            <div class="widget">
                                <h4 class="widget-title">Rent Posted By</h4>
                                <div class="agent-inner">
                                    <div class="agent-title">
                                        <div class="agent-photo">
                                            <a href="#"><img src="${userMap[c.updateBy].image}" alt=""></a>
                                        </div>

                                        <div class="agent-details">
                                            <h3><a href="#" style="text-decoration: none">${userMap[c.updateBy].fullname}</a></h3>
                                            <span><i class="fa-solid fa-phone"></i>${userMap[c.updateBy].phone}</span><br>
                                            <span><i class="fa-regular fa-envelope"></i>${userMap[c.updateBy].email}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <form action="detailrent?rentEntityId=${c.rentEntityId}" method="post">
                                <c:if test="${user.role == 1 or user.role == null}">
                                    <div class="widget" style="background-color: #f7f7f7; padding: 20px; border-radius: 5px;">
                                        <c:if test="${not empty success}">
                                            <h1>Request Successful! &#x1F44D;</h1>
                                            <p>${success} &#x1F389;</p>
                                        </c:if>
                                        <c:if test="${ c.depositBy == null and empty success}">
                                            <h4 class="widget-title">Rental Information</h4>
                                            <c:set value="${userinfo}" var="us"></c:set>
                                            <input type="hidden" name="username" value="${us.username}">
                                            <div class="mb-3">
                                                <label for="fullname" class="form-label">Full Name:</label>
                                                <input type="text" class="form-control" id="fullname" name="fullname" value="${us.fullname}" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="email" class="form-label">Email:</label>
                                                <input type="email" class="form-control" id="email" name="email" value="${us.email}" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="phone" class="form-label">Phone Number:</label>
                                                <input type="tel" class="form-control" id="phone" name="phone" value="${us.phone}" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="citizenNumber" class="form-label">Citizen Number:</label>
                                                <input type="text" class="form-control" id="citizenNumber" name="citizenNumber" value="${us.citizenNumber}"  required>
                                            </div>
                                            <c:if test="${not empty error}">
                                                <div><h2 class="text-danger">${error} &#x274C;</h2></div>
                                            </c:if>
                                            <button type="submit" class="btn btn-send" name="send" style=" background-color:#e91e63; margin-left: 40%;color: #fff">Send Now</button>
                                        </c:if>
                                    </div>
                                </c:if>
                            </form>
                        </aside>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../Views/footer.jsp"></jsp:include>
    </body>
</html>
