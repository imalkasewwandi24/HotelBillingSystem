<%--
  Created by IntelliJ IDEA.
  User: imalka
  Date: 2/6/2026
  Time: 6:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List, com.hotelbillingsystem.models.Reservation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
    String successMessage = (String) session.getAttribute("successMessage");
    String errorMessage = (String) session.getAttribute("errorMessage");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Reservations</title>
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        body { background-color: #fff7e6; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .content-wrapper { margin-left: 280px; padding: 90px 40px 40px; display: flex; justify-content: center; }
        .card-box { width: 95%; background: #ffffff; border-radius: 18px; padding: 30px; box-shadow: 0 12px 30px rgba(0,0,0,0.08); border: 1.5px solid #f1d6a3; }
        table { border-collapse: separate; border-spacing: 0 12px; }
        thead th { color: #666; font-weight: 600; border-bottom: 2px solid #f0f0f0; text-align: center; }
        tbody tr { background: #ffffff; border-radius: 14px; box-shadow: 0 5px 14px rgba(0,0,0,0.07); }
        tbody td { padding: 15px; text-align: center; vertical-align: middle; border-top: none; }
        tbody tr td:first-child { border-radius: 14px 0 0 14px; }
        tbody tr td:last-child { border-radius: 0 14px 14px 0; }
        .btn-action { border-radius: 12px; padding: 6px 16px; font-size: 14px; font-weight: 500; border: 1.5px solid rgba(0,0,0,0.15); display: inline-flex; align-items: center; gap: 6px; }
        .btn-edit { background-color: #ff9800; color: white; border-color: #f1a53a; }
        .btn-edit:hover { background-color: #fb8c00; }
        .btn-delete { background-color: #ff5252; color: white; border-color: #ff8a80; }
        .btn-delete:hover { background-color: #e53935; }
        .btn-status { background-color: #4caf50; color: white; border-color: #45a049; }
        .btn-status:hover { background-color: #43a047; }
        .search-box { margin-bottom: 20px; }
    </style>
</head>
<body>

<%@ include file="layouts/sidebar.jsp" %>
<%@ include file="layouts/navbar.jsp" %>

<div class="content-wrapper">
    <div class="card-box">

        <!-- Success/Error Messages -->
        <% if (successMessage != null) { %>
        <div class="alert alert-success text-center mb-4"><%= successMessage %></div>
        <% session.removeAttribute("successMessage"); } %>
        <% if (errorMessage != null) { %>
        <div class="alert alert-danger text-center mb-4"><%= errorMessage %></div>
        <% session.removeAttribute("errorMessage"); } %>

        <!-- Search Box -->
        <form class="search-box" method="get" action="ViewReservationServlet">
            <div class="input-group">
                <input type="text" name="search" class="form-control" placeholder="Search by NIC or Reservation ID">
                <button class="btn btn-orange" type="submit"><i class="fas fa-search"></i> Search</button>
            </div>
        </form>

        <!-- Reservation Table -->
        <div class="table-responsive">
            <table class="table align-middle">
                <thead>
                <tr>

                    <th>Reservation ID</th>
                    <th>Guest Name</th>
                    <th>NIC</th>
                    <th>Contact Number</th>
                    <th>Room Code</th>
                    <th>Check-in</th>
                    <th>Check-out</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <% if (reservations != null && !reservations.isEmpty()) {
                    for (Reservation r : reservations) { %>
                <tr>

                    <td><strong><%= r.getReservationId() %></strong></td>
                    <td><%= r.getGuestName() %></td>
                    <td><%= r.getNic() %></td>
                    <td><%= r.getContactNumber() %></td>
                    <td><%= r.getRoomType() %></td>
                    <td><%= r.getCheckInDate() %></td>
                    <td><%= r.getCheckOutDate() %></td>
                    <td><%= r.getStatus() %></td>
                    <td>
                        <a href="<%= request.getContextPath() %>/cashier/EditReservationServlet?r_id=<%= r.getR_id() %>"
                           class="btn btn-action btn-edit"><i class="fas fa-pen"></i>Edit</a>

                        <a href="ViewReservationServlet?action=delete&r_id=<%= r.getR_id() %>"
                           class="btn btn-action btn-delete"
                           onclick="return confirm('Delete reservation <%= r.getReservationId() %>?')">
                            <i class="fas fa-trash"></i>Delete</a>

                        <% if ("CHECKED_IN".equals(r.getStatus())) { %>
                        <a href="ViewReservationServlet?action=status&r_id=<%= r.getR_id() %>&status=CHECKED_OUT"
                           class="btn btn-action btn-status">Check-out</a>
                        <% } else { %>
                        <a href="ViewReservationServlet?action=status&r_id=<%= r.getR_id() %>&status=CHECKED_IN"
                           class="btn btn-action btn-status">Check-in</a>
                        <% } %>
                    </td>
                </tr>
                <% } } else { %>
                <tr>
                    <td colspan="9" class="text-muted">No reservations found</td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>

    </div>
</div>

<script src="../assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>

