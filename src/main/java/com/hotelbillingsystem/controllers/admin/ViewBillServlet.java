package com.hotelbillingsystem.controllers.admin;

import com.hotelbillingsystem.models.Bill;
import com.hotelbillingsystem.services.BillService;
import com.hotelbillingsystem.services.BillServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/ViewBillServlet")
public class ViewBillServlet extends HttpServlet {

    private BillService billService = new BillServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        List<Bill> billList = billService.getAllBills();
        request.setAttribute("bills", billList);


        request.getRequestDispatcher("/admin/billRecords.jsp")
                .forward(request, response);
    }
}
