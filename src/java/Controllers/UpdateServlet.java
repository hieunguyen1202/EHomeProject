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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Paths;

/**
 *
 * @author Hieu
 */
@WebServlet(name = "UpdateServlet", urlPatterns = {"/updateprofile"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50) // 50 MB
public class UpdateServlet extends HttpServlet {

    public static final String SAVE_DIRECTORY = "uploads";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        Users user = (Users) ses.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
        } else {
            DAO d = new DAO();
            try {
                Users u = d.getUserByUsernameOnly(user.getUsername());
                request.setAttribute("profile", u);
                request.getRequestDispatcher("Views/profile.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace(); // Log the exception
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        DAO d = new DAO();
        try {
            String username = user.getUsername();
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            String citizenNumber = request.getParameter("citizenNumber");
            String citizenNumberDate = request.getParameter("citizenNumberDate");
            Part part = request.getPart("image");
            boolean isMale = "M".equals(gender) ? true : false;

            user = DAO.INSTANCE.getUserByUsernameOnly(user.getUsername());
            String currentImageFileName = user.getImage();

            String relativePath = currentImageFileName; // Default to the current image path

            if (part.getSize() > 0) {
                // A new image file has been provided
                String realPath = request.getServletContext().getRealPath("/uploads");
                String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

                if (!Files.exists(Paths.get(realPath))) {
                    Files.createDirectories(Paths.get(realPath));
                }
                relativePath = "uploads/" + filename;
            }
            user.setImage(relativePath);
            System.out.println(relativePath);
            Users cNew = new Users(username,fullname, email, phone, isMale, dob, relativePath, citizenNumber, citizenNumberDate);
            cNew.setImage(relativePath);
            boolean isUpdated = d.updateUserProfile(cNew);

            if (isUpdated) {
                // Set success notice
                request.setAttribute("notice", "Profile updated successfully! \uD83D\uDC4D");
//                request.getRequestDispatcher("Views/profile.jsp").forward(request, response);
            } else {
                // Set error notice
                request.setAttribute("error", "Failed to update profile. Please try again. \uD83D\uDE14");
//                request.getRequestDispatcher("Views/profile.jsp").forward(request, response);
            }
            doGet(request, response);
        } catch (NumberFormatException e) {
            System.out.println("error update profile: " + e.getMessage());
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
