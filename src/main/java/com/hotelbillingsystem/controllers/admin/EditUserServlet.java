package com.hotelbillingsystem.controllers.admin;

import com.hotelbillingsystem.models.User;
import com.hotelbillingsystem.services.UserServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/EditUserServlet")
public class EditUserServlet extends HttpServlet {
    private final UserServices userService = new UserServices();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("id"));
        User user = userService.getUserById(userId);

        request.setAttribute("editUser", user);
        request.getRequestDispatcher("/admin/editUser.jsp").forward(request, response);
    }
}
