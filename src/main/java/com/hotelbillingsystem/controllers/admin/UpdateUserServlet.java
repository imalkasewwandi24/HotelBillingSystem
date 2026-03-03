package com.hotelbillingsystem.controllers.admin;

import com.hotelbillingsystem.models.User;
import com.hotelbillingsystem.services.UserServices;
import com.hotelbillingsystem.utils.HashPassword;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {

    private final UserServices userService = new UserServices();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int usertype = Integer.parseInt(request.getParameter("usertype"));

        // Get existing user (for old password)
        User existingUser = userService.getUserById(userId);

        User user = new User();
        user.setId(userId);
        user.setUsername(username);
        user.setEmail(email);
        user.setUsertype(usertype);

        //password handling
        if (password != null && !password.trim().isEmpty()) {
            user.setPassword(HashPassword.hashPassword(password)); // hash NEW password
        } else {
            user.setPassword(existingUser.getPassword()); // keep OLD hashed password
        }

        userService.updateUser(user);

        request.getSession().setAttribute("successMessage", "User updated successfully!");
        response.sendRedirect(request.getContextPath() + "/admin/UserManagementServlet");
    }
}
