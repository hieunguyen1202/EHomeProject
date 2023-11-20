<%-- 
    Document   : updateaccount
    Created on : Oct 18, 2023, 11:13:00 AM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <style>
            /* Style for the modal */
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0, 0, 0, 0.4);
            }

            .modal-content {
                background-color: #fefefe;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 40%;
            }
            #closeEditModa{
                cursor: pointer;
            }
            #role{
                cursor: pointer;
            }
        </style>
    </head>
    <body>        <c:set var="c" value="${session.user}"></c:set>
        <div id="editUserModal" class="modal">
            <div class="modal-content">
                <span class="close" id="closeEditModal">&times;</span>
                <h2>Edit User</h2>
                <form id="editUserForm">
                    <input type="hidden" id="userId" name="userId">
                    <label for="role">Role:</label>
                    <select id="role" name="role">
                        <option value="0">Admin</option>
                        <option value="1">Renter</option>
                        <option value="2">Owner</option>
                    </select>
                    <button type="button" id="saveStatus">Save</button>
                </form>
            </div>
        </div>

        <script>
            const editUserModal = document.getElementById("editUserModal");
            const closeEditModal = document.getElementById("closeEditModal");
            const editUserForm = document.getElementById("editUserForm");

            // Function to show the edit user modal and populate the form
            function showEditModal(userId, currentStatus) {
                editUserForm.reset(); // Reset the form
                userId.value = userId; // Set the user's ID
                status.value = currentStatus; // Set the current status
                editUserModal.style.display = "block";
            }

            // Close the edit user modal when clicking the close button
            closeEditModal.onclick = function () {
                editUserModal.style.display = "none";
            }

            // Add an event listener to save the status
            saveStatus.onclick = function () {
                editUserModal.style.display = "none";
            }
        </script>
       <a href="?showAccountUpdate=true" class="text-warning" onclick="showEditModal(${c.userId}, ${c.role})">Update Account</a>

        <!-- Include jQuery and Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>
