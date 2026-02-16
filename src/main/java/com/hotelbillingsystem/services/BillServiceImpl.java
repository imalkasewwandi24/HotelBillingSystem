package com.hotelbillingsystem.services;

import com.hotelbillingsystem.dao.BillDao;
import com.hotelbillingsystem.dao.BillDaoImpl;
import com.hotelbillingsystem.models.Bill;
import com.hotelbillingsystem.models.BillItem;

import java.util.List;

public class BillServiceImpl implements BillService {
    private BillDao billDao = new BillDaoImpl();

    @Override
    public boolean saveBillWithItems(Bill bill) {
        return billDao.saveBillWithItems(bill);
    }

    @Override
    public List<Bill> getAllBills() {
        return billDao.getAllBills();
    }

    @Override
    public Bill getLatestBillByReservationId(String reservationId) {
        return billDao.getLatestBillByReservationId(reservationId);
    }

    @Override
    public Bill getBillById(int billId) {
        return billDao.getBillById(billId);
    }

    @Override
    public List<BillItem> getBillItemsByBillId(int billId) {
        return billDao.getBillItemsByBillId(billId);
    }
}
