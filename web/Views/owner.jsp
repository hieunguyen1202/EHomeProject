<%-- 
    Document   : owner
    Created on : Oct 12, 2023, 12:17:15 AM
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
        <title>Owner</title>
    </head>
    <body id="page-top">
        <c:set var="c" value="${profile}"></c:set>
            <!-- Page Wrapper -->
            <div id="wrapper">

                <!-- Sidebar -->
                <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                    <!-- Sidebar - Brand -->
                    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="list">
                        <div class="sidebar-brand-text mx-3">Ehome Owner</div>
                    </a>

                    <!-- Divider -->
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
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="?showRent=true">
                            <i class="fa-solid fa-house-chimney-window" style="margin-left: 4px"></i>
                            <span>Rental</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="?showHouse=true">
                            <i class="fa-solid fa-house-chimney" style="margin-left: 4px"></i>
                            <span>Houses</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="?showFacility=true" >
                            <i class="fa-solid fa-bolt" style="margin-left: 4px"></i>&nbsp;
                            <span>Facility</span>
                        </a>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link collapsed" href="#" >
                            <i class="fa-solid fa-file-contract" style="margin-left: 4px"></i>&nbsp;
                            <span>My Contracts</span>
                        </a>
                        <a class="nav-link collapsed" href="?showPendingRequest=true" >
                            <i class="fas fa-comments" ></i>
                            <span>Pending Request</span>
                            <span class="badge badge-danger">5</span> 
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
                            <form action="logout"class="d-none d-sm-inline-block ">
                                <button class="btn btn-link text-primary" type="submit">Logout</button>
                            </form>
                        </c:if>

                    </nav>

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                    class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                        </div>

                        <!-- Content Row -->
                        <div class="row">

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-4 col-md-6 mb-4">
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

                            <!-- Earning Card Example -->
                            <div class="col-xl-4 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                    Earnings</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">18$</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-comments fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Pending Requests Card Example -->
                            <div class="col-xl-4 col-md-6 mb-4">
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

                        <!-- Content Row -->
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
                        <c:choose>
                            <c:when test="${not empty param.showPendingRequest}">
                                <div class="row">
                                    <jsp:include page="../Views/pendingRequest.jsp"></jsp:include>
                                    </div>
                            </c:when>
                            <c:otherwise>
                                <div class="row" style="display: none;">
                                    <jsp:include page="../Views/pendingRequest.jsp"></jsp:include>
                                    </div>
                            </c:otherwise>
                        </c:choose>       
                    </div>
                    <footer class="sticky-footer bg-white">
                        <div class="container my-auto">
                            <div class="copyright text-center my-auto">
                                <span>Copyright &copy; Ehome Website 2023</span>
                            </div>
                        </div>
                    </footer>
                </div>
            </div>
        </div>

    </body>

</html>
