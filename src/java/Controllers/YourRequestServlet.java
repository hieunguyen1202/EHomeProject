/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Models.House;
import Models.RentEntity;
import Models.Users;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
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
public class YourRequestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
        } else {
            Map<String, Users> userMap = DAO.INSTANCE.loadCreateBy();
            Map<Integer, House> houseMap = DAO.INSTANCE.loadHouseMap();
            List<RentEntity> rent = DAO.INSTANCE.getRentEntityDeposit(user.getUsername());
            request.setAttribute("houseMap", houseMap);
            request.setAttribute("userMap", userMap);
            request.setAttribute("rent", rent);
            request.getRequestDispatcher("Views/yourRequest.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        int rentId = Integer.parseInt(request.getParameter("rentEntityId"));
        String btnCancel = request.getParameter("cancel");
        System.out.println("rentId: " + rentId);
        System.out.println("username: " + username);
        boolean updateRent = DAO.INSTANCE.updateRentEntity(4, null, null, rentId);
        if (btnCancel != null && updateRent) {
            System.out.println("Cancel thanh cong");
        }
        response.sendRedirect("yourRequest");
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
