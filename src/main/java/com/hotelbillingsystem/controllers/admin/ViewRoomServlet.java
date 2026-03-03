package com.hotelbillingsystem.controllers.admin;

import com.hotelbillingsystem.models.Room;
import com.hotelbillingsystem.services.RoomService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/ViewRoomServlet")
public class ViewRoomServlet extends HttpServlet {

    private final RoomService roomService = new RoomService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        try {
            String action = request.getParameter("action");

            /*Delete */
            if ("delete".equalsIgnoreCase(action)) {
                int roomId = Integer.parseInt(request.getParameter("roomId"));
                boolean deleted = roomService.deleteRoom(roomId);
                if (deleted) {
                    session.setAttribute("successMessage", "Room deleted successfully!");
                } else {
                    session.setAttribute("errorMessage", "Failed to delete room.");
                }
            }

            /*Search room */
            String keyword = request.getParameter("search");
            List<Room> rooms;
            if (keyword != null && !keyword.trim().isEmpty()) {
                rooms = roomService.searchRooms(keyword); // search by room code, room name
            } else {
                rooms = roomService.getAllRooms();
            }

            request.setAttribute("rooms", rooms);
            request.getRequestDispatcher("/admin/viewRooms.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Error processing rooms.");
            response.sendRedirect(request.getContextPath() + "/admin/viewRooms.jsp");
        }
    }
}
