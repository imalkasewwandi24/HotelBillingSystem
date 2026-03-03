package com.hotelbillingsystem.controllers.receptionist;

import com.hotelbillingsystem.models.Bill;
import com.hotelbillingsystem.models.BillItem;
import com.hotelbillingsystem.services.BillService;
import com.hotelbillingsystem.services.BillServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/receptionist/BillPreviewServlet")
public class BillPreviewServlet extends HttpServlet {

    private BillService billService = new BillServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        String billIdStr = request.getParameter("billId");
        if (billIdStr == null || billIdStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/receptionist/ViewBillServlet");
            return;
        }

        int billId;
        try {
            billId = Integer.parseInt(billIdStr);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/receptionist/ViewBillServlet");
            return;
        }


        Bill bill = billService.getBillById(billId);
        List<BillItem> items = billService.getBillItemsByBillId(billId);

        if (bill == null) {
            response.sendRedirect(request.getContextPath() + "/receptionist/ViewBillServlet");
            return;
        }


        request.setAttribute("bill", bill);
        request.setAttribute("items", items);
        request.getRequestDispatcher("/receptionist/billPreview.jsp").forward(request, response);
    }
}
