package com.hotelbillingsystem.dao;

import com.hotelbillingsystem.models.Bill;
import com.hotelbillingsystem.models.BillItem;
import com.hotelbillingsystem.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BillDaoImpl implements BillDao {
    private Connection conn = DBConnection.getConnection();

    @Override
    public boolean saveBillWithItems(Bill bill) {
        String billSql = "INSERT INTO bills (reservation_id, bill_date, total_amount, discount, service_charge, grand_total, payment_method) VALUES (?, ?, ?, ?, ?, ?, ?)";
        String itemSql = "INSERT INTO bill_items (bill_id, room_id, nights, room_price, total_price) VALUES (?, ?, ?, ?, ?)";

        try {
            conn.setAutoCommit(false);

            try (PreparedStatement billStmt = conn.prepareStatement(billSql, Statement.RETURN_GENERATED_KEYS)) {

                billStmt.setString(1, bill.getReservationId());
                billStmt.setTimestamp(2, bill.getBillDate());
                billStmt.setDouble(3, bill.getTotalAmount());
                billStmt.setDouble(4, bill.getDiscount());
                billStmt.setDouble(5, bill.getServiceCharge());
                billStmt.setDouble(6, bill.getGrandTotal());
                billStmt.setString(7, bill.getPaymentMethod());

                int billResult = billStmt.executeUpdate();
                if (billResult == 0) {
                    conn.rollback();
                    return false;
                }

                try (ResultSet rs = billStmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        int billId = rs.getInt(1);

                        try (PreparedStatement itemStmt = conn.prepareStatement(itemSql)) {
                            for (BillItem item : bill.getItems()) {
                                itemStmt.setInt(1, billId);
                                itemStmt.setInt(2, item.getRoomId());
                                itemStmt.setInt(3, item.getNights());
                                itemStmt.setDouble(4, item.getRoomPrice());
                                itemStmt.setDouble(5, item.getTotalPrice());
                                itemStmt.addBatch();
                            }

                            int[] results = itemStmt.executeBatch();
                            for (int result : results) {
                                if (result == PreparedStatement.EXECUTE_FAILED) {
                                    conn.rollback();
                                    return false;
                                }
                            }
                        }
                    } else {
                        conn.rollback();
                        return false;
                    }
                }
            }

            conn.commit();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
            return false;
        } finally {
            try { conn.setAutoCommit(true); } catch (SQLException e) { e.printStackTrace(); }
        }
    }

    @Override
    public List<Bill> getAllBills() {
        List<Bill> list = new ArrayList<>();
        String sql = "SELECT * FROM bills ORDER BY bill_id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Bill bill = new Bill();

                bill.setBillId(rs.getInt("bill_id"));
                bill.setReservationId(rs.getString("reservation_id"));
                bill.setBillDate(rs.getTimestamp("bill_date"));
                bill.setTotalAmount(rs.getDouble("total_amount"));
                bill.setDiscount(rs.getDouble("discount"));
                bill.setServiceCharge(rs.getDouble("service_charge"));
                bill.setGrandTotal(rs.getDouble("grand_total"));
                bill.setPaymentMethod(rs.getString("payment_method"));

                list.add(bill);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }


    @Override
    public Bill getLatestBillByReservationId(String reservationId) {
        String sql = "SELECT * FROM bills WHERE reservation_id = ? ORDER BY bill_id DESC LIMIT 1";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, reservationId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Bill bill = new Bill();
                    bill.setBillId(rs.getInt("bill_id"));
                    bill.setReservationId(rs.getString("reservation_id")); // String
                    bill.setBillDate(rs.getTimestamp("bill_date"));
                    bill.setDiscount(rs.getDouble("discount"));
                    bill.setServiceCharge(rs.getDouble("service_charge"));
                    bill.setGrandTotal(rs.getDouble("grand_total"));
                    bill.setPaymentMethod(rs.getString("payment_method"));
                    return bill;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Bill getBillById(int billId) {
        Bill bill = null;
        String sql = "SELECT * FROM bills WHERE bill_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, billId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    bill = new Bill();
                    bill.setBillId(rs.getInt("bill_id"));
                    bill.setReservationId(rs.getString("reservation_id")); // String
                    bill.setBillDate(rs.getTimestamp("bill_date"));
                    bill.setTotalAmount(rs.getDouble("total_amount"));
                    bill.setDiscount(rs.getDouble("discount"));
                    bill.setServiceCharge(rs.getDouble("service_charge"));
                    bill.setGrandTotal(rs.getDouble("grand_total"));
                    bill.setPaymentMethod(rs.getString("payment_method"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bill;
    }

    @Override
    public List<BillItem> getBillItemsByBillId(int billId) {
        List<BillItem> items = new ArrayList<>();
        String sql = "SELECT * FROM bill_items WHERE bill_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, billId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    BillItem item = new BillItem();
                    item.setBillId(rs.getInt("bill_id"));
                    item.setRoomId(rs.getInt("room_id"));
                    item.setNights(rs.getInt("nights"));
                    item.setRoomPrice(rs.getDouble("room_price"));
                    item.setTotalPrice(rs.getDouble("total_price"));
                    items.add(item);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return items;
    }
}
