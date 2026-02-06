package com.hotelbillingsystem.controllers.cashier;

import com.hotelbillingsystem.models.Reservation;
import com.hotelbillingsystem.services.ReservationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/cashier/ReservationServlet")
public class ReservationServlet extends HttpServlet {

    private final ReservationService reservationService = new ReservationService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            /* Read form data */
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

            /* parse dates */
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date checkInDate = sdf.parse(checkIn);
            Date checkOutDate = sdf.parse(checkOut);

            /* create reservation object */
            Reservation reservation = new Reservation();
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

            /* add reservation */
            boolean success = reservationService.addReservation(reservation);

            if (success) {

                response.sendRedirect(request.getContextPath() + "/cashier/addReservation.jsp?success=true");
            } else {

                response.sendRedirect(request.getContextPath() + "/cashier/addReservation.jsp?error=reservation_failed");
            }

        } catch (Exception e) {
            e.printStackTrace();

            response.sendRedirect(request.getContextPath() + "/cashier/addReservation.jsp?error=reservation_failed");
        }
    }
}
