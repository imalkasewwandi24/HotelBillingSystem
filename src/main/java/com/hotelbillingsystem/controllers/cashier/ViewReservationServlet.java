package com.hotelbillingsystem.controllers.cashier;

import com.hotelbillingsystem.models.Reservation;
import com.hotelbillingsystem.services.ReservationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/cashier/ViewReservationServlet")
public class ViewReservationServlet extends HttpServlet {

    private final ReservationService reservationService = new ReservationService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            String action = request.getParameter("action");

            /* DELETE */
            if ("delete".equalsIgnoreCase(action)) {
                int r_id = Integer.parseInt(request.getParameter("r_id"));
                boolean deleted = reservationService.deleteReservation(r_id);
                if (deleted) {
                    session.setAttribute("successMessage", "Reservation deleted successfully!");
                } else {
                    session.setAttribute("errorMessage", "Failed to delete reservation.");
                }
            }

            /* Status change */
            if ("status".equalsIgnoreCase(action)) {
                int r_id = Integer.parseInt(request.getParameter("r_id"));
                String status = request.getParameter("status"); // CHECKED_IN / CHECKED_OUT
                boolean updated = reservationService.updateStatus(r_id, status);
                if (updated) {
                    session.setAttribute("successMessage", "Reservation status updated successfully!");
                } else {
                    session.setAttribute("errorMessage", "Failed to update status.");
                }
            }

            /* View All and Search */
            String keyword = request.getParameter("search");
            List<Reservation> reservations;
            if (keyword != null && !keyword.trim().isEmpty()) {
                reservations = reservationService.searchReservations(keyword); // search by NIC, or Reservation ID
            } else {
                reservations = reservationService.getAllReservations();
            }

            request.setAttribute("reservations", reservations);
            request.getRequestDispatcher("/cashier/viewReservation.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Error processing reservations.");
            response.sendRedirect(request.getContextPath() + "/cashier/viewReservation.jsp");
        }
    }
}
