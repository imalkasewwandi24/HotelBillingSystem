package com.hotelbillingsystem.dao;

import com.hotelbillingsystem.models.Bill;
import com.hotelbillingsystem.models.BillItem;

import java.util.List;

public interface BillDao {
    boolean saveBillWithItems(Bill bill);

    List<Bill> getAllBills();

    Bill getLatestBillByReservationId(String reservationId);

    Bill getBillById(int billId);

    List<BillItem> getBillItemsByBillId(int billId);
}
