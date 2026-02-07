package com.hotelbillingsystem.dao;

import com.hotelbillingsystem.models.Reservation;
import com.hotelbillingsystem.utils.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReservationDao {

    /* Add New Reservation */
    public void addReservation(Reservation r) throws SQLException {
        Connection con = DBConnection.getConnection();
        String sql = "INSERT INTO reservations " +
                "(reservation_id, guest_name, nic, address, contact_number, email, room_type, check_in_date, check_out_date, status) " +
                "VALUES (?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, r.getReservationId());
        ps.setString(2, r.getGuestName());
        ps.setString(3, r.getNic());
        ps.setString(4, r.getAddress());
        ps.setString(5, r.getContactNumber());
        ps.setString(6, r.getEmail());
        ps.setString(7, r.getRoomType());
        ps.setDate(8, new java.sql.Date(r.getCheckInDate().getTime()));
        ps.setDate(9, new java.sql.Date(r.getCheckOutDate().getTime()));
        ps.setString(10, r.getStatus());
        ps.executeUpdate();
    }

    /* Get All Reservations */
    public List<Reservation> getAllReservations() throws SQLException {
        List<Reservation> list = new ArrayList<>();
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM reservations";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);

        while(rs.next()) {
            Reservation r = new Reservation();
            r.setR_id(rs.getInt("r_id"));
            r.setReservationId(rs.getString("reservation_id"));
            r.setGuestName(rs.getString("guest_name"));
            r.setNic(rs.getString("nic"));
            r.setAddress(rs.getString("address"));
            r.setContactNumber(rs.getString("contact_number"));
            r.setEmail(rs.getString("email"));
            r.setRoomType(rs.getString("room_type"));
            r.setCheckInDate(rs.getDate("check_in_date"));
            r.setCheckOutDate(rs.getDate("check_out_date"));
            r.setStatus(rs.getString("status"));
            list.add(r);
        }

        return list;
    }

    /* Get Reservation by r_id */
    public Reservation getReservationById(int r_id) throws SQLException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM reservations WHERE r_id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, r_id);
        ResultSet rs = ps.executeQuery();

        if(rs.next()) {
            Reservation r = new Reservation();
            r.setR_id(rs.getInt("r_id"));
            r.setReservationId(rs.getString("reservation_id"));
            r.setGuestName(rs.getString("guest_name"));
            r.setNic(rs.getString("nic"));
            r.setAddress(rs.getString("address"));
            r.setContactNumber(rs.getString("contact_number"));
            r.setEmail(rs.getString("email"));
            r.setRoomType(rs.getString("room_type"));
            r.setCheckInDate(rs.getDate("check_in_date"));
            r.setCheckOutDate(rs.getDate("check_out_date"));
            r.setStatus(rs.getString("status"));
            return r;
        }

        return null;
    }

    /* Search by NIC or reservation_id */
    public List<Reservation> searchReservation(String keyword) throws SQLException {
        List<Reservation> list = new ArrayList<>();
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM reservations WHERE nic LIKE ? OR reservation_id LIKE ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, "%" + keyword + "%");
        ps.setString(2, "%" + keyword + "%");
        ResultSet rs = ps.executeQuery();

        while(rs.next()) {
            Reservation r = new Reservation();
            r.setR_id(rs.getInt("r_id"));
            r.setReservationId(rs.getString("reservation_id"));
            r.setGuestName(rs.getString("guest_name"));
            r.setNic(rs.getString("nic"));
            r.setAddress(rs.getString("address"));
            r.setContactNumber(rs.getString("contact_number"));
            r.setEmail(rs.getString("email"));
            r.setRoomType(rs.getString("room_type"));
            r.setCheckInDate(rs.getDate("check_in_date"));
            r.setCheckOutDate(rs.getDate("check_out_date"));
            r.setStatus(rs.getString("status"));
            list.add(r);
        }

        return list;
    }

    /* Update Reservation */
    public boolean updateReservation(Reservation r) throws SQLException {
        Connection con = DBConnection.getConnection();
        String sql = "UPDATE reservations SET reservation_id=?, guest_name=?, nic=?, address=?, contact_number=?, email=?, room_type=?, check_in_date=?, check_out_date=?, status=? WHERE r_id=?";
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, r.getReservationId());
        ps.setString(2, r.getGuestName());
        ps.setString(3, r.getNic());
        ps.setString(4, r.getAddress());
        ps.setString(5, r.getContactNumber());
        ps.setString(6, r.getEmail());
        ps.setString(7, r.getRoomType());
        ps.setDate(8, new java.sql.Date(r.getCheckInDate().getTime()));
        ps.setDate(9, new java.sql.Date(r.getCheckOutDate().getTime()));
        ps.setString(10, r.getStatus());
        ps.setInt(11, r.getR_id());

        int rows = ps.executeUpdate();

        return rows > 0;
    }

    /* Delete Reservation */
    public void deleteReservation(int r_id) throws SQLException {
        Connection con = DBConnection.getConnection();
        String sql = "DELETE FROM reservations WHERE r_id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, r_id);
        ps.executeUpdate();
    }

    /* Update Reservation status */
    public boolean updateStatus(int r_id, String status) throws SQLException {
        Connection con = DBConnection.getConnection();
        String sql = "UPDATE reservations SET status=? WHERE r_id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, status);
        ps.setInt(2, r_id);
        int updated = ps.executeUpdate();
        return updated > 0;
    }


}
