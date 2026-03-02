package com.hotelbillingsystem.services;

import com.hotelbillingsystem.models.User;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.util.List;

public class UserServicesTest {

    private UserServices userServices;

    @Before
    public void setup() {
        userServices = new UserServices();
    }

    // Test login with existing admin user
    @Test
    public void testLoginAdminSuccess() {

        User user = userServices.login("Admin1", "Admin@123");

        Assert.assertNotNull(user);
        Assert.assertEquals("Admin1", user.getUsername());
        Assert.assertEquals("admin123@gmail.com", user.getEmail());
    }

    // Test login with existing receptionist user
    @Test
    public void testLoginReceptionistSuccess() {

        User user = userServices.login("Receptionist1", "Receptionist@123");

        Assert.assertNotNull(user);
        Assert.assertEquals("Receptionist1", user.getUsername());
    }

    // Test login fail
    @Test
    public void testLoginFail() {

        User user = userServices.login("invaliduser", "wrongpass");

        Assert.assertNull(user);
    }

    // Test get all users
    @Test
    public void testGetAllUsers() {

        List<User> users = userServices.getAllUsers();

        Assert.assertNotNull(users);
        Assert.assertTrue(users.size() > 0);


        System.out.println("Total users fetched: " + users.size());

        for (User user : users) {
            System.out.println("User: " + user.getUsername() + ", Email: " + user.getEmail());
        }
    }

    // Test get user by ID
    @Test
    public void testGetUserById() {

        User user = userServices.getUserById(20);

        Assert.assertNotNull(user);


        System.out.println("Fetched user by ID:");
        System.out.println("ID: " + user.getId());
        System.out.println("Username: " + user.getUsername());
        System.out.println("Email: " + user.getEmail());
    }

    @Test
    public void testAddUser() {
        User user = new User();
        user.setUsername("TestUser");
        user.setPassword("test123");
        user.setEmail("testuser@gmail.com");
        user.setUsertype(1);
        Assert.assertTrue(userServices.register(user));
    }

    @Test
    public void testUpdateUser() {
        User user = userServices.getUserById(29);
        user.setEmail("updated@gmail.com");
        userServices.updateUser(user);

        User updated = userServices.getUserById(29);
        Assert.assertEquals("updated@gmail.com", updated.getEmail());
    }

    @Test
    public void testDeleteUserById() {
        int userIdToDelete = 29;

        userServices.deleteUserById(userIdToDelete);

        User deletedUser = userServices.getUserById(userIdToDelete);
        Assert.assertNull(deletedUser);
    }


}