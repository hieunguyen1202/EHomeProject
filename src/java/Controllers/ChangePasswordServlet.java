/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Models.Encode;
import Models.Users;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Hieu
 */
public class ChangePasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/changePassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        Users user = (Users) ses.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
        } else {
            String oldPass = request.getParameter("oldPassword");
            String newPass = request.getParameter("password");
            String confNewPass = request.getParameter("confPassword");
            Users u = DAO.INSTANCE.getUserIdByUsername(user.getUsername());
            System.out.println("username: " + user.getUsername());
            System.out.println("password: " + user.getPassword());
            if (u.getPassword().equals(Encode.toSHA1(oldPass))) {
                if (newPass != null && confNewPass != null && newPass.equals(confNewPass)) {
                    DAO.INSTANCE.ChangePassword(Encode.toSHA1(newPass), user.getUsername());
                    request.setAttribute("status", "Change password successfully!");
                    doGet(request, response);
                    System.out.println("update pass thanh cong");
                }
                if (!(newPass.equals(confNewPass)) && newPass!=null && confNewPass!= null) {
                    request.setAttribute("failed", "Confirm password not march");
                    doGet(request, response);
                    System.out.println("update pass that bai vi confirm not march");
                }
            } else {
                request.setAttribute("failed", "Old password incorrect!!");
                doGet(request, response);
                System.out.println("update pass that bai");
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
