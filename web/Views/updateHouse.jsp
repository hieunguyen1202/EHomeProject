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
        <title>Update House</title>
        <!-- Include Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <c:set  value="${house}" var="c"></c:set>
            <header class="text-white" style="background-color: #B6FFFA;   position: -webkit-sticky;
                    position: sticky;
                    top: 0;">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                        <c:set value="${sessionScope.user}" var="us"></c:set>
                        <a href="${us.role == 0 ? 'manageadmin?showHouse=true' : (us.role == 2 ? 'manageowner?showHouse=true' : '')}">
                            <img src="images/logomain.png" alt="alt" width="70px" height="70px"/>

                        </a>

                    </div>
                    <div class="col-lg-6 text-right" style="margin-top: 1%">
                        <img src="${us.image}" alt="User Profile Image" width="50px" height="50px" style="border-radius: 50%">                    
                        <span>${us.fullname}</span>
                    </div>
                </div>
        </header>
        <div class="container">
            <h2 class="text-center mt-3">Update House</h2>
            <form action="updatehouse" method="POST"  enctype="multipart/form-data">
                <input type="hidden" name="houseId" value="${c.houseId}">
                <div class="row" style="background-color: #F6F4EB;border-radius: 10px;padding: 20px">
                    <!-- Left Half -->
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="name">House Name:</label>
                            <input type="text" class="form-control" id="name" name="name" value="${c.name}" required>
                        </div>

                        <div class="form-group">
                            <label for="wardId">Ward:</label>
                            <select class="form-control" id="wardId" name="wardId">
                                <option value="0">Select a ward</option>
                                <c:forEach items="${wardMap}" var="wardEntry">
                                    <c:if test="${wardEntry.key != 0}">
                                        <option value="${wardEntry.key}" ${wardEntry.key == c.wardId ? 'selected' : ''}>${wardEntry.value.name}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>


                        <div class="form-group">
                            <label for="address">Address:</label>
                            <input type="text" class="form-control" id="address" name="address" rows="3" value="${c.address}">
                        </div>


                        <div class="form-group">
                            <label for="status">Status:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <c:if test="${us.role == 0}">
                                <input type="radio" id="reject" class="form-check-input" name="status" value="0" ${c.status == 0 ? 'checked' : ''}>
                                <label class="form-check-label" for="pending">Reject</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:if>
                            <input type="radio" id="pending" class="form-check-input" name="status" value="1" ${c.status == 1 ? 'checked' : ''}>
                            <label class="form-check-label" for="available">Pending</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="available" class="form-check-input" name="status" value="2" ${c.status == 2 ? 'checked' : ''}>
                            <label class="form-check-label" for="available">Available</label>
                        </div>

                    </div>

                    <!-- Right Half -->
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="houseTypeId">House Type:</label>
                            <select class="form-control" id="houseTypeId" name="houseTypeId">
                                <option value="0">Select a house type</option>
                                <c:forEach items="${houseTypeMap}" var="houseTypeMapEntry">
                                    <c:if test="${houseTypeMapEntry.key != 0}">
                                        <option value="${houseTypeMapEntry.key}" ${houseTypeMapEntry.key == c.houseTypeId ? 'selected' : ''}>${houseTypeMapEntry.value.name}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="map">Map:</label>
                            <input type="text" class="form-control" id="map" name="map" value="${c.map}" placeholder="please input url map">
                        </div>

                        <div class="form-group">
                            <label for="buildingId">Building:</label>
                            <select class="form-control" id="buildingId" name="buildingId">
                                <option value="0">Select a building</option>
                                <c:forEach items="${buildingMap}" var="buildingMapEntry">
                                    <c:if test="${buildingMapEntry.key != 0}">
                                        <option value="${buildingMapEntry.key}" ${buildingMapEntry.key == c.buildingId ? 'selected' : ''}>${buildingMapEntry.value.name}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="image">Image:</label>
                            <input type="file" class="form-control-file" id="image" name="image">
                        </div>

                    </div>
                    <div>
                        <div> <h2 class="text-success">${requestScope.success}</h2></div>
                        <div><h2 class="text-danger">${requestScope.error}</h2></div>
                        <div class="text-center mt-3" style="width: 75vw">
                            <button type="submit" class="btn btn-primary">Update House</button>
                        </div>
                    </div>
            </form>
        </div>

        <!-- Include Bootstrap JS (Optional) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>

</html>