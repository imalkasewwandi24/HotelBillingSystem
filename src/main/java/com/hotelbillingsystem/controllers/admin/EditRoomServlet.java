package com.hotelbillingsystem.controllers.admin;

import com.hotelbillingsystem.models.Room;
import com.hotelbillingsystem.services.RoomService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/EditRoomServlet")
public class EditRoomServlet extends HttpServlet {

    private final RoomService roomService = new RoomService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get roomId parameter
            int roomId = Integer.parseInt(request.getParameter("roomId"));

            // Fetch room from service
            Room room = roomService.getRoomById(roomId);

            if (room != null) {
                // Pass room object to JSP
                request.setAttribute("room", room);
                request.getRequestDispatcher("/admin/editRoom.jsp").forward(request, response);
            } else {
                // Room not found → redirect with error
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", "Room not found.");
                response.sendRedirect("ViewRoomServlet");
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("ViewRoomServlet");
        }
    }
}
