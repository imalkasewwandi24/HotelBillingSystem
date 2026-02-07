package com.hotelbillingsystem.controllers.cashier;

import com.hotelbillingsystem.models.Reservation;
import com.hotelbillingsystem.services.ReservationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/cashier/EditReservationServlet")
public class EditReservationServlet extends HttpServlet {

    private final ReservationService reservationService = new ReservationService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int r_id = Integer.parseInt(request.getParameter("r_id"));
            Reservation reservation = reservationService.getReservationById(r_id);

            if (reservation != null) {
                request.setAttribute("reservation", reservation);
                request.getRequestDispatcher("/cashier/editReservation.jsp").forward(request, response);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", "Reservation not found.");
                response.sendRedirect("ViewReservationServlet");
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("ViewReservationServlet");
        }
    }
}
