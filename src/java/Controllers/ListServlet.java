/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Models.House;
import Models.Paging;
import Models.RentEntity;
import Models.RentEntityType;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Hieu
 */
@WebServlet(name = "ListServlet", urlPatterns = {"/list"})
public class ListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<RentEntity> list;
        list = DAO.INSTANCE.loadRentEntityList(null);
        List<RentEntityType> rentType = DAO.INSTANCE.loadRentEntityTypes();
        List<RentEntity> listTop5 = DAO.INSTANCE.loadRentEntityTop5List();
        String rentEntityIdParam = request.getParameter("rentTypeId");
        if (rentEntityIdParam != null && !rentEntityIdParam.isEmpty()) {
            int rentTypeId = Integer.parseInt(rentEntityIdParam);
            list = DAO.INSTANCE.loadRentEntityList(rentTypeId);
        }
        Map<Integer, House> houseMap = DAO.INSTANCE.loadHouseMap();
        int nrpp = 8;
        int index = -1;
        try {
            index = Integer.parseInt(request.getParameter("index"));
        } catch (Exception e) {
        }
        System.out.println("size:" + list.size());
        Paging p = new Paging(nrpp, index, list.size());
        p.calc();
        System.out.println("house map: " + houseMap.toString());
        request.setAttribute("houseMap", houseMap);
        request.setAttribute("rent", list);
        request.setAttribute("rentTop5", listTop5);
        request.setAttribute("rentType", rentType);
        request.setAttribute("page", p);
        request.getRequestDispatcher("./Views/home.jsp").forward(request, response);
    }

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
