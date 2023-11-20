/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Models.City;
import Models.District;
import Models.House;
import Models.RentEntity;
import Models.RentEntityType;
import Models.Ward;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;
import java.util.Vector;

/**
 *
 * @author Hieu
 */
public class SearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map<Integer, RentEntityType> rentMap = DAO.INSTANCE.loadRentEntityType();
        Map<Integer, City> cityMap = DAO.INSTANCE.loadCity();
        Map<Integer, Ward> wardMap = DAO.INSTANCE.loadWard();
        Map<Integer, District> districtMap = DAO.INSTANCE.loadDistrict();
        request.setAttribute("rentMap", rentMap);
        request.setAttribute("cityMap", cityMap);
        request.setAttribute("wardMap", wardMap);
        request.setAttribute("districtMap", districtMap);
        request.getRequestDispatcher("Views/search.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String txt = request.getParameter("name"); // Retrieve the search text from the form
        int selectedCity = Integer.parseInt(request.getParameter("city"));
        int selectedDistrict = Integer.parseInt(request.getParameter("district"));
        int selectedWard = Integer.parseInt(request.getParameter("ward"));
        int selectedRentType = Integer.parseInt(request.getParameter("rentType"));

        System.out.println("city: " + selectedCity);
        System.out.println("district: " + selectedDistrict);
        System.out.println("ward: " + selectedWard);
        System.out.println("rent: " + selectedRentType);
        System.out.println("txt: " + txt);
        Map<Integer, House> houseMap = DAO.INSTANCE.loadHouseMap();
        List<RentEntity> searchResults = DAO.INSTANCE.searchRentEntities(selectedWard, selectedDistrict, selectedCity, selectedRentType, txt);
        request.setAttribute("houseMap", houseMap);
        request.setAttribute("searchResults", searchResults);
        request.getRequestDispatcher("Views/search.jsp").forward(request, response);
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
