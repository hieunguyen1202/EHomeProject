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
        <title>Update Rent</title>
        <!-- Include Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            #tg-photogallery{
                display: none;
            }
        </style>
    </head>
    <body>
        <c:set  value="${rent}" var="c"></c:set>
            <header class="text-white" style="background-color: #B6FFFA;   position: -webkit-sticky;
                    position: sticky;
                    top: 0;">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                        <c:set value="${sessionScope.user}" var="us"></c:set>
                        <a href="${us.role == 0 ? 'manageadmin?showRent=true' : (us.role == 2 ? 'manageowner?showRent=true' : '')}">
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
            <h2 class="text-center mt-3">Update Rent</h2>
            <form action="updaterent" method="POST"  enctype="multipart/form-data">
                <input type="hidden" name="rentEntityId" value="${c.rentEntityId}">
                <div class="row" style="background-color: #F6F4EB;border-radius: 10px;padding: 20px">
                    <!-- Left Half -->
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="name">Rent Name:</label>
                            <input type="text" class="form-control" id="name" name="name" value="${c.name}">
                        </div>
                        <div class="form-group">
                            <label for="description">Description:</label>
                            <input type="text" class="form-control" id="description" name="description" value="${c.description}">
                        </div>

                        <div class="form-group">
                            <label for="rentTypeId">Rent Type:</label>
                            <select class="form-control" id="rentTypeId" name="rentTypeId">
                                <option value="0">Select a type</option>
                                <c:forEach items="${rentMap}" var="rentEntry">
                                    <c:if test="${rentEntry.key != 0}">
                                        <option value="${rentEntry.key}" ${rentEntry.key == c.rentTypeId ? 'selected' : ''}>${rentEntry.value.name}</option>
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
                                        <option value="${houseMapEntry.key}" ${houseMapEntry.key == c.houseId ? 'selected' : ''}>${houseMapEntry.value.name}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>               
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="price">Price:</label>
                            <input type="text" class="form-control" id="price" name="price" rows="3" value="${c.price}">
                        </div>
                        <div class="form-group">
                            <label for="area">Area:</label>
                            <input type="text" class="form-control" id="area" name="area" rows="3" value="${c.area}">
                        </div>
                        <div class="form-group">
                            <label for="maxPeople">Max People:</label>
                            <input type="number" class="form-control" id="maxPeople" name="maxPeople" rows="3" min=1 max=10 value="${c.maxPeople}">
                        </div>
                        <div class="form-group">
                            <label class="tg-fileuploadlabel" for="tg-photogallery">Profile Picture:
                                <span class="btn btn-common" style="background-color: pink">Select Files</span>
                                <input type="file" id="tg-photogallery" class="form-control-file" id="image" name="image" value="${c.image}">     
                            </label>
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
                        <div> <h2 class="text-success">${requestScope.success}</h2></div>
                        <div><h2 class="text-danger">${requestScope.error}</h2></div>
                    </div>
                    <div class="text-center mt-3" style="width: 75vw">
                        <button type="submit" class="btn btn-primary">Update Rent</button>
                    </div>
                </div>
            </form>
        </div>
    </body>

</html>