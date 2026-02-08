package com.hotelbillingsystem.controllers.admin;

import com.hotelbillingsystem.models.Room;
import com.hotelbillingsystem.services.RoomService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/UpdateRoomServlet")
public class UpdateRoomServlet extends HttpServlet {

    private final RoomService roomService = new RoomService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        try {
            int roomId = Integer.parseInt(request.getParameter("roomId"));
            String roomCode = request.getParameter("roomCode");
            String roomName = request.getParameter("roomName");
            String description = request.getParameter("description");
            double pricePerNight = Double.parseDouble(request.getParameter("pricePerNight"));
            int numberOfRooms = Integer.parseInt(request.getParameter("numberOfRooms"));
            int maxGuests = Integer.parseInt(request.getParameter("maxGuests"));
            String roomStatus = request.getParameter("roomStatus");

            // Create Room object
            Room room = new Room();
            room.setRoomId(roomId);
            room.setRoomCode(roomCode);
            room.setRoomName(roomName);
            room.setDescription(description);
            room.setPricePerNight(pricePerNight);
            room.setNumberOfRooms(numberOfRooms);
            room.setMaxGuests(maxGuests);
            room.setRoomStatus(roomStatus);

            // Update Room
            boolean updated = roomService.updateRoom(room);

            if (updated) {
                session.setAttribute("successMessage", "Room updated successfully!");
            } else {
                session.setAttribute("errorMessage", "Failed to update room.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Error updating room.");
        }

        response.sendRedirect("ViewRoomServlet");
    }
}
