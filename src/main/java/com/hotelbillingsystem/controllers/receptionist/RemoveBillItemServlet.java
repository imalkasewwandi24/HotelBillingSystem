package com.hotelbillingsystem.controllers.receptionist;

import com.hotelbillingsystem.models.BillItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/receptionist/RemoveBillItemServlet")
public class RemoveBillItemServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int roomId = Integer.parseInt(request.getParameter("roomId"));

        HttpSession session = request.getSession();
        List<BillItem> billItems = (List<BillItem>) session.getAttribute("billItems");

        if (billItems != null) {
            billItems.removeIf(item -> item.getRoomId() == roomId);
            session.setAttribute("billItems", billItems);
        }

        response.sendRedirect(request.getContextPath() + "/receptionist/generateBill.jsp");
    }
}