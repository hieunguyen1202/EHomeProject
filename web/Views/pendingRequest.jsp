<%-- 
    Document   : pendingRequest
    Created on : Oct 22, 2023, 2:10:59 AM
    Author     : Hieu
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../Resource/css/all.min.css" rel="stylesheet" type="text/css">
        <script src="https://kit.fontawesome.com/c203902cd2.js" crossorigin="anonymous"></script>
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link href="../Resource/css/sb-admin-2.min.css" rel="stylesheet">
        <script>
            function scheduleUpdate() {
                setTimeout(function () {
                    // Code to submit the form after 30 seconds
                    document.getElementById("myForm").submit();
                }, 30000); // 30 seconds
            }
        </script>
    </head>
    <body>
        <div class="container-fluid" style="margin-top: 5%">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex">Pending Request
                </div>
                <div class="row">
                    <div class="col-md-6" style="margin-top: 4px">
                        <form id="myForm" action="manageowner" method="post" onclick="scheduleUpdate()">
                            <c:forEach items="${rentEntityDeposit}" var="c">
                                <div class="card" style="padding: 0px;background-color: #F5F7F8">
                                    <div class="card-body" style="padding: 1px;margin: 8px;">   
                                        <div style="display: flex">
                                            <div style="margin-right: 5%">
                                                <h5 class="card-title">Owner's Information</h5>
                                                <input type="hidden" name="rentEntityId" value="${c.rentEntityId}">
                                                <input type="hidden" name="username" value="${userMap[c.depositBy].username}">
                                                <ul class="list-unstyled">
                                                    <li><strong>Name:</strong> ${userMap[c.depositBy].fullname}</li>
                                                    <li><strong>Email:</strong>  ${userMap[c.depositBy].email}</li>
                                                    <li><strong>Phone:</strong>  ${userMap[c.depositBy].phone}</li>
                                                </ul>
                                            </div>
                                            <div style="margin-top: -5%;margin-left: 2%">
                                                <h5 class="card-title mt-4">Rental Information</h5>
                                                <ul class="list-unstyled">
                                                    <li><strong>Name:</strong> ${houseMap[c.houseId].name}</li>
                                                    <li><strong>Room Name:</strong> ${c.name}</li>
                                                    <li><strong>Price: </strong><span style="color: red">${c.price} VND</span></li>
                                                </ul>
                                                <button type="button" class="btn btn-outline-warning" style="background-color: #03a9f4" name="action" value="phone"><i class="fa-solid fa-phone"></i></button>
                                                <button type="button" class="btn btn-outline-info" name="action" style="background-color: #00e676" value="mail"><i class="fa-regular fa-envelope"></i></button>
                                                    <c:if test="${empty success}">
                                                    <button type="submit" class="btn btn-danger" name="reject" title="Reject"><i class="fa-solid fa-xmark"></i></button>
                                                    <button type="submit" class="btn btn-success" name="accept" title="Accecpt"><i class="fa-solid fa-check"></i></button>
                                                    </c:if>
                                                <button type="button" class="btn btn-outline-info" style="background-color: #f4b619" title="View">
                                                    <a target="_blank"  href="detailrent?rentEntityId=${c.rentEntityId}" style="text-decoration: none">
                                                        <i class="fa-regular fa-eye"></i>
                                                    </a>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
