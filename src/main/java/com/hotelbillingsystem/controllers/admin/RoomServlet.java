package com.hotelbillingsystem.controllers.admin;

import com.hotelbillingsystem.models.Room;
import com.hotelbillingsystem.services.RoomService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/RoomServlet")
public class RoomServlet extends HttpServlet {

    private final RoomService roomService = new RoomService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String roomCode = request.getParameter("roomCode");
            String roomName = request.getParameter("roomName");
            String description = request.getParameter("description");
            double pricePerNight = Double.parseDouble(request.getParameter("pricePerNight"));
            int numberOfRooms = Integer.parseInt(request.getParameter("numberOfRooms"));
            int maxGuests = Integer.parseInt(request.getParameter("maxGuests"));
            String roomStatus = request.getParameter("roomStatus");


            Room room = new Room();
            room.setRoomCode(roomCode);
            room.setRoomName(roomName);
            room.setDescription(description);
            room.setPricePerNight(pricePerNight);
            room.setNumberOfRooms(numberOfRooms);
            room.setMaxGuests(maxGuests);
            room.setRoomStatus(roomStatus);


            boolean success = roomService.addRoom(room);

            if (success) {

                response.sendRedirect(request.getContextPath() + "/admin/addRoom.jsp?success=true");
            } else {

                response.sendRedirect(request.getContextPath() + "/admin/addRoom.jsp?error=room_failed");
            }

        } catch (Exception e) {
            e.printStackTrace();

            response.sendRedirect(request.getContextPath() + "/admin/addRoom.jsp?error=room_failed");
        }
    }
}
