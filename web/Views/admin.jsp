<%-- 
    Document   : admin
    Created on : Oct 11, 2023, 11:19:31 PM
    Author     : Hieu
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Custom fonts for this template-->
        <link href="Resource/css/all.min.css" rel="stylesheet" type="text/css">
        <script src="https://kit.fontawesome.com/c203902cd2.js" crossorigin="anonymous"></script>
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="Resource/css/sb-admin-2.min.css" rel="stylesheet">
        <title>Admin</title>

    </head>
    <body id="page-top">
        <c:set var="c" value="${session.user}"></c:set>
            <!-- Page Wrapper -->
            <div id="wrapper">

                <!-- Sidebar -->
                <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                    <!-- Sidebar - Brand -->
                    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="list">
                        <div class="sidebar-brand-icon rotate-n-15">
                            <i class="fas fa-laugh-wink"></i>
                        </div>
                        <div class="sidebar-brand-text mx-3">Ehome Admin</div>
                    </a>
                    <hr class="sidebar-divider my-0">
                    <!-- Nav Item - Dashboard -->
                    <li class="nav-item active">
                        <a class="nav-link" href="index.html">
                            <i class="fas fa-fw fa-tachometer-alt"></i>
                            <span>Dashboard</span></a>
                    </li>

                    <!-- Divider -->
                    <hr class="sidebar-divider">

                    <!-- Heading -->
                    <div class="sidebar-heading">
                        MANAGEMENT
                    </div>

                    <!-- Nav Item - Pages Collapse Menu -->
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="?showAccount=true">
                            <i class="fas fa-user fa-sm fa-fw"></i>
                            <span>Account</span>
                        </a>
                    </li>

                    <!-- Nav Item - Utilities Collapse Menu -->
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="?showRent=true">
                            <i class="fa-solid fa-house-chimney-window"></i>
                            <span>Rental</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="?showHouse=true">
                            <i class="fa-solid fa-house-chimney"></i>
                            <span>Houses</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="?showBuilding=true" >
                            <i class="fa-solid fa-building"   style="margin-left: 4px"></i>
                            <span>Building</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="?showFacility=true" >
                            <i class="fa-solid fa-bolt"   style="margin-left: 4px"></i>
                            <span>Facility</span>
                        </a>
                    </li>

                </ul>



                <!-- Content Wrapper -->
                <div id="content-wrapper" class="d-flex flex-column">

                    <!-- Main Content -->
                    <div id="content">
                        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                            <!-- Sidebar Toggle (Topbar) -->
                            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                                <i class="fa fa-bars"></i>
                            </button>

                            <!-- Topbar Search -->
                            <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                           aria-label="Search" aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>


                            <!-- User Information Dropdown -->
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item dropdown no-arrow">
                                    <a class="nav-link" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="mr-2 d-none d-lg-inline text-gray-600 small">${user.fullname}</span>
                                    <img class="img-profile rounded-circle"
                                         src="${user.image}" alt="User Profile Image">
                                </a>
                            </li>
                        </ul>
                        <div class="topbar-divider d-none d-sm-block"></div>
                        <c:if test="${user != null}">
                            <form action="logout" class="d-none d-sm-inline-block ">
                                <button class="btn btn-link text-primary" type="submit">Logout</button>
                            </form>
                        </c:if>
                    </nav>




                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                        </div>

                        <!-- Content Row -->
                        <div class="row">
                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                    Total Users</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">${totalUser}</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fa-solid fa-user fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                    Total Contract</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fa-solid fa-file-contract fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-info shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Total Rental
                                                </div>
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col-auto">
                                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="progress progress-sm mr-2">
                                                            <div class="progress-bar bg-info" role="progressbar"
                                                                 style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                                 aria-valuemax="100"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fa-solid fa-house-crack fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Pending Requests Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-warning shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                    Pending Requests</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-comments fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <c:choose>
                            <c:when test="${not empty param.showAccount}">
                                <div class="row">
                                    <jsp:include page="../Views/account.jsp"></jsp:include>
                                    </div>
                            </c:when>
                            <c:otherwise>
                                <div class="row" style="display: none;">
                                    <jsp:include page="../Views/account.jsp"></jsp:include>
                                    </div>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${not empty param.showRent}">
                                <div class="row">
                                    <jsp:include page="../Views/rent.jsp"></jsp:include>
                                    </div>
                            </c:when>
                            <c:otherwise>
                                <div class="row" style="display: none;">
                                    <jsp:include page="../Views/rent.jsp"></jsp:include>
                                    </div>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${not empty param.showBuilding}">
                                <div class="row">
                                    <jsp:include page="../Views/building.jsp"></jsp:include>
                                    </div>
                            </c:when>
                            <c:otherwise>
                                <div class="row" style="display: none;">
                                    <jsp:include page="../Views/building.jsp"></jsp:include>
                                    </div>
                            </c:otherwise>
                        </c:choose>                   
                        <c:choose>
                            <c:when test="${not empty param.showHouse}">
                                <div class="row">
                                    <jsp:include page="../Views/house.jsp"></jsp:include>
                                    </div>
                            </c:when>
                            <c:otherwise>
                                <div class="row" style="display: none;">
                                    <jsp:include page="../Views/house.jsp"></jsp:include>
                                    </div>
                            </c:otherwise>
                        </c:choose>                   
                        <c:choose>
                            <c:when test="${not empty param.showFacility}">
                                <div class="row">
                                    <jsp:include page="../Views/facility.jsp"></jsp:include>
                                    </div>
                            </c:when>
                            <c:otherwise>
                                <div class="row" style="display: none;">
                                    <jsp:include page="../Views/facility.jsp"></jsp:include>
                                    </div>
                            </c:otherwise>
                        </c:choose>                   

                    </div>
                    <!-- End of Main Content -->

                    <!-- Footer -->
                    <footer class="sticky-footer bg-white">
                        <div class="container my-auto">
                            <div class="copyright text-center my-auto">
                                <span>Copyright &copy; Ehome Website 2023</span>
                            </div>
                        </div>
                    </footer>

                </div>
                <!-- End of Content Wrapper -->

                <!-- ...other closing tags... -->

            </div>
            <!-- End of Page Wrapper -->


    </body>

</html>
