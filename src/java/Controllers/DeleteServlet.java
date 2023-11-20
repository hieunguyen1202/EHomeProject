/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Models.Users;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Hieu
 */
@WebServlet(name = "DeleteServlet", urlPatterns = {"/delete"})
public class DeleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        Users user = (Users) ses.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        String name = request.getParameter("name");
        String tableNameTail = "HE171464";

        if ("facility".equalsIgnoreCase(name)) {
            deleteFacility(request, response, user, tableNameTail);
        } else if ("users".equalsIgnoreCase(name)) {
            deleteUser(request, response, user, tableNameTail);
        } else if ("house".equalsIgnoreCase(name)) {
            deleteHouse(request, response, user, tableNameTail);
        } else if ("building".equalsIgnoreCase(name)) {
            deleteBuilding(request, response, user, tableNameTail);
        } else if ("rentEntity".equalsIgnoreCase(name)) {
            deleteRentEntity(request, response, user, tableNameTail);
        } else {
            System.out.println("Invalid entity name: " + name);
        }
    }

    private void deleteFacility(HttpServletRequest request, HttpServletResponse response, Users user, String tableNameTail) throws IOException {
        String facilityId = request.getParameter("facilityId");
        int id_facility;
        try {
            id_facility = Integer.parseInt(facilityId);
            String table = "FACILITY" + tableNameTail;
            if (DAO.INSTANCE.delete(table, "facilityId", id_facility)) {
                if (user.getRole() == 0) {
                    System.out.println("Deleted facility " + id_facility + " from table " + table + " successfully.");
                    response.sendRedirect("manageadmin?showFacility=true");
                } else if (user.getRole() == 2) {
                    System.out.println("Deleted facility " + id_facility + " from table " + table + " successfully by " + user.getUsername());
                    response.sendRedirect("manageowner?showFacility=true");
                }
            }
        } catch (NumberFormatException e) {
            System.out.println("Facility deletion failed: " + e.getMessage());
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response, Users user, String tableNameTail) throws IOException {
        String username = request.getParameter("username");
        try {
            String table = "USERS" + tableNameTail;
            if (DAO.INSTANCE.delete(table, "username", username)) {
                if (user.getRole() == 0) {
                    System.out.println("Deleted user " + username+ " from table " + table + " successfully.");
                    response.sendRedirect("manageadmin?showAccount=true");
                } else if (user.getRole() == 2) {
                    System.out.println("Deleted user " + username + " from table " + table + " successfully by " + user.getUsername());
                    response.sendRedirect("manageowner?showAccount=true");
                }
            }
        } catch (NumberFormatException e) {
            System.out.println("User deletion failed: " + e.getMessage());
        }
    }

    private void deleteHouse(HttpServletRequest request, HttpServletResponse response, Users user, String tableNameTail) throws IOException {
        String houseId = request.getParameter("houseId");
        int id_house;
        try {
            id_house = Integer.parseInt(houseId);
            String table = "HOUSE" + tableNameTail;
            if (DAO.INSTANCE.delete(table, "houseId", id_house)) {
                if (user.getRole() == 0) {
                    System.out.println("Deleted house " + id_house + " from table " + table + " successfully.");
                    response.sendRedirect("manageadmin?showHouse=true");
                } else if (user.getRole() == 2) {
                    System.out.println("Deleted house " + id_house + " from table " + table + " successfully by " + user.getUsername());
                    response.sendRedirect("manageowner?showHouse=true");
                }
            }
        } catch (NumberFormatException e) {
            System.out.println("House deletion failed: " + e.getMessage());
        }
    }

    private void deleteBuilding(HttpServletRequest request, HttpServletResponse response, Users user, String tableNameTail) throws IOException {
        String buildingId = request.getParameter("buildingId");
        int id_building;
        try {
            id_building = Integer.parseInt(buildingId);
            String table = "BUILDING" + tableNameTail;
            if (DAO.INSTANCE.delete(table, "buildingId", id_building)) {
                if (user.getRole() == 0) {
                    System.out.println("Deleted building " + id_building + " from table " + table + " successfully.");
                    response.sendRedirect("manageadmin?showBuilding=true");
                } else if (user.getRole() == 2) {
                    System.out.println("Deleted building " + id_building + " from table " + table + " successfully by " + user.getUsername());
                    response.sendRedirect("manageowner?showBuilding=true");
                }
            }
        } catch (NumberFormatException e) {
            System.out.println("Building deletion failed: " + e.getMessage());
        }
    }

    private void deleteRentEntity(HttpServletRequest request, HttpServletResponse response, Users user, String tableNameTail) throws IOException {
        String rentEntityId = request.getParameter("rentEntityId");
        int id_renEntityId;
        try {
            id_renEntityId = Integer.parseInt(rentEntityId);
            String table = "RentEntity" + tableNameTail;
            if (DAO.INSTANCE.delete(table, "rentEntityId", id_renEntityId)) {
                if (user.getRole() == 0) {
                    System.out.println("Deleted rentEntity " + id_renEntityId + " from table " + table + " successfully.");
                    response.sendRedirect("manageadmin?showRent=true");
                } else if (user.getRole() == 2) {
                    System.out.println("Deleted building " + id_renEntityId + " from table " + table + " successfully by " + user.getUsername());
                    response.sendRedirect("manageowner?showRent=true");
                }
            }
        } catch (NumberFormatException e) {
            System.out.println("Building deletion failed: " + e.getMessage());
        }
    
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
