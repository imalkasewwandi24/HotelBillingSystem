package com.hotelbillingsystem.services;

import com.hotelbillingsystem.models.Bill;
import com.hotelbillingsystem.models.BillItem;

import java.util.List;

public interface BillService {
    boolean saveBillWithItems(Bill bill);

    List<Bill> getAllBills();

    Bill getLatestBillByReservationId(String reservationId);

    List<BillItem> getBillItemsByBillId(int billId);

    Bill getBillById(int billId);
}
