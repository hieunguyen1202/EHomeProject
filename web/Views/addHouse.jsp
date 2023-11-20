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
        <title>Add New House</title>
        <!-- Include Bootstrap CSS -->
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
                        <a href="${us.role == 0 ? 'manageadmin?showHouse=true' : (us.role == 2 ? 'manageowner?showHouse=true' : '')}">
                            <img src="images/logo.png" alt="alt" width="70px" height="70px"/>
                        </a>
                    </div>
                    <div class="col-lg-6 text-right" style="margin-top: 1%">
                        <img src="${us.image}" alt="User Profile Image" width="50px" height="50px" style="border-radius: 50%">                    
                        <span>${us.fullname}</span>
                    </div>
                </div>
            </div>
        </header>
        <div class="container">
            <h2 class="text-center mt-3">Add New House</h2>
            <form action="uploadhouse" method="POST"  enctype="multipart/form-data">
                <div class="row" style="background-color: #F6F4EB;border-radius: 10px;padding: 20px">
                    <!-- Left Half -->
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="name">House Name:</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>

                        <div class="form-group">
                            <label for="wardId">Ward:</label>
                            <select class="form-control" id="wardId" name="wardId">
                                <option value="0">Select a ward</option> <!-- Add a default "Select" option -->
                                <c:forEach items="${wardMap}" var="wardEntry">
                                    <c:if test="${wardEntry.key != 0}"> <!-- Exclude the option with key 0 -->
                                        <option value="${wardEntry.key}">${wardEntry.value.name}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>


                        <div class="form-group">
                            <label for="address">Address:</label>
                            <textarea class="form-control" id="address" name="address" rows="3"></textarea>
                        </div>


                        <div class="form-group">
                            <label for="status">Status:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="pending" class="form-check-input" name="status" value="1" checked>
                            <label class="form-check-label" for="pending">Pending</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="available" class="form-check-input" name="status" value="2">
                            <label class="form-check-label" for="available">Available</label>
                        </div>

                    </div>

                    <!-- Right Half -->
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="houseTypeId">House Type:</label>
                            <select class="form-control" id="houseTypeId" name="houseTypeId">
                                <option value="0">Select a house type</option> <!-- Add a default "Select" option -->
                                <c:forEach items="${houseTypeMap}" var="houseTypeMapEntry">
                                    <c:if test="${houseTypeMapEntry.key != 0}"> <!-- Exclude the option with key 0 -->
                                        <option value="${houseTypeMapEntry.key}">${houseTypeMapEntry.value.name}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="map">Map:</label>
                            <input type="text" class="form-control" id="map" name="map" placeholder="please input url map">
                        </div>

                        <div class="form-group">
                            <label for="buildingId">Building:</label>
                            <select class="form-control" id="buildingId" name="buildingId">
                                <option value="0">Select a building</option> <!-- Add a default "Select" option -->
                                <c:forEach items="${buildingMap}" var="buildingMapEntry">
                                    <c:if test="${buildingMapEntry.key != 0}"> <!-- Exclude the option with key 0 -->
                                        <option value="${buildingMapEntry.key}">${buildingMapEntry.value.name}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="image">Image:</label>
                            <input type="file" class="form-control-file" id="image" name="image">
                        </div>

                    </div>
                    <div><h2 class="text-success">${requestScope.success}</h2>
                        <div><h2 class="text-danger">${requestScope.error}</h2></div>
                        <div class="text-center mt-3" style="width: 75vw">
                            <button type="submit" class="btn btn-primary">Add House</button>
                        </div>
                    </div>
            </form>
        </div>      
    </body>

</html>