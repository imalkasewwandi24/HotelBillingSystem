package com.hotelbillingsystem.factory;

import com.hotelbillingsystem.dao.UserDao;


public class DaoFactory {


    public static UserDao createUserDao() {
        return new UserDao();
    }

}