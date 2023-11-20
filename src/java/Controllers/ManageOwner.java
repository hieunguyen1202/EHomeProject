/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Models.Facility;
import Models.House;
import Models.HouseType;
import Models.Paging;
import Models.RentEntity;
import Models.RentEntityType;
import Models.RentUpdateScheduler;
import Models.Users;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Hieu
 */
@WebServlet(name = "ManageOwner", urlPatterns = {"/manageowner"})
public class ManageOwner extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        Users user = (Users) ses.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
        } else if (user.getRole() == 2) {
            // Load the userMap before loading the houseList
            Map<String, Users> userMap = DAO.INSTANCE.loadCreateBy();
            Map<Integer, HouseType> houseTypeMap = DAO.INSTANCE.loadHouseTypeId();
            List<Facility> facilityList = DAO.INSTANCE.loadFacilityList();
            Map<Integer, RentEntityType> rentMap = DAO.INSTANCE.loadRentEntityType();
            List<RentEntity> rentEntityList = DAO.INSTANCE.getRentEntityByUser(user.getUsername());
            Map<Integer, House> houseMap = DAO.INSTANCE.loadHouseMap();
            List<House> houseList = DAO.INSTANCE.getHouseByUser(user.getUsername());
            List<RentEntity> rentEntityListDeposit = DAO.INSTANCE.getRentEntityNotNullDeposit(user.getUsername());
            int nrpp = 3;
            int index = -1;
            try {
                index = Integer.parseInt(request.getParameter("index"));
            } catch (Exception e) {
            }
            Paging p1 = new Paging(nrpp, index, houseList.size());
            Paging p2 = new Paging(nrpp, index, facilityList.size());
//            Paging p3 = new Paging(nrpp, index, rentEntityListDeposit.size());
            Paging p4 = new Paging(nrpp, index, rentEntityList.size());
            p1.calc();
            p2.calc();
            p4.calc();
            System.out.println("p: " + p1);
            request.setAttribute("page1", p1);
            request.setAttribute("page2", p2);
//            request.setAttribute("page3", p3);
            request.setAttribute("page4", p4);
            request.setAttribute("userMap", userMap);
            request.setAttribute("houseTypeMap", houseTypeMap);
            request.setAttribute("facility", facilityList);
            request.setAttribute("house", houseList);
            request.setAttribute("rentEntity", rentEntityList);
            request.setAttribute("rentEntityDeposit", rentEntityListDeposit);
            request.setAttribute("rentMap", rentMap);
            request.setAttribute("houseMap", houseMap);
            request.getRequestDispatcher("Views/owner.jsp").forward(request, response);
        } else {
            
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        int rentId = Integer.parseInt(request.getParameter("rentEntityId"));
        String btnAccept = request.getParameter("accept");
        String btnReject = request.getParameter("reject");
        LocalDateTime currentDateTime = LocalDateTime.now();
        String date = currentDateTime.toString();
        System.out.println("rentId: " + rentId);
        System.out.println("username: " + username);
        if (btnAccept != null) {
            request.setAttribute("success", "");
            DAO.INSTANCE.updateRentEntity(4, username, date, rentId);
            System.out.println("accept thhanh cong");
        }
        if (btnReject != null) {
            DAO.INSTANCE.updateRentEntity(2, null, null, rentId);
            System.out.println("reject thhanh cong");
        }
//        if (btnAccept == null && btnReject == null) {
//            RentUpdateScheduler scheduler = new RentUpdateScheduler();
//            scheduler.scheduleUpdate(rentId);
//        }
        response.sendRedirect("manageowner?showPendingRequest=true");
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
