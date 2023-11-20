<%-- 
    Document   : welcome
    Created on : Sep 29, 2023, 10:41:23 PM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
    </head>
    <body>
        <h1>Day la trang nguoi dung</h1>
        <h2>Hello ${sessionScope.account.username}
        <br/>role: ${sessionScope.account.role}</h2>
    </body>
</html>
