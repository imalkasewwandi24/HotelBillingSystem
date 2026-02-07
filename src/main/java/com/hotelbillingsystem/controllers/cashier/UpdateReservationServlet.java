package com.hotelbillingsystem.controllers.cashier;

import com.hotelbillingsystem.models.Reservation;
import com.hotelbillingsystem.services.ReservationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/cashier/UpdateReservationServlet")
public class UpdateReservationServlet extends HttpServlet {

    private final ReservationService reservationService = new ReservationService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            int r_id = Integer.parseInt(request.getParameter("r_id"));
            String reservationId = request.getParameter("reservationId");
            String guestName = request.getParameter("guestName");
            String nic = request.getParameter("nic");
            String address = request.getParameter("address");
            String contactNumber = request.getParameter("contactNumber");
            String email = request.getParameter("email");
            String roomType = request.getParameter("roomType");
            String checkIn = request.getParameter("checkInDate");
            String checkOut = request.getParameter("checkOutDate");
            String status = request.getParameter("status");

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date checkInDate = sdf.parse(checkIn);
            Date checkOutDate = sdf.parse(checkOut);

            Reservation reservation = new Reservation();
            reservation.setR_id(r_id);
            reservation.setReservationId(reservationId);
            reservation.setGuestName(guestName);
            reservation.setNic(nic);
            reservation.setAddress(address);
            reservation.setContactNumber(contactNumber);
            reservation.setEmail(email);
            reservation.setRoomType(roomType);
            reservation.setCheckInDate(checkInDate);
            reservation.setCheckOutDate(checkOutDate);
            reservation.setStatus(status);

            boolean updated = reservationService.updateReservation(reservation);
            if (updated) {
                session.setAttribute("successMessage", "Reservation updated successfully!");
            } else {
                session.setAttribute("errorMessage", "Failed to update reservation.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Error updating reservation.");
        }

        response.sendRedirect("ViewReservationServlet");
    }
}
