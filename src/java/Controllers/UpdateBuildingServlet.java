/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Models.Building;
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
@WebServlet(name = "UpdateBuildingServlet", urlPatterns = {"/updatebuilding"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50) // 50 MB
public class UpdateBuildingServlet extends HttpServlet {

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
                int buildingId = Integer.parseInt(request.getParameter("buildingId"));
                Building building = DAO.INSTANCE.getBuildingById(buildingId);
                Map<Integer, Ward> wardMap = DAO.INSTANCE.loadWard();
                System.out.println(wardMap);
                request.setAttribute("wardMap", wardMap);
                request.setAttribute("building", building);
                request.getRequestDispatcher("Views/updateBuilding.jsp").forward(request, response);

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
            int buildingId = Integer.parseInt(request.getParameter("buildingId"));
            String name = request.getParameter("name");
            int wardId = Integer.parseInt(request.getParameter("wardId"));
            String address = request.getParameter("address");
            Part part = request.getPart("image");
            String map = request.getParameter("map");
            int status = Integer.parseInt(request.getParameter("status"));
            Building building = DAO.INSTANCE.getBuildingById(buildingId);
            String currentImageFileName = building.getImage();

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
            Building updatedBuilding = new Building(buildingId, name, wardId, address, relativePath, map, status);

            boolean updated = DAO.INSTANCE.updateBuilding(updatedBuilding);

            if (updated) {
                System.out.println("Update successful");
                request.setAttribute("success", "Building updated successfully!");
                request.getRequestDispatcher("Views/updateBuilding.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Building updated failed!");
                request.getRequestDispatcher("Views/updateBuilding.jsp").forward(request, response);
            }
        } catch (NumberFormatException | IOException e) {
            System.out.println("error update: " + e);
            // Handle the exception appropriately, e.g., show an error page
        }
    }
}
