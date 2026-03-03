<%--
  Created by IntelliJ IDEA.
  User: imalka
  Date: 2/6/2026
  Time: 7:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List, com.hotelbillingsystem.models.Reservation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
%>

<!DOCTYPE html>
<html>
<head>
  <title>All Reservations</title>

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
    <form class="search-box" method="get" action="ViewReservationServlet">
      <div class="input-group">
        <input
                type="text"
                name="search"
                class="form-control"
                placeholder="Search by NIC or Reservation ID"
                value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>"
        >
        <button class="btn btn-orange" type="submit">
          <i class="fas fa-search"></i> Search
        </button>
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
          <th>Address</th>
          <th>Contact</th>
          <th>Email</th>
          <th>Room Code</th>
          <th>Check-In</th>
          <th>Check-Out</th>
          <th>Status</th>
        </tr>
        </thead>

        <tbody>
        <% if (reservations != null && !reservations.isEmpty()) {
          for (Reservation r : reservations) { %>
        <tr>
          <td><strong><%= r.getReservationId() %></strong></td>
          <td><%= r.getGuestName() %></td>
          <td><%= r.getNic() %></td>
          <td><%= r.getAddress() %></td>
          <td><%= r.getContactNumber() %></td>
          <td><%= r.getEmail() %></td>
          <td><%= r.getRoomType() %></td>
          <td><%= r.getCheckInDate() %></td>
          <td><%= r.getCheckOutDate() %></td>
          <td>
            <span class="badge bg-<%= "CHECKED_IN".equals(r.getStatus()) ? "success" : "secondary" %>">
              <%= r.getStatus() %>
            </span>
          </td>
        </tr>
        <% } } else { %>
        <tr>
          <td colspan="10" class="text-muted text-center">No reservations found</td>
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
