package com.hotelbillingsystem.services;

import com.hotelbillingsystem.factory.DaoFactory;
import com.hotelbillingsystem.dao.RoomDao;
import com.hotelbillingsystem.models.Room;

import java.sql.SQLException;
import java.util.List;

public class RoomService {

    // Get DAO instance from factory
    private final RoomDao roomDao = DaoFactory.createRoomDao();

    /* Add a new room */
    public boolean addRoom(Room room) {
        try {
            if (room.getRoomCode() == null || room.getRoomCode().trim().isEmpty()) {
                return false;
            }
            if (room.getRoomName() == null || room.getRoomName().trim().isEmpty()) {
                return false;
            }

            roomDao.addRoom(room);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /* Get all rooms */
    public List<Room> getAllRooms() {
        try {
            return roomDao.getAllRooms();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    /* Get room by ID */
    public Room getRoomById(int roomId) {
        try {
            return roomDao.getRoomById(roomId);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    /* Search rooms by code or name */
    public List<Room> searchRooms(String keyword) {
        try {
            return roomDao.searchRooms(keyword);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    /* Update room */
    public boolean updateRoom(Room room) {
        try {
            if (room.getRoomCode() == null || room.getRoomCode().trim().isEmpty()) {
                return false;
            }
            if (room.getRoomName() == null || room.getRoomName().trim().isEmpty()) {
                return false;
            }

            return roomDao.updateRoom(room);

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /* Delete room */
    public boolean deleteRoom(int roomId) {
        try {
            roomDao.deleteRoom(roomId);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /* Update room status */
    public boolean updateStatus(int roomId, String status) {
        try {
            return roomDao.updateStatus(roomId, status);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
