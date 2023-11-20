/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Models.House;
import Models.RentEntity;
import Models.RentEntityType;
import Models.Users;
import java.io.IOException;
import java.nio.file.Paths;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Map;

/**
 *
 * @author Hieu
 */
//@WebServlet(name = "UpdateRentServlet", urlPatterns = {"/uploadrent"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50) // 50 MB
public class UploadRentServlet extends HttpServlet {

    public static final String SAVE_DIRECTORY = "uploads";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map<Integer, House> houseMap = DAO.INSTANCE.loadHouseMap();
        request.setAttribute("houseMap", houseMap);
        Map<Integer, RentEntityType> rentMap = DAO.INSTANCE.loadRentEntityType();
        request.setAttribute("rentMap", rentMap);

        request.getRequestDispatcher("Views/addRent.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        Users user = (Users) ses.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
        } else {
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            request.setCharacterEncoding("UTF-8");
            try {
                String name = request.getParameter("name");
                String description = request.getParameter("description");
                int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
                int houseId = Integer.parseInt(request.getParameter("houseId"));
                int price = Integer.parseInt(request.getParameter("price"));
                int area = Integer.parseInt(request.getParameter("area"));
                Part part = request.getPart("image");
                int status = Integer.parseInt(request.getParameter("status"));
                int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
                String realPath = request.getServletContext().getRealPath("/uploads");
                String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                LocalDateTime currentDateTime = LocalDateTime.now();
                String date = currentDateTime.toString();
                if (!Files.exists(Paths.get(realPath))) {
                    Files.createDirectories(Paths.get(realPath));
                }
                String relativePath = "/uploads/" + filename;
                String updateBy = user.getUsername();
                RentEntity e = new RentEntity(name, description, rentTypeId, houseId, price, area, relativePath, status, date, maxPeople, updateBy);
                boolean addNewRent = DAO.INSTANCE.insertRent(e);
                if (addNewRent) {
                    System.out.println("add thanh cong");
                    request.setAttribute("success", "Add new house successfully!");
                    request.getRequestDispatcher("Views/addRent.jsp").forward(request, response);
                } else {
                    System.out.println("add failed");
                    request.setAttribute("error", "Add new rental failed!");
                    request.getRequestDispatcher("Views/addRent.jsp").forward(request, response);
                }
            } catch (ServletException | IOException | NumberFormatException e) {
                System.out.println("errpr upload new rent: " + e.getMessage());
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
