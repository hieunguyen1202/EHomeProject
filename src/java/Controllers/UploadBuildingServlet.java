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
@WebServlet(name = "UploadBuildingServlet", urlPatterns = {"/uploadbuilding"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50) // 50 MB
public class UploadBuildingServlet extends HttpServlet {

    public static final String SAVE_DIRECTORY = "uploads";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map<Integer, Ward> wardMap = DAO.INSTANCE.loadWard();
        request.setAttribute("wardMap", wardMap);
        request.getRequestDispatcher("Views/addBuilding.jsp").forward(request, response);
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
                Part part = request.getPart("image");
                String map = request.getParameter("map");
                String realPath = request.getServletContext().getRealPath("/uploads");
                String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

                if (!Files.exists(Paths.get(realPath))) {
                    Files.createDirectories(Paths.get(realPath));
                }
                String relativePath = "/uploads/" + filename;
                try {
                    int wardId = Integer.parseInt(wardId_raw);
                    int status = Integer.parseInt(status_raw);
                    Building b = new Building(name, wardId, address, relativePath, map, status);
                    boolean addNewBuilding = DAO.INSTANCE.insertBuilding(b);
                    if (addNewBuilding) {
                        System.out.println("add thanh cong");
                        request.setAttribute("success", "Add new building successfully!");
                        request.getRequestDispatcher("Views/addBuilding.jsp").forward(request, response);
                    } else {
                        request.setAttribute("error", "Add new building failed!");
                        request.getRequestDispatcher("Views/addBuilding.jsp").forward(request, response);
                    }
                } catch (Exception e) {
                    System.out.println("error: " + e.getMessage());
                }
            } catch (Exception e) {
                System.out.println("errpr: " + e.getMessage());
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
