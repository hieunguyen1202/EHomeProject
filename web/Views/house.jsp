<%-- 
    Document   : building
    Created on : Oct 13, 2023, 12:35:15 AM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>House</title>
        <link href="../Resource/css/all.min.css" rel="stylesheet" type="text/css">
        <script src="https://kit.fontawesome.com/c203902cd2.js" crossorigin="anonymous"></script>
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link href="../Resource/css/sb-admin-2.min.css" rel="stylesheet">
        <style>
            /* Define a CSS class for row highlighting */
            .highlight-row:hover {
                background-color: #f0f0f0; /* Change to the desired background color */
                cursor: pointer;
            }
        </style>
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("are U sure to delete House with id = " + id)) {
                    window.location = "delete?name=house&houseId=" + id;
                }
            }
        </script>
    </head>

    <body id="page-top">
        <!-- Begin Page Content -->
        <div class="container-fluid">
            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">List of House</h1>
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex">
                    <h6 class="m-0 font-weight-bold text-primary" style="flex: 1">Manage House</h6>
                    <a href="uploadhouse" class="end text-right font-weight-bold text-primary"><i class="fa-solid fa-plus"></i>Add New House</a>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Num</th>
                                    <th>Name</th>
                                    <th>House Type</th>
                                    <th>Address</th>
                                    <th>Owner</th>
                                    <th>Status</th>
                                    <th>Actions</th> 
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${house}" var="u" varStatus="loop" begin='${page1.begin}' end='${page1.end-1}'>
                                    <tr class="highlight-row">
                                        <td>${loop.index + 1}</td>
                                        <td>${u.name}</td>
                                        <td>${empty houseTypeMap[u.houseTypeId] ? 'None' : houseTypeMap[u.houseTypeId].name}</td>
                                        <td>${u.address}</td>
                                        <td>${empty userMap[u.ownerId] ? 'None' : userMap[u.ownerId].username}</td>                                    
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
                                            <a href="updatehouse?houseId=${u.houseId}" class="text-warning"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
                                            <br>   <a href="delete?name=house&houseId=${u.houseId}"  onclick="doDelete('${u.houseId}')" class="text-danger"><i class="fa-solid fa-trash"></i> Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="d-flex justify-content-center">
                        <nav aria-label="Page navigation example">
                           <ul class="pagination">
                                    <c:if test="${user.role == 0 || user.role == 2}">
                                        <c:if test="${page4.index != 0}">
                                            <li class="page-item">
                                                <a class="page-link" href="${user.role == 0 ? 'manageadmin?showHouse=true&index=' : 'manageowner?showHouse=true&index='}${page4.index - 1}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:forEach var="i" begin="${page4.pageStart}" end="${page4.pageEnd}">
                                            <li class="page-item">
                                                <a class="page-link" href="${user.role == 0 ? 'manageadmin?showHouse=true&index=' : 'manageowner?showHouse=true&index='}${i}">${i + 1}</a>
                                            </li>
                                        </c:forEach>
                                        <c:if test="${page4.index < page4.totalPage - 1}">
                                            <li class="page-item">
                                                <a class="page-link" href="${user.role == 0 ? 'manageadmin?showHouse=true&index=' : 'manageowner?showHouse=true&index='}${page4.index + 1}" aria-label="Next">
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
    </body>
</html>