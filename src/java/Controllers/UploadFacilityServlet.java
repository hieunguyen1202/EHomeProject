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

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


/**
 *
 * @author Hieu
 */
@WebServlet(name = "UploadFacilityServlet", urlPatterns = {"/uploadfacility"})

public class UploadFacilityServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/addFacility.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        Users user = (Users) ses.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
        } else {
            try {
                String name = request.getParameter("name");
                String status_raw = request.getParameter("status");
                String icon = request.getParameter("icon");
                try {
                    int status = Integer.parseInt(status_raw);
                    Facility f = new Facility(name, status, icon);
                    boolean addNewBuilding = DAO.INSTANCE.insertFacility(f);
                    if (addNewBuilding) {
                        System.out.println("add thanh cong");
                        request.setAttribute("success", "Add new facility successfully!");
                        doGet(request, response);
                    } else {
                        request.setAttribute("error", "Add new facility failed!");
                        doGet(request, response);
                    }
                } catch (Exception e) {
                    System.out.println("error: " + e);
                }
            } catch (Exception e) {
                System.out.println("errpr: " + e);
                e.printStackTrace();
            }
        }
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
