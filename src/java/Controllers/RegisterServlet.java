/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Models.Encode;
import Models.Users;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Hieu
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/register.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullname_raw = request.getParameter("fullname");
        String username_raw = request.getParameter("username");
        String password_raw = request.getParameter("password");
        String email_raw = request.getParameter("email");
        String phone_raw = request.getParameter("phone");
        String dob_raw = request.getParameter("dob");
        // Check if the "isRenter" checkbox is checked
        boolean isRenter = request.getParameter("isRenter") != null;
        String genderValue = request.getParameter("gender");

        // Determine the user's role based on the checkbox
        int role = isRenter ? 1 : 2;
        boolean isMale = "M".equals(genderValue) ? true : false;
        DAO d = new DAO();
        Users u = d.checkUsers(username_raw, password_raw);
//        HttpSession session = request.getSession();

        // Check if the user doesn't exist and all required fields are filled
        if (u == null && !username_raw.isEmpty() && !password_raw.isEmpty()) {

            // Create a new user with the provided information
            u = new Users();
            u.setUsername(username_raw);
            u.setPassword(Encode.toSHA1(password_raw));
            u.setEmail(email_raw);
            u.setFullname(fullname_raw);
            u.setGender(isMale);
            u.setDob(dob_raw);
            u.setPhone(phone_raw);
            u.setRole(role);
            // Insert the new user into the database
            boolean insertionSuccess = d.insert(u);
            
            if (insertionSuccess) {
                // Registration successful
                System.out.println("dang ki thanh cong");
                request.setAttribute("successMessage", "Registration successful!");
                request.getRequestDispatcher("Views/register.jsp").forward(request, response);
            } else {
                // Registration failed
                System.out.println("dang ki that bai");
                request.setAttribute("errorMessage", "Registration failed. Please try again.");
                request.getRequestDispatcher("Views/register.jsp").forward(request, response);
            }
        } else {
            // Invalid input or user already exists
            request.setAttribute("errorMessage", "Invalid input or user already exists.");
            request.getRequestDispatcher("Views/register.jsp").forward(request, response);
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
