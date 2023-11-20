/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Models.Encode;
import jakarta.servlet.RequestDispatcher;
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
@WebServlet(name = "NewPasswordServlet", urlPatterns = {"/newPassword"})
public class NewPasswordServlet extends HttpServlet {

    DAO d;

    public void init() {
        d = new DAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");
        if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
            
            try {
                String encodePass = Encode.toSHA1(newPassword);
                boolean rowCount = d.UpdatePassword(encodePass, (String) session.getAttribute("email"));
                if (rowCount) {
                    request.setAttribute("status", "resetSuccess");
                    request.getRequestDispatcher("Views/newPassword.jsp").forward(request, response);
                } else {
                    request.setAttribute("failed", "resetFailed");
                    request.getRequestDispatcher("Views/newPassword.jsp").forward(request, response);
                }
            } catch (Exception e) {
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
