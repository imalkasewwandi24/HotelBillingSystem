package com.hotelbillingsystem.controllers.cashier;

import com.hotelbillingsystem.models.Room;
import com.hotelbillingsystem.services.RoomService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/cashier/ViewRoomServlet")
public class ViewRoomServlet extends HttpServlet {

    private final RoomService roomService = new RoomService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String keyword = request.getParameter("search");
            List<Room> rooms;

            if (keyword != null && !keyword.trim().isEmpty()) {
                rooms = roomService.searchRooms(keyword); // search by code or name
            } else {
                rooms = roomService.getAllRooms();
            }

            request.setAttribute("rooms", rooms);
            request.getRequestDispatcher("/cashier/viewRooms.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("errorMessage", "Error loading rooms.");
            response.sendRedirect(request.getContextPath() + "/cashier/dashboard.jsp");
        }
    }
}
