/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Models.City;
import Models.District;
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

/**
 *
 * @author Hieu
 */
public class SearchAjax extends HttpServlet {

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
        List<RentEntity> searchResults = DAO.INSTANCE.search(txt);
        request.setAttribute("searchResults", searchResults);
        doGet(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
