package com.hotelbillingsystem.controllers.admin;

import com.hotelbillingsystem.models.User;
import com.hotelbillingsystem.services.UserServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/UserManagementServlet")
public class UserManagementServlet extends HttpServlet {
    private final UserServices userService = new UserServices();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        /*Delete User web request*/
        String action = request.getParameter("action");
        if ("delete".equalsIgnoreCase(action)) {
            int userId = Integer.parseInt(request.getParameter("id"));
            User user = userService.getUserById(userId);
            HttpSession session = request.getSession();

            if (user != null) {
                if (user.getUsertype() == 0 || user.getUsertype() == 1) {
                    userService.deleteUserById(userId);
                    session.setAttribute("successMessage",
                            "User (" + user.getUsername() + ") deleted successfully!");
                } else {
                    session.setAttribute("errorMessage", "This user type cannot be deleted!");
                }
            } else {
                session.setAttribute("errorMessage", "User not found!");
            }

            response.sendRedirect("UserManagementServlet");
            return;
        }

        /*Edit User web request*/
        List<User> users = userService.getAllUsers();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/admin/viewUser.jsp").forward(request, response);
    }
}
