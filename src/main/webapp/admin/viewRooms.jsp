<%@ page import="java.util.List, com.hotelbillingsystem.models.Room" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<Room> rooms = (List<Room>) request.getAttribute("rooms");
    String successMessage = (String) session.getAttribute("successMessage");
    String errorMessage = (String) session.getAttribute("errorMessage");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Rooms</title>

    <link href="../assets/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        body {
            background-color: #fff7e6;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .content-wrapper {
            margin-left: 280px;
            padding: 90px 40px 40px;
            display: flex;
            justify-content: center;
        }

        .card-box {
            width: 95%;
            background: #ffffff;
            border-radius: 18px;
            padding: 30px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.08);
            border: 1.5px solid #f1d6a3;
        }

        table {
            border-collapse: separate;
            border-spacing: 0 12px;
        }

        thead th {
            color: #666;
            font-weight: 600;
            border-bottom: 2px solid #f0f0f0;
            text-align: center;
        }

        tbody tr {
            background: #ffffff;
            border-radius: 14px;
            box-shadow: 0 5px 14px rgba(0, 0, 0, 0.07);
        }

        tbody td {
            padding: 15px;
            text-align: center;
            vertical-align: middle;
            border-top: none;
        }

        tbody tr td:first-child {
            border-radius: 14px 0 0 14px;
        }

        tbody tr td:last-child {
            border-radius: 0 14px 14px 0;
        }

        .btn-action {
            border-radius: 12px;
            padding: 6px 16px;
            font-size: 14px;
            font-weight: 500;
            border: 1.5px solid rgba(0, 0, 0, 0.15);
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .btn-edit {
            background-color: #ff9800;
            color: white;
            border-color: #f1a53a;
        }

        .btn-edit:hover {
            background-color: #fb8c00;
        }

        .btn-delete {
            background-color: #ff5252;
            color: white;
            border-color: #ff8a80;
        }

        .btn-delete:hover {
            background-color: #e53935;
        }

        .search-box {
            margin-bottom: 20px;
        }
    </style>
</head>

<body>

<%@ include file="layouts/sidebar.jsp" %>
<%@ include file="layouts/navbar.jsp" %>

<div class="content-wrapper">
    <div class="card-box">

        <!-- Success/Error Messages -->
        <% if (successMessage != null) { %>
        <div class="alert alert-success text-center mb-4">
            <%= successMessage %>
        </div>
        <% session.removeAttribute("successMessage"); } %>

        <% if (errorMessage != null) { %>
        <div class="alert alert-danger text-center mb-4">
            <%= errorMessage %>
        </div>
        <% session.removeAttribute("errorMessage"); } %>

        <!-- Search Box -->
        <form class="search-box" method="get" action="ViewRoomServlet">
            <div class="input-group">
                <input
                        type="text"
                        name="search"
                        class="form-control"
                        placeholder="Search by Room Code, Name"
                >
                <button class="btn btn-orange" type="submit">
                    <i class="fas fa-search"></i> Search
                </button>
            </div>
        </form>

        <!-- Room Table -->
        <div class="table-responsive">
            <table class="table align-middle">
                <thead>
                <tr>
                    <th>Room Code</th>
                    <th>Room Name</th>
                    <th>Description</th>
                    <th>Price/Night (LKR)</th>
                    <th>No. of Rooms</th>
                    <th>Max Guests</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>

                <tbody>
                <% if (rooms != null && !rooms.isEmpty()) {
                    for (Room r : rooms) { %>
                <tr>
                    <td><strong><%= r.getRoomCode() %></strong></td>
                    <td><%= r.getRoomName() %></td>
                    <td><%= r.getDescription() %></td>
                    <td><%= r.getPricePerNight() %></td>
                    <td><%= r.getNumberOfRooms() %></td>
                    <td><%= r.getMaxGuests() %></td>
                    <td><%= r.getRoomStatus() %></td>
                    <td>
                        <a href="<%= request.getContextPath() %>/admin/EditRoomServlet?roomId=<%= r.getRoomId() %>"
                           class="btn btn-action btn-edit">
                            <i class="fas fa-pen"></i> Edit
                        </a>

                        <a href="ViewRoomServlet?action=delete&roomId=<%= r.getRoomId() %>"
                           class="btn btn-action btn-delete"
                           onclick="return confirm('Delete room <%= r.getRoomCode() %>?')">
                            <i class="fas fa-trash"></i> Delete
                        </a>
                    </td>
                </tr>
                <% } } else { %>
                <tr>
                    <td colspan="8" class="text-muted">No rooms found</td>
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
