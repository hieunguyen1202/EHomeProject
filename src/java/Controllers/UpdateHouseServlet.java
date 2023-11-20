/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Models.Building;
import Models.House;
import Models.HouseType;
import Models.Users;
import Models.Ward;
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
@WebServlet(name = "UpdateHouseServlet", urlPatterns = {"/updatehouse"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50) // 50 MB
public class UpdateHouseServlet extends HttpServlet {

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
                int houseId = Integer.parseInt(request.getParameter("houseId"));
                House house = DAO.INSTANCE.getHouseById(houseId);
                System.out.println("house id " + house.getHouseId());
                System.out.println("house name: " + house.getName());
                Map<Integer, Ward> wardMap = DAO.INSTANCE.loadWard();
                request.setAttribute("wardMap", wardMap);
                Map<Integer, HouseType> houseTypeMap = DAO.INSTANCE.loadHouseTypeId();
                request.setAttribute("houseTypeMap", houseTypeMap);
                Map<Integer, Building> buildingMap = DAO.INSTANCE.loadBuilding();
                request.setAttribute("buildingMap", buildingMap);
                request.setAttribute("house", house);
                request.getRequestDispatcher("Views/updateHouse.jsp").forward(request, response);
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
        try {
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            request.setCharacterEncoding("UTF-8");
            int houseId = Integer.parseInt(request.getParameter("houseId"));
            String name = request.getParameter("name");
            int wardId = Integer.parseInt(request.getParameter("wardId"));
            String address = request.getParameter("address");
            int status = Integer.parseInt(request.getParameter("status"));
            Part part = request.getPart("image");
            String map = request.getParameter("map");
            int houseTypeId = Integer.parseInt(request.getParameter("houseTypeId"));
            int buildingId = Integer.parseInt(request.getParameter("buildingId"));
            House house =DAO.INSTANCE.getHouseById(houseId);
            String currentImageFileName = house.getImage();

            String relativePath = currentImageFileName; // Default to the current image path

            if (part.getSize() > 0) {
                // A new image file has been provided
                String realPath = request.getServletContext().getRealPath("uploads");
                String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

                if (!Files.exists(Paths.get(realPath))) {
                    Files.createDirectories(Paths.get(realPath));
                }
                relativePath = "uploads/" + filename;
            }
            House updatedHouse = new House(houseId, name, wardId, address, status, map, relativePath, houseTypeId, buildingId);

            boolean updated = DAO.INSTANCE.updateHouse(updatedHouse);

            if (updated) {
                System.out.println("Update successful");
                request.setAttribute("success", "House updated successfully!");
                request.getRequestDispatcher("Views/updateHouse.jsp").forward(request, response);
            } else {
                // Handle update failure (e.g., display an error page)
                request.setAttribute("error", "House updated failed!");
                request.getRequestDispatcher("Views/updateHouse.jsp").forward(request, response);
            }
        } catch (NumberFormatException | IOException e) {
            System.out.println("error update: " + e);
        }
    }
}
