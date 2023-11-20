<%-- 
    Document   : rent
    Created on : Oct 20, 2023, 3:36:05 PM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../Resource/css/all.min.css" rel="stylesheet" type="text/css">
        <script src="https://kit.fontawesome.com/c203902cd2.js" crossorigin="anonymous"></script>
        <link href="../Resource/css/sb-admin-2.min.css" rel="stylesheet">
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("are U sure to delete RentEntity with id = " + id)) {
                    window.location = "delete?name=rentEntity&rentEntityId=" + id;
                }
            }
        </script>
        <title>JSP Page</title>
    </head>
    <body id="page-top">
        <!-- Begin Page Content -->
        <div class="container-fluid">
            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">List of Rental</h1>
            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex">
                    <h6 class="m-0 font-weight-bold text-primary" style="flex: 1">Manage Rental</h6>
                    <a href="uploadrent" class="end text-right font-weight-bold text-primary"><i class="fa-solid fa-plus"></i>Add New Room</a>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Num</th>
                                    <th>Name</th>
                                    <th>Rent Type</th>
                                    <th>Name House</th>
                                    <th>Price</th>
                                    <th>Area</th>
                                    <th>Deposit By</th>
                                    <th>Status</th>
                                    <th>Actions</th> 
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${rentEntity}" var="u" varStatus="loop" begin='${page4.begin}' end='${page4.end-1}'>
                                    <tr class="highlight-row">
                                        <td>${loop.index + 1}</td>
                                        <td>${u.name}</td>
                                        <td>${empty rentMap[u.rentTypeId] ? 'None' : rentMap[u.rentTypeId].name}</td>
                                        <td>${empty houseMap[u.houseId] ? 'None' : houseMap[u.houseId].name}</td>                                    
                                        <td>${u.price} VND</td>
                                        <td>${u.area} m&sup2;</td>
                                        <td>${empty userMap[u.depositBy] ? 'None' : userMap[u.depositBy].username}</td>
                                        <c:choose>
                                            <c:when test="${u.status == 0}">
                                                <!--<td class="text-danger">Reject</td>-->
                                                <td><span class="status text-danger">&bull;</span> Reject</td>   
                                            </c:when>
                                            <c:when test="${u.status == 1}">
                                                <!--<td class="text-primary">Pending</td>-->
                                                <td><span class="status text-primary">&bull;</span> Pending</td>
                                            </c:when>
                                            <c:when test="${u.status == 2}">
                                                <td><span class="status text-success">&bull;</span> Available</td>
                                                <!--<td class="text-success">Available</td>-->
                                            </c:when>
                                        </c:choose>
                                        <td>
                                            <a href="updaterent?rentEntityId=${u.rentEntityId}" class="text-warning"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
                                            <br>   <a href="delete?name=rentEntity&rentEntityId=${u.rentEntityId}"  onclick="doDelete('${u.rentEntityId}')" class="text-danger"><i class="fa-solid fa-trash"></i> Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <c:if test="${user.role == 0 || user.role == 2}">
                                        <c:if test="${page4.index != 0}">
                                            <li class="page-item">
                                                <a class="page-link" href="${user.role == 0 ? 'manageadmin?showRent=true&index=' : 'manageowner?showRent=true&index='}${page4.index - 1}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:forEach var="i" begin="${page4.pageStart}" end="${page4.pageEnd}">
                                            <li class="page-item">
                                                <a class="page-link" href="${user.role == 0 ? 'manageadmin?showRent=true&index=' : 'manageowner?showRent=true&index='}${i}">${i + 1}</a>
                                            </li>
                                        </c:forEach>
                                        <c:if test="${page4.index < page4.totalPage - 1}">
                                            <li class="page-item">
                                                <a class="page-link" href="${user.role == 0 ? 'manageadmin?showRent=true&index=' : 'manageowner?showRent=true&index='}${page4.index + 1}" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
