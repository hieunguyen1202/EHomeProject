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
import java.util.Map;

/**
 *
 * @author Hieu
 */
//@WebServlet(name = "UploadHouseServlet", urlPatterns = {"/uploadhouse"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50) // 50 MB
public class UploadHouseServlet extends HttpServlet {

    public static final String SAVE_DIRECTORY = "uploads";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map<Integer, Ward> wardMap = DAO.INSTANCE.loadWard();
        request.setAttribute("wardMap", wardMap);
        Map<Integer, HouseType> houseTypeMap = DAO.INSTANCE.loadHouseTypeId();
        request.setAttribute("houseTypeMap", houseTypeMap);
        Map<Integer, Building> buildingMap = DAO.INSTANCE.loadBuilding();
        request.setAttribute("buildingMap", buildingMap);

        request.getRequestDispatcher("Views/addHouse.jsp").forward(request, response);
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
                String wardId_raw = request.getParameter("wardId");
                String address = request.getParameter("address");
                String status_raw = request.getParameter("status");
                String houseTypeId_raw = request.getParameter("houseTypeId");
                Part part = request.getPart("image");
                String map = request.getParameter("map");
                String buildingId_raw = request.getParameter("buildingId");
                String realPath = request.getServletContext().getRealPath("/uploads");
                String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

                if (!Files.exists(Paths.get(realPath))) {
                    Files.createDirectories(Paths.get(realPath));
                }
                String relativePath = "/uploads/" + filename; // Construct the relative path
//                if (buildingId_raw.equals("") || buildingId_raw.isEmpty()) {
//                    buildingId_raw = "NULL";
//                }
                // Save the uploaded file
//            part.write(realPath + "/" + filename);
                try {
                    int wardId = Integer.parseInt(wardId_raw);
                    int status = Integer.parseInt(status_raw);
                    int houseTypeId = Integer.parseInt(houseTypeId_raw);
                    int buildingId = Integer.parseInt(buildingId_raw);
                    String ownerId = user.getUsername();
                    System.out.println(ownerId);
                    House h = new House(name, wardId, address, status, relativePath, houseTypeId, map, buildingId, ownerId);
                    boolean addNewHouse = DAO.INSTANCE.insertHouse(h);
                    if (addNewHouse) {
                        System.out.println("add thanh cong");
                        request.setAttribute("success", "Add new house successfully!");
                        request.getRequestDispatcher("Views/addHouse.jsp").forward(request, response);
                    } else {
                        System.out.println("add failed");
                        request.setAttribute("error", "Add new rental failed!");
                        request.getRequestDispatcher("Views/addHouse.jsp").forward(request, response);
                    }
                } catch (Exception e) {
                    System.out.println("error: " + e);
                }

            } catch (Exception e) {
                System.out.println("errpr: " + e);
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
