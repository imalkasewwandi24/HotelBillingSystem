package com.hotelbillingsystem.models;

import java.sql.Timestamp;
import java.util.List;

public class Bill {
    private int billId;
    private String reservationId;
    private Timestamp billDate;
    private double totalAmount;
    private double discount;
    private double serviceCharge;
    private double grandTotal;
    private String paymentMethod;
    private List<BillItem> items;


    public int getBillId() {
        return billId;
    }
    public void setBillId(int billId) {
        this.billId = billId;
    }

    public String getReservationId() { return reservationId; }
    public void setReservationId(String reservationId) { this.reservationId = reservationId; }

    public double getTotalAmount() {
        return totalAmount;
    }
    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public double getDiscount() {
        return discount;
    }
    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public double getServiceCharge() {
        return serviceCharge;
    }
    public void setServiceCharge(double serviceCharge) {
        this.serviceCharge = serviceCharge;
    }

    public double getGrandTotal() {
        return grandTotal;
    }
    public void setGrandTotal(double grandTotal) {
        this.grandTotal = grandTotal;
    }

    public Timestamp getBillDate() {
        return billDate;
    }
    public void setBillDate(Timestamp billDate) {
        this.billDate = billDate;
    }

    public List<BillItem> getItems() {
        return items;
    }
    public void setItems(List<BillItem> items) {
        this.items = items;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }
    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }
}
