package com.hotelbillingsystem.services;

import com.hotelbillingsystem.models.Bill;
import com.hotelbillingsystem.models.BillItem;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.util.Arrays;
import java.util.List;

public class BillServiceTest {

    private BillService billService;

    @Before
    public void setup() {
        billService = new BillServiceImpl();
    }

    @Test
    public void testGetAllBills() {
        List<Bill> bills = billService.getAllBills();

        Assert.assertNotNull(bills);
        Assert.assertTrue(bills.size() > 0);

        for (Bill bill : bills) {
            System.out.println(
                    bill.getBillId() + ", " +
                            bill.getReservationId() + ", " +
                            bill.getBillDate() + ", " +
                            bill.getTotalAmount() + ", " +
                            bill.getGrandTotal() + ", " +
                            bill.getPaymentMethod()
            );
        }
    }

    @Test
    public void testGetBillById() {
        Bill bill = billService.getBillById(2);

        Assert.assertNotNull(bill);

        System.out.println(
                bill.getBillId() + ", " +
                        bill.getReservationId() + ", " +
                        bill.getBillDate() + ", " +
                        bill.getTotalAmount() + ", " +
                        bill.getGrandTotal() + ", " +
                        bill.getPaymentMethod()
        );
    }

    @Test
    public void testGetLatestBillByReservationId() {
        Bill bill = billService.getLatestBillByReservationId("RES002");

        Assert.assertNotNull(bill);

        System.out.println(
                bill.getBillId() + ", " +
                        bill.getGrandTotal() + ", " +
                        bill.getPaymentMethod()
        );
    }

    @Test
    public void testGetBillItemsByBillId() {
        List<BillItem> items = billService.getBillItemsByBillId(2);

        Assert.assertNotNull(items);
        Assert.assertTrue(items.size() > 0);

        for (BillItem item : items) {
            System.out.println(
                    item.getId() + ", " +
                            item.getBillId() + ", " +
                            item.getRoomId() + ", " +
                            item.getNights() + ", " +
                            item.getRoomPrice() + ", " +
                            item.getTotalPrice()
            );
        }
    }

    @Test
    public void testSaveBillWithItems() {
        Bill bill = new Bill();
        bill.setReservationId("RESTEST");
        bill.setBillDate(new java.sql.Timestamp(System.currentTimeMillis()));
        bill.setTotalAmount(1000.0);
        bill.setDiscount(50.0);
        bill.setServiceCharge(100.0);
        bill.setGrandTotal(1050.0);
        bill.setPaymentMethod("Cash");

        BillItem item = new BillItem();
        item.setRoomId(1);
        item.setNights(2);
        item.setRoomPrice(500.0);
        item.setTotalPrice(1000.0);

        bill.setItems(Arrays.asList(item));

        boolean saved = billService.saveBillWithItems(bill);

        Assert.assertTrue(saved);
    }
}