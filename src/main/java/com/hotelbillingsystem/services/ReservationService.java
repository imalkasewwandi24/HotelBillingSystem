package com.hotelbillingsystem.services;

import com.hotelbillingsystem.factory.DaoFactory;
import com.hotelbillingsystem.dao.ReservationDao;
import com.hotelbillingsystem.models.Reservation;

import java.sql.SQLException;
import java.util.List;

public class ReservationService {

    // Get DAO instance from factory
    private final ReservationDao reservationDao = DaoFactory.createReservationDao();

    /* Add a new reservation */
    public boolean addReservation(Reservation reservation) {
        try {
            // Example validation: guest name must not be empty
            if (reservation.getGuestName() == null || reservation.getGuestName().trim().isEmpty()) {
                return false;
            }

            reservationDao.addReservation(reservation);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /* Get all reservations */
    public List<Reservation> getAllReservations() {
        try {
            return reservationDao.getAllReservations();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    /* Get  reservation by r id */
    public Reservation getReservationById(int r_id) {
        try {
            return reservationDao.getReservationById(r_id);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    /* Search reservation by nic or reservation id */
    public List<Reservation> searchReservations(String keyword) {
        try {
            return reservationDao.searchReservation(keyword);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    /* Update reservation  */
    public boolean updateReservation(Reservation reservation) {
        try {
            if (reservation.getGuestName() == null || reservation.getGuestName().trim().isEmpty()) {
                return false;
            }

            return reservationDao.updateReservation(reservation);

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /* Delete reservation  */
    public boolean deleteReservation(int r_id) {
        try {
            reservationDao.deleteReservation(r_id);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /* Update reservation status  */
    public boolean updateStatus(int r_id, String status) {
        try {
            return reservationDao.updateStatus(r_id, status);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
