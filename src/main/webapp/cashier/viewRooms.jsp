<%--
  Created by IntelliJ IDEA.
  User: imalka
  Date: 2/9/2026
  Time: 6:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List, com.hotelbillingsystem.models.Room" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  List<Room> rooms = (List<Room>) request.getAttribute("rooms");
%>

<!DOCTYPE html>
<html>
<head>
  <title>All Rooms</title>

  <link href="../assets/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

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
      box-shadow: 0 12px 30px rgba(0,0,0,0.08);
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
      box-shadow: 0 5px 14px rgba(0,0,0,0.07);
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

    .search-box {
      margin-bottom: 20px;
    }

    .btn-orange {
      background-color: #ff9800;
      color: white;
      border: 1.5px solid #f1a53a;
    }

    .btn-orange:hover {
      background-color: #fb8c00;
    }
  </style>
</head>

<body>

<%@ include file="layouts/sidebar.jsp" %>
<%@ include file="layouts/navbar.jsp" %>

<div class="content-wrapper">
  <div class="card-box">

    <!-- Search Box -->
    <form class="search-box" method="get" action="ViewRoomServlet">
      <div class="input-group">
        <input
                type="text"
                name="search"
                class="form-control"
                placeholder="Search by Room Code or Name"
                value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>"
        >
        <button class="btn btn-orange" type="submit">
          <i class="fas fa-search"></i> Search
        </button>
      </div>
    </form>

    <!-- Rooms Table -->
    <div class="table-responsive">
      <table class="table align-middle">
        <thead>
        <tr>
          <th>Room Code</th>
          <th>Room Name</th>
          <th>Description</th>
          <th>Price/Night</th>
          <th>No. of Room</th>
          <th>Max Guests</th>
          <th>Status</th>
        </tr>
        </thead>

        <tbody>
        <% if (rooms != null && !rooms.isEmpty()) {
          for (Room r : rooms) {
            String badgeColor = "secondary"; // default
            switch (r.getRoomStatus()) {
              case "Available": badgeColor = "success"; break;
              case "Occupied": badgeColor = "danger"; break;
              case "Maintenance": badgeColor = "warning"; break;
            }
        %>
        <tr>
          <td><strong><%= r.getRoomCode() %></strong></td>
          <td><%= r.getRoomName() %></td>
          <td><%= r.getDescription() %></td>
          <td><%= r.getPricePerNight() %></td>
          <td><%= r.getNumberOfRooms() %></td>
          <td><%= r.getMaxGuests() %></td>
          <td>
            <span class="badge bg-<%= badgeColor %>">
              <%= r.getRoomStatus() %>
            </span>
          </td>
        </tr>
        <% } } else { %>
        <tr>
          <td colspan="7" class="text-muted text-center">No rooms found</td>
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

