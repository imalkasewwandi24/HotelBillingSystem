package com.hotelbillingsystem.services;

import com.hotelbillingsystem.models.Reservation;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.util.List;

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
}