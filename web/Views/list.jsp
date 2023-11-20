<%-- 
    Document   : list
    Created on : Sep 26, 2023, 8:33:18 PM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       

        <div>
            <table border="1px" width="40%">
                <tr>
                    <th>Name</th>
                    <th>Room Number</th>
                    <th>Description</th>
                    <th>price</th>
                    <th>max Occupancy</th>
                    <th>availability</th>
                    <th>image</th>
                    <th>map</th>
                    <th>create date</th>
                </tr>
                <c:forEach items="${requestScope.data}" var="c">
                    <c:set var="id" value="${c.roomId}"/>
                    <tr>
                        <td>${c.name}</td>
                        <td>${c.roomNumber}</td>
                        <td>${c.description}</td>
                        <td>${c.price}</td>
                        <td>${c.maxOccupancy}</td>
                        <td>${c.availability}</td>
                        <td><img src="${c.image}" alt="alt" width="100px" height="100px"/></td>
                        <td><iframe src="${c.map}" width="500px" height="200px"></iframe></td>
                        <td>${c.createDate}</td>
                    </tr>
                </c:forEach>
            </table>
    </body>
</html>
