package com.hotelbillingsystem.dao;

import com.hotelbillingsystem.models.Room;
import com.hotelbillingsystem.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomDao {

    /* Add New Room */
    public void addRoom(Room room) throws SQLException {
        Connection con = DBConnection.getConnection();
        String sql = "INSERT INTO rooms " +
                "(room_code, room_name, description, price_per_night, number_of_rooms, max_guests, room_status) " +
                "VALUES (?,?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, room.getRoomCode());
        ps.setString(2, room.getRoomName());
        ps.setString(3, room.getDescription());
        ps.setDouble(4, room.getPricePerNight());
        ps.setInt(5, room.getNumberOfRooms());
        ps.setInt(6, room.getMaxGuests());
        ps.setString(7, room.getRoomStatus());
        ps.executeUpdate();
    }

    /* Get All Rooms */
    public List<Room> getAllRooms() throws SQLException {
        List<Room> list = new ArrayList<>();
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM rooms";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);

        while (rs.next()) {
            Room room = new Room();
            room.setRoomId(rs.getInt("room_id"));
            room.setRoomCode(rs.getString("room_code"));
            room.setRoomName(rs.getString("room_name"));
            room.setDescription(rs.getString("description"));
            room.setPricePerNight(rs.getDouble("price_per_night"));
            room.setNumberOfRooms(rs.getInt("number_of_rooms"));
            room.setMaxGuests(rs.getInt("max_guests"));
            room.setRoomStatus(rs.getString("room_status"));
            list.add(room);
        }

        return list;
    }

    /*  Get Room by ID */
    public Room getRoomById(int roomId) throws SQLException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM rooms WHERE room_id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, roomId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            Room room = new Room();
            room.setRoomId(rs.getInt("room_id"));
            room.setRoomCode(rs.getString("room_code"));
            room.setRoomName(rs.getString("room_name"));
            room.setDescription(rs.getString("description"));
            room.setPricePerNight(rs.getDouble("price_per_night"));
            room.setNumberOfRooms(rs.getInt("number_of_rooms"));
            room.setMaxGuests(rs.getInt("max_guests"));
            room.setRoomStatus(rs.getString("room_status"));
            return room;
        }

        return null;
    }

    /* Search Rooms by Code or Name */
    public List<Room> searchRooms(String keyword) throws SQLException {
        List<Room> list = new ArrayList<>();
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM rooms WHERE room_code LIKE ? OR room_name LIKE ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, "%" + keyword + "%");
        ps.setString(2, "%" + keyword + "%");
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Room room = new Room();
            room.setRoomId(rs.getInt("room_id"));
            room.setRoomCode(rs.getString("room_code"));
            room.setRoomName(rs.getString("room_name"));
            room.setDescription(rs.getString("description"));
            room.setPricePerNight(rs.getDouble("price_per_night"));
            room.setNumberOfRooms(rs.getInt("number_of_rooms"));
            room.setMaxGuests(rs.getInt("max_guests"));
            room.setRoomStatus(rs.getString("room_status"));
            list.add(room);
        }

        return list;
    }

    /* Update Room */
    public boolean updateRoom(Room room) throws SQLException {
        Connection con = DBConnection.getConnection();
        String sql = "UPDATE rooms SET room_code=?, room_name=?, description=?, price_per_night=?, number_of_rooms=?, max_guests=?, room_status=? WHERE room_id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, room.getRoomCode());
        ps.setString(2, room.getRoomName());
        ps.setString(3, room.getDescription());
        ps.setDouble(4, room.getPricePerNight());
        ps.setInt(5, room.getNumberOfRooms());
        ps.setInt(6, room.getMaxGuests());
        ps.setString(7, room.getRoomStatus());
        ps.setInt(8, room.getRoomId());

        int rows = ps.executeUpdate();
        return rows > 0;
    }

    /* Delete Room */
    public void deleteRoom(int roomId) throws SQLException {
        Connection con = DBConnection.getConnection();
        String sql = "DELETE FROM rooms WHERE room_id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, roomId);
        ps.executeUpdate();
    }

    /* Update Room Status */
    public boolean updateStatus(int roomId, String status) throws SQLException {
        Connection con = DBConnection.getConnection();
        String sql = "UPDATE rooms SET room_status=? WHERE room_id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, status);
        ps.setInt(2, roomId);
        int updated = ps.executeUpdate();
        return updated > 0;
    }
}
