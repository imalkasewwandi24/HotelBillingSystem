package com.hotelbillingsystem.controllers.admin;

import com.hotelbillingsystem.models.Reservation;
import com.hotelbillingsystem.services.ReservationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/ViewReservationServlet")
public class ViewReservationServlet extends HttpServlet {

    private final ReservationService reservationService = new ReservationService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String keyword = request.getParameter("search");
            List<Reservation> reservations;

            if (keyword != null && !keyword.trim().isEmpty()) {
                reservations = reservationService.searchReservations(keyword);
            } else {
                reservations = reservationService.getAllReservations();
            }

            request.setAttribute("reservations", reservations);
            request.getRequestDispatcher("/admin/viewReservation.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("errorMessage", "Error loading reservations.");
            response.sendRedirect("/admin/dashboard.jsp");
        }
    }
}
