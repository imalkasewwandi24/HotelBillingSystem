package com.hotelbillingsystem.controllers.cashier;

import com.hotelbillingsystem.models.Bill;
import com.hotelbillingsystem.services.BillService;
import com.hotelbillingsystem.services.BillServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/cashier/ViewBillServlet")
public class ViewBillServlet extends HttpServlet {
    private BillService billService = new BillServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get all bills
        List<Bill> billList = billService.getAllBills();
        request.setAttribute("bills", billList);

        request.getRequestDispatcher("/cashier/billRecords.jsp").forward(request, response);
    }
}
