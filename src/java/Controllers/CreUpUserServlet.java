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
import java.util.List;

/**
 *
 * @author Hieu
 */
@WebServlet(name = "CreUpUserServlet", urlPatterns = {"/creup"})
public class CreUpUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        Users u = DAO.INSTANCE.getUserIdByUsername(username);
        request.setAttribute("profile", u);
        List<Users> listUser = DAO.INSTANCE.getUsers();
        request.setAttribute("listuser", listUser);
        request.getRequestDispatcher("Views/account.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String role_raw = request.getParameter("role");
        String username = request.getParameter("username");
        try {
            int role = Integer.parseInt(role_raw);
            Users u = new Users(role, username);
            boolean isUpdate = DAO.INSTANCE.updateUserRole(u);
            if (isUpdate) {
                response.sendRedirect("creup");
            }
        } catch (Exception e) {
            System.out.println("error: " + e.getMessage());
        }
//        doGet(request, response);
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
