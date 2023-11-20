<%-- 
    Document   : profile
    Created on : Oct 9, 2023, 7:43:18 PM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/c203902cd2.js" crossorigin="anonymous"></script>
        <!--        <link rel="stylesheet" href="../Resource/css/profile.css"/>-->
        <title>Profile</title>
        <style>
            .labels{
                margin-top: 1%;
            }
            #tg-photogallery{
                display: none;
            }
        </style>
    </head>
    <c:set var="c" value="${profile}"></c:set>
        <body style="background-color: #6499E9;overflow-y: hidden;">
            <div class="container rounded bg-white mt-5 mb-5">
                <div>
                    <button type="button" style="border: none;background-color: white;padding: 10px">
                        <a href="list"><i class="fa-solid fa-house" style="color:#6499E9; font-size: 30px;"></i></a>
                    </button>
                </div>
                <div class="row">
                    <div class="col-md-3 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                            <img class="rounded-circle mt-5" width="150px" src="${c.image}" alt="Profile Image">    
                        <span class="font-weight-bold">${c.fullname}</span>
                        <span class="text-black-50">${c.email}</span>
                    </div>
                </div>
                <div class="col-md-9 border-right">
                    <form action="updateprofile" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="username" value="${c.username}">
                        <div class="p-5 py-8">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Profile Settings</h4>
                            </div>

                            <div class="col-md-12">
                                <label class="labels">Full Name</label>
                                <input type="text" class="form-control" name="fullname" placeholder="Full Name" pattern="^[A-Za-z-' ]+$" value="${c.fullname}">
                            </div>

                            <div class="col-md-12">
                                <label class="labels">Email</label>
                                <input type="email" class="form-control" name="email" placeholder="Email" value="${c.email}">
                            </div>

                            <div class="col-md-12">
                                <label class="labels">Phone Number</label>
                                <input type="tel" class="form-control" name="phone" placeholder="Phone Number" pattern="[0]{1}[1-9]{9}" value="${c.phone}">
                            </div>

                            <div class="col-md-12">
                                <label class="labels">Gender</label>
                                <input type='radio' name='gender' value='M' ${c.isGender() ? 'checked' : ''} checked> Male
                                <input type='radio' name='gender' value='F' ${!c.isGender() ? 'checked' : ''}> Female
                            </div>  
                            <div class="col-md-12">
                                <label class="tg-fileuploadlabel" for="tg-photogallery">Profile Picture:
                                    <span class="btn btn-common" style="background-color: pink">Select Files</span>
                                    <input type="file" id="tg-photogallery" class="form-control-file" id="image" name="image" value="${c.image}">     
                                </label>
                            </div> 
                            <div class="col-md-12">
                                <label class="labels">Date of Birth</label>
                                <input type="date" name="dob" value="${c.dob}">
                            </div>

                            <div class="col-md-12">
                                <label class="labels">Citizen Number</label>
                                <input type="tel" class="form-control" name="citizenNumber" placeholder="Citizen Number" pattern="[0-9]{9,12}" value="${c.citizenNumber}">
                            </div>

                            <div class="col-md-12">
                                <label class="labels">Citizen Number Date</label>
                                <input type="date" name="citizenNumberDate" value="${c.citizenNumberDate}">
                            </div>

                            <div class="mt-5 text-center">
                                <button class="btn btn-danger profile-button" type="button"><a href="list" style="color:white;text-decoration: none">Close</button>
                                &nbsp;
                                <button class="btn btn-primary profile-button" type="submit">Save Profile</button>
                            </div>
                            <c:if test="${notice!=null}">
                                <p style="color: greenyellow;font-style:italic;margin-top: -4%;font-size: 20px">${notice}</p>                                       
                            </c:if>
                            <c:if test="${error!=null}">
                                <p style="color: red;font-style:italic;margin-top: -4%;font-size: 20px">${error}</p>                                       
                            </c:if>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
