/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Models.Facility;
import Models.Users;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Hieu
 */
@WebServlet(name = "UpdateFacilityServlet", urlPatterns = {"/updatefacility"})
public class UpdateFacilityServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
        } else {
            int FacilityId = Integer.parseInt(request.getParameter("facilityId"));
            Facility facility = DAO.INSTANCE.getFacilityById(FacilityId);
            request.setAttribute("facility", facility);
            request.getRequestDispatcher("Views/updateFacility.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        try {
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            request.setCharacterEncoding("UTF-8");
            int facilityId = Integer.parseInt(request.getParameter("facilityId"));
            String name = request.getParameter("name");

            int status = Integer.parseInt(request.getParameter("status"));
            String icon = request.getParameter("icon");
    
            Facility updatedFacility = new Facility(facilityId, name, status,icon);

            boolean updated = DAO.INSTANCE.updateFacility(updatedFacility);

            if (updated) {
                System.out.println("Update successful");
                request.setAttribute("success", "Facility updated successfully!");
                request.getRequestDispatcher("Views/updateFacility.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Facility updated failed!");
                request.getRequestDispatcher("Views/updateFacility.jsp").forward(request, response);
            }
        } catch (NumberFormatException | IOException e) {
            System.out.println("error update: " + e);
            // Handle the exception appropriately, e.g., show an error page
        }
    }
}
