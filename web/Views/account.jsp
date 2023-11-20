<%-- 
    Document   : account
    Created on : Oct 12, 2023, 11:56:38 AM
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
        <!--        <link
                    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
                    rel="stylesheet">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/css/bootstrap.min.css">
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/js/bootstrap.bundle.min.js"></script>-->

        <link href="../Resource/css/sb-admin-2.min.css" rel="stylesheet">
        <!--        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>-->
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("are U sure to delete User with id = " + id)) {
                    window.location = "delete?name=users&username=" + id;
                }
            }
        </script>
    </head>

    <body id="page-top">
        <!-- Begin Page Content -->
        <div class="container-fluid">
            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">List of accounts</h1>


            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex">
                    <h6 class="m-0 font-weight-bold text-primary" style="flex: 1">Manage Account</h6>
                    <a href="#addUser" class="btn btn-success" data-toggle="modal" data-target="#addUser">
                        <i class="fa-solid fa-user-plus"></i> <span>Add New User</span>
                    </a>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Num</th>
                                    <th>Username</th>
                                    <th>Full Name</th>
                                    <th>Gender</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Role</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.listuser}" var="u" varStatus="loop" begin='${page.begin}' end='${page.end-1}'>
                                    <tr class="highlight-row">
                                        <td>${loop.index + 1}</td>
                                        <td>${u.username}</td>
                                        <td>${u.fullname}</td>
                                        <td>${u.isGender() ? 'Male' : 'Female'}</td>
                                        <td>${u.email}</td>
                                        <td>${u.phone}</td>
                                        <c:choose>
                                            <c:when test="${u.role == 0}">
                                                <td class="text-danger">Admin</td>
                                            </c:when>
                                            <c:when test="${u.role == 1}">
                                                <td class="text-success">Renter</td>
                                            </c:when>
                                            <c:when test="${u.role == 2}">
                                                <td class="text-primary">Owner</td>
                                            </c:when>
                                        </c:choose>
                                        <td>
                                            <a href="" class="text-warning" data-toggle="modal" data-target="#updateRole"><i class="fa-solid fa-pen-to-square"></i></a>&nbsp;
                                            <a href="delete?name=users&username=${u.username}"  onclick="doDelete('${u.username}')" class="text-danger"><i class="fa-solid fa-trash"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                        <div class="d-flex justify-content-center">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <c:if test="${page.index != 0}">
                                        <li class="page-item">
                                            <a class="page-link" href="manageadmin?showAccount=true&index=${page.index - 1}" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:forEach var="i" begin="${page.pageStart}" end="${page.pageEnd}">
                                        <li class="page-item">
                                            <a class="page-link" href="manageadmin?showAccount=true&index=${i}">${i + 1}</a>
                                        </li>
                                    </c:forEach>
                                    <c:if test="${page.index < page.totalPage - 1}">
                                        <li class="page-item">
                                            <a class="page-link" href="manageadmin?showAccount=true&index=${page.index + 1}" aria-label="Next">
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