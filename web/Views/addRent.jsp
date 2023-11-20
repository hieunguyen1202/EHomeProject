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
        <title>Add New Rental</title>
        <style>
            #tg-photogallery{
                display: none;
                margin-top: 2px
            }
        </style>
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
                        <a href="${us.role == 0 ? 'manageadmin?showRent=true' : (us.role == 2 ? 'manageowner?showRent=true' : '')}">
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
            <h2 class="text-center mt-3">Add New Rental</h2>
            <form action="uploadrent" method="POST"  enctype="multipart/form-data">
                <div class="row" style="background-color: #F6F4EB;border-radius: 10px;padding: 20px">
                    <!-- Left Half -->
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="name">Rent Name:</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="description">Description:</label>
                            <input type="text" class="form-control" id="description" name="description" value="">
                        </div>
                        <div class="form-group">
                            <label for="rentTypeId">Rent Type:</label>
                            <select class="form-control" id="rentTypeId" name="rentTypeId">
                                <option value="0">Select a type</option>
                                <c:forEach items="${rentMap}" var="rentEntry">
                                    <c:if test="${rentEntry.key != 0}">
                                        <option value="${rentEntry.key}">${rentEntry.value.name}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="houseId">House:</label>
                            <select class="form-control" id="houseId" name="houseId">
                                <option value="0">Select a house</option>
                                <c:forEach items="${houseMap}" var="houseMapEntry">
                                    <c:if test="${houseMapEntry.key != 0}">
                                        <option value="${houseMapEntry.key}">${houseMapEntry.value.name}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>    
                        <div class="form-group">
                            <label for="status">Status:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <c:if test="${us.role == 0}">
                                <input type="radio" id="reject" class="form-check-input" name="status" value="0">
                                <label class="form-check-label" for="pending">Reject</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:if>
                            <input type="radio" id="pending" class="form-check-input" name="status" value="1" checked>
                            <label class="form-check-label" for="available">Pending</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="available" class="form-check-input" name="status" value="2">
                            <label class="form-check-label" for="available">Available</label>
                        </div>

                    </div>

                    <!-- Right Half -->
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="price">Price:</label>
                            <input type="text" class="form-control" id="price" name="price" rows="3" value="" required>
                        </div>
                        <div class="form-group">
                            <label for="area">Area:</label>
                            <input type="text" class="form-control" id="area" name="area" rows="3" value="">
                        </div>
                        <div class="form-group">
                            <label for="maxPeople">Max People:</label>
                            <input type="number" class="form-control" id="maxPeople" name="maxPeople" rows="3" min=1 max=10 value="" required>
                        </div>
                        <div class="form-group">
                            <label class="tg-fileuploadlabel" for="tg-photogallery">Profile Picture:
                                <span class="btn btn-common" style="background-color: pink">Select Files</span>
                                <input type="file" id="tg-photogallery" class="form-control-file" id="image" name="image" value="" required>     
                            </label>
                        </div> 
                    </div>
                    <div><h2 class="text-success">${requestScope.success}</h2>
                        <div><h2 class="text-danger">${requestScope.error}</h2></div>
                        <div class="text-center mt-3" style="width: 75vw">
                            <button type="submit" class="btn btn-primary">Add Rental</button>
                        </div>
                    </div>
            </form>
        </div>
    </div>
</body>

</html>