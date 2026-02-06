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

  <style>
    body { background-color: #fff7e6; }
    .content-wrapper { margin-left: 280px; padding: 90px 40px 40px; }
    .card-box {
      background: #ffffff;
      border-radius: 18px;
      padding: 30px;
      box-shadow: 0 12px 30px rgba(0,0,0,0.08);
    }
    table { border-collapse: separate; border-spacing: 0 12px; }
    thead th { text-align: center; font-weight: 600; }
    tbody td { text-align: center; vertical-align: middle; padding: 12px; }
  </style>
</head>

<body>

<%@ include file="layouts/sidebar.jsp" %>
<%@ include file="layouts/navbar.jsp" %>

<div class="content-wrapper">
  <div class="card-box">

    <h4 class="mb-4 text-center">Reservation Details</h4>

    <div class="table-responsive">
      <table class="table table-bordered align-middle">
        <thead>
        <tr>
          <th>Reservation ID</th>
          <th>Guest Name</th>
          <th>NIC</th>
          <th>Address</th>
          <th>Contact</th>
          <th>Email</th>
          <th>Room Type</th>
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
          <td colspan="11" class="text-center text-muted">No reservations found</td>
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


