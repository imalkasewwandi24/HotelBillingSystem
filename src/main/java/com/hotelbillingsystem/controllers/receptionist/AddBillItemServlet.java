package com.hotelbillingsystem.controllers.receptionist;

import com.hotelbillingsystem.models.BillItem;
import com.hotelbillingsystem.models.Room;
import com.hotelbillingsystem.services.RoomService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/receptionist/AddBillItemServlet")
public class AddBillItemServlet extends HttpServlet {

    private final RoomService roomService = new RoomService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String roomIdStr = req.getParameter("roomId");
        String nightsStr = req.getParameter("nights");

        if (roomIdStr == null || nightsStr == null) {
            resp.sendRedirect("generateBill.jsp");
            return;
        }

        int roomId;
        int nights;
        try {
            roomId = Integer.parseInt(roomIdStr);
            nights = Integer.parseInt(nightsStr);
            if (nights < 1) nights = 1;
        } catch (NumberFormatException e) {
            resp.sendRedirect("generateBill.jsp");
            return;
        }

        Room room = roomService.getRoomById(roomId);
        if (room == null) {
            resp.sendRedirect("generateBill.jsp");
            return;
        }

        HttpSession session = req.getSession();
        List<BillItem> billItems = (List<BillItem>) session.getAttribute("billItems");
        if (billItems == null) {
            billItems = new ArrayList<>();
        }

        boolean updated = false;
        for (BillItem bi : billItems) {
            if (bi.getRoomId() == roomId) {
                bi.setNights(bi.getNights() + nights);
                bi.setRoomPrice(room.getPricePerNight());
                bi.setTotalPrice(bi.getRoomPrice() * bi.getNights());
                updated = true;
                break;
            }
        }

        if (!updated) {
            BillItem newItem = new BillItem();
            newItem.setRoomId(roomId);
            newItem.setNights(nights);
            newItem.setRoomPrice(room.getPricePerNight());
            newItem.setTotalPrice(room.getPricePerNight() * nights);
            billItems.add(newItem);
        }

        session.setAttribute("billItems", billItems);
        resp.sendRedirect("generateBill.jsp");
    }
}
