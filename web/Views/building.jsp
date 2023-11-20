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
        <title>Admin</title>
        <!-- Custom fonts for this template-->
        <link href="../Resource/css/all.min.css" rel="stylesheet" type="text/css">
        <script src="https://kit.fontawesome.com/c203902cd2.js" crossorigin="anonymous"></script>
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="../Resource/css/sb-admin-2.min.css" rel="stylesheet">
        <script type="text/javascript">
            function doDelete(id) {
                let status = confirm("Are you sure to delete Building with id = " + id);
                console.log(status);
                if (status === true) {
                    console.log("Delete confirmed");
                    window.location = "delete?name=building&buildingId=" + id;
                } else {
                    console.log("Delete canceled");
                    return false;
                }
            }
        </script>
    </head>

    <body id="page-top">
        <!-- Begin Page Content -->
        <div class="container-fluid">
            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">List of Building</h1>


            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex">
                    <h6 class="m-0 font-weight-bold text-primary" style="flex: 1">Manage Building</h6>
                    <a href="uploadbuilding" class="end text-right font-weight-bold text-primary"><i class="fa-solid fa-plus"></i>Add New Building/Apartment</a>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Num</th>
                                    <th>Name</th>
                                    <th>Address</th>
                                    <th>Status</th>
                                    <th>Actions</th> 
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.listBuilding}" var="u" varStatus="loop" begin='${page3.begin}' end='${page3.end-1}'>
                                    <tr class="highlight-row">
                                        <td>${loop.index + 1}</td>
                                        <td>${u.name}</td>
                                        <td>${u.address}</td>
                                        <c:choose>
                                            <c:when test="${u.status == 0}">
                                                <td><span class="status text-primary">&bull;</span> Pending</td>
                                            </c:when>
                                            <c:when test="${u.status == 1}">
                                                <td><span class="status text-success">&bull;</span> Available</td>
                                            </c:when>
                                        </c:choose>
                                        <td>
                                            <a href="updatebuilding?buildingId=${u.buildingId}" class="text-warning"><i class="fa-solid fa-pen-to-square"></i> Edit</a>&nbsp;
                                            <a href="delete?name=building&buildingId=${u.buildingId}" onclick="return doDelete('${u.buildingId}')" class="text-danger"><i class="fa-solid fa-trash"></i> Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="d-flex justify-content-center">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <c:if test="${page3.index != 0}">
                                    <li class="page-item">
                                        <a class="page-link" href="manageadmin?showBuilding=true&index=${page3.index - 1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:forEach var="i" begin="${page3.pageStart}" end="${page3.pageEnd}">
                                    <li class="page-item">
                                        <a class="page-link" href="manageadmin?showBuilding=true&index=${i}">${i + 1}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${page3.index < page3.totalPage - 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="manageadmin?showBuilding=true&index=${page3.index + 1}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>

        </div>


    </body>

</html>