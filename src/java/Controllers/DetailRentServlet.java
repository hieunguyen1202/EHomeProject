/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;
//            AND [DepositTime] > DATEADD(SECOND, -40, GETDATE())
import DAL.DAO;
import Models.House;
import Models.RentEntity;
import Models.Users;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Hieu
 */
public class DetailRentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        if (user != null) {
            int rentEntityId = Integer.parseInt(request.getParameter("rentEntityId"));
            RentEntity rent = DAO.INSTANCE.getRentEntityById(rentEntityId);
            int houseId = rent.getHouseId();
            House house = DAO.INSTANCE.getHouseById(houseId);
            Map<Integer, House> houseMap = DAO.INSTANCE.loadHouseMap();
            Map<String, Users> userMap = DAO.INSTANCE.loadCreateBy();

            Users u = DAO.INSTANCE.getUserByUsernameOnly(user.getUsername());

            request.setAttribute("houseMap", houseMap);
            request.setAttribute("userMap", userMap);
            request.setAttribute("house", house);
            request.setAttribute("userinfo", u);
            request.setAttribute("rent", rent);
            request.getRequestDispatcher("Views/detailRent.jsp").forward(request, response);
        } else {
            int rentEntityId = Integer.parseInt(request.getParameter("rentEntityId"));
            RentEntity rent = DAO.INSTANCE.getRentEntityById(rentEntityId);
            int houseId = rent.getHouseId();
            House house = DAO.INSTANCE.getHouseById(houseId);
            Map<Integer, House> houseMap = DAO.INSTANCE.loadHouseMap();
            Map<String, Users> userMap = DAO.INSTANCE.loadCreateBy();
            request.setAttribute("houseMap", houseMap);
            request.setAttribute("userMap", userMap);
            request.setAttribute("house", house);
            request.setAttribute("rent", rent);
            request.getRequestDispatcher("Views/detailRent.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        int rentId = Integer.parseInt(request.getParameter("rentEntityId"));
        System.out.println("rentId: " + rentId);
        System.out.println("username: " + username);
        LocalDateTime currentDateTime = LocalDateTime.now();
        String date = currentDateTime.toString();
        boolean updateRent = DAO.INSTANCE.updateRentEntity(1, username, date, rentId);
        if (updateRent) {
            request.setAttribute("success", "Please wait for a response from the owner.");
            System.out.println("request rent thanh cong");
        } else {
            request.setAttribute("error", "Sent request error.");
            System.out.println("request rent that bai");
        }
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
