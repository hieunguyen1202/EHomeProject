/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Models.Building;
import Models.Facility;
import Models.House;
import Models.HouseType;
import Models.Paging;
import Models.RentEntity;
import Models.RentEntityType;
import Models.Users;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Hieu
 */
@WebServlet(name = "ManagerAdmin", urlPatterns = {"/manageadmin"})
public class ManageAdmin extends HttpServlet {

    DAO d;

    public void init() {
        d = new DAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        Users user = (Users) ses.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
        } else {
            int totalUser = DAO.INSTANCE.getTotalUsers();
            List<Building> list = DAO.INSTANCE.getBuildingAll();
            List<Users> listUser = DAO.INSTANCE.getUsers();
            List<House> houseList = DAO.INSTANCE.loadHouse();
            List<Facility> facilityList = DAO.INSTANCE.loadFacilityList();
            List<RentEntity> rentEntityList = DAO.INSTANCE.loadRentEntityList(null);
            Map<String, Users> userMap = DAO.INSTANCE.loadCreateBy();
            Map<Integer, RentEntityType> rentMap = DAO.INSTANCE.loadRentEntityType();
            Map<Integer, HouseType> houseTypeMap = DAO.INSTANCE.loadHouseTypeId();
            Map<Integer, House> houseMap = DAO.INSTANCE.loadHouseMap();
            int nrpp = 3;
            int index = -1;
            try {
                index = Integer.parseInt(request.getParameter("index"));
            } catch (Exception e) {
            }
            System.out.println("size:" + listUser.size());
            Paging p = new Paging(nrpp, index, listUser.size());
            Paging p1 = new Paging(nrpp, index, houseList.size());
            Paging p2 = new Paging(nrpp, index, facilityList.size());
            Paging p3 = new Paging(nrpp, index, list.size());
            Paging p4 = new Paging(nrpp, index, rentEntityList.size());
            p.calc();
            System.out.println("p:" +p);
            p1.calc();
            p2.calc();
            p3.calc();
            p4.calc();
            request.setAttribute("page", p);
            request.setAttribute("page1", p1);
            request.setAttribute("page2", p2);
            request.setAttribute("page3", p3);
            request.setAttribute("page4", p4);
//            request.setAttribute("nrppArr", nrppArr);
            request.setAttribute("listuser", listUser);
            request.setAttribute("totalUser", totalUser);
            request.setAttribute("listBuilding", list);
            request.setAttribute("userMap", userMap);
            request.setAttribute("house", houseList); // List<House>
            request.setAttribute("facility", facilityList);
            request.setAttribute("rentEntity", rentEntityList);
            request.setAttribute("rentMap", rentMap);
            request.setAttribute("houseMap", houseMap);
//            System.out.println("rent: " + rentEntityList);
            request.setAttribute("houseTypeMap", houseTypeMap);
            request.getRequestDispatcher("Views/admin.jsp").forward(request, response);
        }
    }

    int[] nrppArr = {1, 2, 3, 5, 7, 10, 15, 20, 30, 50, 100, 200, 500, 1000, 5000};

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
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
