package com.hotelbillingsystem.services;

import com.hotelbillingsystem.dao.UserDao;
import com.hotelbillingsystem.factory.DaoFactory;
import com.hotelbillingsystem.models.User;
import com.hotelbillingsystem.utils.HashPassword;

import java.util.List;


public class UserServices {
    private final UserDao userDao = DaoFactory.createUserDao();

    public User login(String username, String password) {
        String hashedPassword = HashPassword.hashPassword(password);
        return userDao.login(username, hashedPassword);
    }

    public boolean register(User user) {
        String hashedPassword = HashPassword.hashPassword(user.getPassword());
        user.setPassword(hashedPassword);
        return userDao.register(user);
    }

    public List<User> getAllUsers() {
        return userDao.getAllUsers();
    }

    public void deleteUserById(int id) {
        userDao.deleteUserById(id);
    }

    public User getUserById(int id) {
        return userDao.getUserById(id);
    }

    public void updateUser(User user) {
        userDao.updateUser(user);
    }



}
