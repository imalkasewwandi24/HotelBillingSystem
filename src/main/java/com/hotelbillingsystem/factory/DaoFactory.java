package com.hotelbillingsystem.factory;

import com.hotelbillingsystem.dao.UserDao;
import com.hotelbillingsystem.dao.ReservationDao;
import com.hotelbillingsystem.dao.RoomDao;


public class DaoFactory {


    public static UserDao createUserDao()
    {
        return new UserDao();
    }
    public static ReservationDao createReservationDao()
    {
        return new ReservationDao();
    }

    public static RoomDao createRoomDao()
    {
        return new RoomDao();
    }

}