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
import java.util.Map;

/**
 *
 * @author Hieu
 */
@WebServlet(name = "UpdateRentServlet", urlPatterns = {"/updaterent"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50) // 50 MB
public class UpdateRentServlet extends HttpServlet {

    public static final String SAVE_DIRECTORY = "uploads";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
        } else {
            try {
                int rentEntityId = Integer.parseInt(request.getParameter("rentEntityId"));
                RentEntity rent = DAO.INSTANCE.getRentEntityById(rentEntityId);
                Map<Integer, House> houseMap = DAO.INSTANCE.loadHouseMap();
                System.out.println("rent id " + rent.getRentEntityId());
                System.out.println("rent name: " + rent.getName());
                request.setAttribute("houseMap", houseMap);
                Map<Integer, RentEntityType> rentMap = DAO.INSTANCE.loadRentEntityType();
                request.setAttribute("rentMap", rentMap);
                request.setAttribute("rent", rent);
                request.getRequestDispatcher("Views/updateRent.jsp").forward(request, response);
            } catch (NumberFormatException | ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
        } else {
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            request.setCharacterEncoding("UTF-8");
            try {
                int rentEntityId = Integer.parseInt(request.getParameter("rentEntityId"));
                String name = request.getParameter("name");
                String description = request.getParameter("description");
                int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
                int houseId = Integer.parseInt(request.getParameter("houseId"));
                int price = Integer.parseInt(request.getParameter("price"));
                int area = Integer.parseInt(request.getParameter("area"));
                Part part = request.getPart("image");
                int status = Integer.parseInt(request.getParameter("status"));
                int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
                RentEntity rent = DAO.INSTANCE.getRentEntityById(rentEntityId);
                String currentImageFileName = rent.getImage();

                String relativePath = currentImageFileName;
                if (part.getSize() > 0) {
                    // A new image file has been provided
                    String realPath = request.getServletContext().getRealPath("/uploads");
                    String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

                    if (!Files.exists(Paths.get(realPath))) {
                        Files.createDirectories(Paths.get(realPath));
                    }
                    relativePath = "uploads/" + filename;
                }
                RentEntity updateRent = new RentEntity(name, description, rentTypeId, houseId, price, area, relativePath, status, maxPeople, rentEntityId);

                boolean updated = DAO.INSTANCE.updateRent(updateRent);

                if (updated) {
                    System.out.println("Update successful");
                    request.setAttribute("success", "Rent updated successfully!");
                    request.getRequestDispatcher("Views/updateRent.jsp").forward(request, response);
                } else {
                    // Handle update failure 
                    request.setAttribute("error", "Rent updated failed!");
                    request.getRequestDispatcher("Views/updateRent.jsp").forward(request, response);
                }
            } catch (NumberFormatException | IOException e) {
                System.out.println("error update: " + e.getMessage());
            }
        }
    }
}
