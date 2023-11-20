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
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Hieu
 */
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/login.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        String rem = request.getParameter("rememberMe");
        DAO d = new DAO();
        Users u = d.checkUsers(user, Encode.toSHA1(pass));
        Cookie cUser = new Cookie("cUser", user);
        Cookie cPass = new Cookie("cPass", pass);
        Cookie cRem = new Cookie("cRem", rem);
        if (rem != null) {
            // co chon
            cUser.setMaxAge(60 * 60 * 24 * 7); //7days
            cPass.setMaxAge(60 * 60 * 24 * 7); //7days
            cRem.setMaxAge(60 * 60 * 24 * 7); //7days
        } else {
            cUser.setMaxAge(0);
            cPass.setMaxAge(0);
            cRem.setMaxAge(0);
        }
        response.addCookie(cUser);
        response.addCookie(cPass);
        response.addCookie(cRem);
        HttpSession session = request.getSession();
        if (u == null) {
            request.setAttribute("errorMessage", "Login Failed: Username or Password is Invalid");
            request.getRequestDispatcher("Views/login.jsp").forward(request, response);
        } else {
            Users us = DAO.INSTANCE.getUserIdByUsername(user);
//            System.out.println(us.getUsername());
            // Set the user's ID in the Users object
//            u.setUserId(us.getUserId());
//            System.out.println("id: " + us.getUserId());
            session.setAttribute("user", us);
//            Users userLogin = DAO.INSTANCE.getUserByIdOnly(us.getUserId());
//            response.sendRedirect("list");
            if (us.getRole() == 0) {
                response.sendRedirect("manageadmin");
            }
            if (us.getRole() == 2) {
                response.sendRedirect("manageowner");
            }
            if (us.getRole() == 1) {
                response.sendRedirect("list");
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
