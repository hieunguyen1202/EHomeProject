<%-- 
    Document   : addHouse
    Created on : Oct 15, 2023, 12:53:50 AM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Add New Facility</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <header class="text-white" style="background-color: #B6FFFA;   position: -webkit-sticky;
                position: sticky;
                top: 0;">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <c:set value="${sessionScope.user}" var="us"></c:set>
                        <a href="${us.role == 0 ? 'manageadmin?showFacility=true' : (us.role == 2 ? 'manageowner?showFacility=true' : '')}">
                            <img src="images/logo.png" alt="alt" width="70px" height="70px"/>
                        </a>
                    </div>
                    <div class="col-lg-6 text-right" style="margin-top: 1%">
                        <img src="${us.image}" alt="User Profile Image" width="50px" height="50px" style="border-radius: 50%">                    
                        <span>${us.fullname}</span>
                    </div>
                    </header>
                    <div class="container">
                        <h2 class="text-center mt-3">Add Facility</h2>
                        <form action="uploadfacility" method="POST" >
                            <div class="row">
                                <!-- Left Half -->
                                <div class="col-lg-3"></div>
                                <div class="col-lg-6"  style="background-color: #F6F4EB;border-radius: 10px;padding: 20px">
                                    <div class="form-group">
                                        <label for="name">Facility Name:</label>
                                        <input type="text" class="form-control" id="name" name="name" required>
                                        <label for="icon">Icon Facility:</label>
                                        <input type="text"  class="form-control"  name="icon">
                                        <div class="form-group" style="margin-top: 6%">
                                            <label for="status">Status:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <input type="radio" id="pending" class="form-check-input" name="status" value="1" checked>
                                            <label class="form-check-label" for="pending">Pending</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <input type="radio" id="available" class="form-check-input" name="status" value="2">
                                            <label class="form-check-label" for="available">Available</label>
                                        </div>
                                        <div><h2 class="text-success">${requestScope.success}</h2>
                                            <div><h2 class="text-danger">${requestScope.error}</h2>
                                                <div class="text-center mt-3">
                                                    <button type="submit" class="btn btn-primary">Add Facility</button>
                                                </div>
                                            </div>

                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3"></div>
                            </div>

                            <!-- Include Bootstrap JS (Optional) -->
                            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
                            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                            </body>

                            </html>