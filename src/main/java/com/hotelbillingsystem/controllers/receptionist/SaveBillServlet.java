package com.hotelbillingsystem.controllers.receptionist;

import com.hotelbillingsystem.models.Bill;
import com.hotelbillingsystem.models.BillItem;
import com.hotelbillingsystem.services.BillService;
import com.hotelbillingsystem.services.BillServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/receptionist/SaveBillServlet")
public class SaveBillServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();

        try {
            String reservationId = request.getParameter("reservationId");
            double discount = Double.parseDouble(request.getParameter("discount"));
            double serviceCharge = Double.parseDouble(request.getParameter("serviceCharge"));
            double grandTotal = Double.parseDouble(request.getParameter("grandTotal"));
            String paymentMethod = request.getParameter("paymentMethod");

            List<BillItem> items = (List<BillItem>) session.getAttribute("billItems");

            if (items == null || items.isEmpty()) {
                session.setAttribute("message", "Please add at least one room.");
                session.setAttribute("messageType", "error");
                response.sendRedirect("generateBill.jsp");
                return;
            }

            Bill bill = new Bill();
            bill.setReservationId(reservationId);
            bill.setBillDate(new java.sql.Timestamp(System.currentTimeMillis()));
            bill.setDiscount(discount);
            bill.setServiceCharge(serviceCharge);
            bill.setGrandTotal(grandTotal);
            bill.setPaymentMethod(paymentMethod);
            bill.setItems(items);



            BillService billService = new BillServiceImpl();
            boolean saved = billService.saveBillWithItems(bill);

            if (saved) {
                session.setAttribute("message", "Bill saved successfully!");
                session.setAttribute("messageType", "success");
                session.removeAttribute("billItems");
            } else {
                session.setAttribute("message", "Failed to save bill.");
                session.setAttribute("messageType", "error");
            }

            response.sendRedirect("generateBill.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("message", "Error saving bill: " + e.getMessage());
            session.setAttribute("messageType", "error");
            response.sendRedirect("generateBill.jsp");
        }
    }
}