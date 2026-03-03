package com.hotelbillingsystem.services;

import com.hotelbillingsystem.models.Reservation;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.util.List;
import java.util.Date;

public class ReservationServiceTest {

    private ReservationService reservationService;

    @Before
    public void setup() {
        reservationService = new ReservationService();
    }

    @Test
    public void testGetAllReservations() {
        List<Reservation> reservations = reservationService.getAllReservations();

        Assert.assertNotNull(reservations);
        Assert.assertTrue(reservations.size() > 0);

        for (Reservation res : reservations) {
            System.out.println(
                    res.getR_id() + ", " +
                            res.getReservationId() + ", " +
                            res.getGuestName() + ", " +
                            res.getNic() + ", " +
                            res.getRoomType() + ", " +
                            res.getStatus()
            );
        }
    }

    @Test
    public void testGetReservationById() {
        Reservation res = reservationService.getReservationById(4);

        Assert.assertNotNull(res);

        System.out.println(
                res.getR_id() + ", " +
                        res.getReservationId() + ", " +
                        res.getGuestName() + ", " +
                        res.getNic() + ", " +
                        res.getRoomType() + ", " +
                        res.getStatus()
        );
    }

    @Test
    public void testSearchReservations() {
        List<Reservation> reservations = reservationService.searchReservations("RES006");

        Assert.assertNotNull(reservations);
        Assert.assertTrue(reservations.size() > 0);

        for (Reservation r : reservations) {
            System.out.println(
                    r.getR_id() + ", " +
                            r.getReservationId() + ", " +
                            r.getGuestName() + ", " +
                            r.getNic() + ", " +
                            r.getRoomType() + ", " +
                            r.getStatus()
            );
        }
    }

    // Test add reservation
    @Test
    public void testAddReservation() {

        Reservation reservation = new Reservation();
        reservation.setReservationId("RES1001");
        reservation.setGuestName("Test Guest");
        reservation.setNic("123456789V");
        reservation.setAddress("Colombo");
        reservation.setContactNumber("0771234567");
        reservation.setEmail("test@gmail.com");
        reservation.setRoomType("Deluxe");

        Date today = new Date();
        reservation.setCheckInDate(today);

        Date tomorrow = new Date(today.getTime() + (1000 * 60 * 60 * 24));
        reservation.setCheckOutDate(tomorrow);

        reservation.setStatus("CHECKED_IN");

        Assert.assertTrue(reservationService.addReservation(reservation));
    }

    // Test update reservation
    @Test
    public void testUpdateReservation() {
        Reservation reservation = reservationService.getReservationById(8);

        reservation.setGuestName("Updated Guest");
        reservation.setStatus("CHECKED_OUT");

        reservationService.updateReservation(reservation);

        Reservation updated = reservationService.getReservationById(8);

        Assert.assertEquals("Updated Guest", updated.getGuestName());
        Assert.assertEquals("CHECKED_OUT", updated.getStatus());
    }

    // Test delete reservation
    @Test
    public void testDeleteReservationById() {
        int reservationIdToDelete = 16;

        reservationService.deleteReservation(reservationIdToDelete);

        Reservation deleted = reservationService.getReservationById(reservationIdToDelete);

        Assert.assertNull(deleted);
    }
}